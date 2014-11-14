#include "common.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"

#include "lfunc.h"
#include "lmem.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lstring.h"
#include "lundump.h"

#include "lua-compat.h"

#ifndef SRCVERSION
	#include "srcversion.h"
#endif

#ifndef LUA_DEBUG
	#define luaB_opentests(L)
#endif

#ifndef PROGNAME
	#define PROGNAME "LuaReplace"		/* program name */
#endif

#define	OUTPUT "luareplace.out"			/* default output file */

#define VERSION "1.0"

#define VERSION_STRING VERSION " rev: " SRCVERSION

int debug = 0;							/* debug decompiler? */
static int printfuncnum = 0;			/* print function nums? */
static int strict = 1;					/* strict mode? */
static int replace_sub = 0;				/* replace all sub functions of dest function with src function? */

lua_State* glstate;

static char Output[] = { OUTPUT };		/* default output file name */
static const char* output = Output;		/* output file name */
static const char* progname = PROGNAME;	/* actual program name */

static void fatal(const char* message) {
	fprintf(stderr, "%s: %s\n", progname, message);
	if (glstate) {
		lua_close(glstate);
	}
	exit(EXIT_FAILURE);
}

static void cannot(const char* what) {
	fprintf(stderr, "%s: cannot %s %s: %s\n", progname, what, output, strerror(errno));
	exit(EXIT_FAILURE);
}

static void usage(const char* message, const char* arg) {
	if (message != NULL) {
		fprintf(stderr ,"%s: " ,progname);
		fprintf(stderr, message, arg);
		fprintf(stderr, "\n");
	}
	fprintf(stderr,
		"LuaReplace " VERSION_STRING " for " LUA_VERSION "\n"
		" Inspired by Co0kieMonster's LuaTool\n"
		" by VirusCamp (https://github.com/viruscamp/luadec)\n"
		"usage: %s [options] <dest.lua> <dest num> <src.lua> <src num> \n"
		" Replace function <dest num> of <dest.lua> with function <src num> of <src.lua> .\n"
		" Available options are:\n"
		"  -o name  output to file 'name' (default is \"%s\")\n"
		"  -pn      print all sub function numbers of <dest.lua> and exit\n"
		"  -ls      turn strip mode off, try to replacing incompatible function with different numparams nups or is_vararg\n"
		"  -rs      replace sub functions of dest function with those of src function\n"
		"  -v       show version information\n"
		"  --       stop handling options\n",
		progname, Output);
	exit(EXIT_FAILURE);
}

#define	IS(s) (strcmp(argv[i],s)==0)

static int doargs(int argc, char* argv[]) {
	int i;
	if (argv[0] != NULL && *argv[0] != 0) {
		progname = argv[0];
	}
	for (i = 1; i < argc; i++) {
		if (*argv[i] != '-') {		/* end of options; keep it */
			break;
		}
		else if (IS("--")) {		/* end of options; skip it */
			++i;
			break;
		}
		else if (IS("-o")) {		/* output file */
			output = argv[++i];
			if (output == NULL || *output == 0) {
				usage("'-o' needs argument", NULL);
			}
		}
		else if (IS("-pn")) {
			printfuncnum = 1;
		}
		else if (IS("-ls")) {		/* turn strict mode off*/
			strict = 0;
		}
		else if (IS("-rs")) {
			replace_sub = 1;
		}
		else if (IS("-v")) {		/* show version */
			printf("LuaReplace " VERSION_STRING " for " LUA_VERSION "\n");
			exit(EXIT_SUCCESS);
		}
		else {						/* unknown option */
			usage("unrecognized option '%s'", argv[i]);
		}
	}
	return i;
}

void printFuncStructure(Proto * f, char* indent) {
	int i;
	char* newindent = (char*)calloc(strlen(indent)+10, sizeof(char));
	for (i = 0; i < f->sizep; i++) {
		printf("%s%d\n", indent, i);
		sprintf(newindent, "  %s%d_", indent, i);
		printFuncStructure(f->p[i], newindent);
	}
	free(newindent);
}

Proto* toproto(lua_State* L, int i) {
	const Closure* c=(const Closure*)lua_topointer(L,i);
	return c->l.p;
}

Proto* findParentFunction(Proto* f, const char* funcnumstr, int* subindex, char* realfuncnumstr) {
	Proto* cf = f;
	Proto* pf = NULL;
	const char* startstr = funcnumstr;
	const char* endstr;

	int c = atoi(startstr);
	if (c != 0) {
		// not found, *subindex = -1, return NULL as parent
		*subindex = -1;
		return NULL;
	}
	endstr = strchr(startstr, '_');
	startstr = endstr + 1;
	sprintf(realfuncnumstr, "0");

	while (!(endstr == NULL)) {
		c = atoi(startstr);
		if (c < 0 || c >= cf->sizep) {
			// not found, *subindex = -1, return NULL as parent
			*subindex = -1;
			return NULL;
		}
		pf = cf;
		cf = pf->p[c];
		endstr = strchr(startstr, '_');
		startstr = endstr + 1;
		sprintf(realfuncnumstr + strlen(realfuncnumstr), "_%d", c);
	}
	// found, *subindex >= 0, if return NULL, means subfunction is f
	*subindex = c;
	return pf;
}

int checkProto(const Proto* fleft, const Proto* fright, int c) {
	char warnmessage[64];
	int diff = 0, stop = 0;
	*warnmessage = '\0';
	if (fleft->numparams != fright->numparams) {
		diff++;
		strcat(warnmessage, "numparams ");
	}
	if (NUPS(fleft) != NUPS(fright)) {
		diff++;
		strcat(warnmessage, "nups ");
		stop = 1;
	}
	if (fleft->is_vararg != fright->is_vararg) {
		diff++;
		strcat(warnmessage, "is_vararg ");
	}
	if (diff > 0) {
		if (c >= 0) {
			fprintf(stderr, "  warning! incompatible function %d : different %s", c, warnmessage);
		} else {
			fprintf(stderr, "  warning! incompatible function : different %s", warnmessage);
		}
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		if (stop > 0) {
			fatal(LUA_VERSION " cannot replace function with different nups");
		}
#endif
	}
	return diff;
}

int replaceFunction(Proto* fparent, int cdest, Proto* fsrc) {
	int diff = checkProto(fparent->p[cdest], fsrc, -1);
	Proto* freplaced = fparent->p[cdest];
	UPVAL_TYPE* upvalues = fsrc->upvalues;
	fsrc->upvalues = freplaced->upvalues;
	freplaced->upvalues = upvalues;
	fparent->p[cdest] = fsrc;
	return diff;
}

#define MIN(a,b) (((a)<(b))?(a):(b))

int replaceSubFunctions(Proto* fdest, Proto* fsrc) {
	int i;
	int diff = 0;
	UPVAL_TYPE* upvalues;
	Proto* freplaced;
	int minsizep = MIN(fdest->sizep, fsrc->sizep);
	for (i = 0; i < minsizep; i++) {
		diff += checkProto(fdest->p[i], fsrc->p[i], i);
		
		upvalues = fsrc->p[i]->upvalues;
		fsrc->p[i]->upvalues = fdest->p[i]->upvalues;
		fdest->p[i]->upvalues = upvalues;
		
		freplaced = fdest->p[i];
		fdest->p[i] = fsrc->p[i];
		fsrc->p[i] = freplaced;
	}
	return diff;
}

static int writer(lua_State* L, const void* p, size_t size, void* u) {
	UNUSED(L);
	return (fwrite(p, size, 1, (FILE*)u) != 1) && (size != 0);
}

int gargc = 0;
char** gargv = NULL;

int main(int argc, char* argv[]) {
	lua_State* L;
	const char *destfile, *destnum, *srcfile, *srcnum;
	Proto *fdestroot, *fsrcroot, *fparent, *fdest, *fsrc;
	int cdest, csrc;
	char *realdestnum = NULL, *realsrcnum = NULL;
	FILE* D;
	int diff, i;

	gargc = argc;
	gargv = argv;
	i = doargs(argc,argv);
	argc -= i;
	argv += i;

	if (printfuncnum && argc < 1) {
		usage("need 1 arguments for -pn at least", NULL);
	}
	if (argc < 4) {
		usage("need 4 arguments at least", NULL);
	}

	L = lua_open();
	glstate = L;
	luaB_opentests(L);

	destfile = argv[0];
	destnum = argv[1];
	if (luaL_loadfile(L, destfile) != 0) {
		fatal(lua_tostring(L, -1));
	}
	fdestroot = toproto(L, -1);

	if (printfuncnum) {
		printf("%d\n",0);
		printFuncStructure(fdestroot, "  0_");
		lua_close(L);
		return EXIT_SUCCESS;
	}

	realdestnum = (char*)calloc(strlen(destnum)+1, sizeof(char));
	fparent = findParentFunction(fdestroot, destnum, &cdest, realdestnum);
	if (cdest < 0) {
		if (realdestnum) { free(realdestnum); realdestnum = NULL; }
		fatal("cannot find dest function");
	}
	if (fparent == NULL) {
		fdest = fdestroot;
	} else {
		fdest = fparent->p[cdest];
	}

	srcfile = argv[2];
	srcnum = argv[3];
	if (luaL_loadfile(L, srcfile) != 0) {
		fatal(lua_tostring(L, -1));
	}
	fsrcroot = toproto(L, -1);
	realsrcnum = (char*)calloc(strlen(srcnum)+1, sizeof(char));
	fsrc = findParentFunction(fsrcroot, srcnum, &csrc, realsrcnum);
	if (csrc < 0) {
		if (realdestnum) { free(realdestnum); realdestnum = NULL; }
		if (realsrcnum) { free(realsrcnum); realsrcnum = NULL; }
		fatal("cannot find src function");
	}
	if (fsrc == NULL) {
		fsrc = fsrcroot;
	} else {
		fsrc = fsrc->p[csrc];
	}

	if (!replace_sub) {
		if (fparent == NULL) {
			if (realdestnum) { free(realdestnum); realdestnum = NULL; }
			if (realsrcnum) { free(realsrcnum); realsrcnum = NULL; }
			fatal("cannot use root as dest function");
		}
		fprintf(stderr, "Replacing %s %s with %s %s ...\n", destfile, realdestnum, srcfile, realsrcnum);
		diff = replaceFunction(fparent, cdest, fsrc);
		fprintf(stderr, "1 function replaced.\n");
	} else {
		fprintf(stderr, "Replacing sub functions of %s %s with those of %s %s ...\n", destfile, realdestnum, srcfile, realsrcnum);
		diff = replaceSubFunctions(fdest, fsrc);
		fprintf(stderr, "%d functions replaced.", MIN(fdest->sizep, fsrc->sizep));
		if (fdest->sizep != fsrc->sizep) {
			fprintf(stderr, " The dest has %d sub functions, but the src has %d . Please have a check.\n", fdest->sizep, fsrc->sizep);
		} else {
			fprintf(stderr, "\n");
		}
	}

	if (realdestnum) { free(realdestnum); realdestnum = NULL; }
	if (realsrcnum) { free(realsrcnum); realsrcnum = NULL; }

	if (strict == 1 && diff > 0) {
		fatal("strip mode on and incompatible functions found, stop writing output.");
	}

	D = (output == NULL) ? stdout : fopen(output, "wb");
	if (D == NULL) cannot("open");
	lua_lock(L);
	luaU_dump(L, fdestroot, writer, D, 0);
	lua_unlock(L);
	if (ferror(D)) cannot("write");
	if (fclose(D)) cannot("close");

	printf("%s generated!\n", output);

	lua_close(L);
	return EXIT_SUCCESS;
}
