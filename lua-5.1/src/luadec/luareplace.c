#include "common.h"

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

#define VERSION "2.2"

#define VERSION_STRING VERSION " rev: " SRCVERSION

int debug = 0;							/* debug decompiler? */
static int strict = 0;					/* strict mode? */
static int replace_sub = 0;				/* replace all sub functions of dest function with src function? */

lua_State* glstate;
Proto* glproto;

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
		"LuaReplace " VERSION_STRING "\n"
		" Inspired by Co0kieMonster's LuaTool\n"
		" by VirusCamp (http://luadec.googlecode.com)\n"
		"usage: %s [options] <dest.lua> <dest num> <src.lua> <src num> .  Available options are:\n"
		"  -o name  output to file 'name' (default is \"%s\")\n"
		"  -s       strip mode on, stop on replacing incompatible function with different numparams nups or is_vararg\n"
		"  -rs      replace all sub functions of dest function with src function\n"
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
	for (i=1; i<argc; i++) {
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
		else if (IS("-s")) {		/* strict mode */
			strict = 1;
		}
		else if (IS("-rs")) {
			replace_sub = 1;
		}
		else if (IS("-v")) {		/* show version */
			printf("LuaReplace " VERSION_STRING "\n");
			exit(EXIT_SUCCESS);
		}
		else {						/* unknown option */
			usage("unrecognized option '%s'", argv[i]);
		}
	}
	return i;
}

Proto* toproto(lua_State* L, int i) {
	const Closure* c=(const Closure*)lua_topointer(L,i);
	return c->l.p;
}

int gargc = 0;
char** gargv = NULL;
int filename_argv_from = 0;

int printFileNames(FILE* out) {
	int i;
	if (gargc > filename_argv_from) {
		fprintf(out, "%s", gargv[filename_argv_from]);
		for (i = filename_argv_from+1; i < gargc; i++) {
			fprintf(out, " , %s", gargv[i]);
		}
	}
	return gargc - filename_argv_from;
}

Proto* findParentFunction(Proto* f, const char* funcnumstr, int* subindex, char* realfuncnumstr) {
	Proto* cf = f;
	Proto* pf = NULL;
	const char* startstr = funcnumstr;
	const char* endstr;

	int c = atoi(startstr);
	if (c != 0) {
		return NULL;
	}
	endstr = strchr(startstr, '_');
	startstr = endstr + 1;
	sprintf(realfuncnumstr, "0");

	while (!(endstr == NULL)) {
		c = atoi(startstr);
		if (c < 0 || c >= cf->sizep) {
			return NULL;
		}
		pf = cf;
		cf = pf->p[c];
		endstr = strchr(startstr, '_');
		startstr = endstr + 1;
		sprintf(realfuncnumstr + strlen(realfuncnumstr), "_%d", c);
	}
	*subindex = c;
	return pf;
}

int checkProto(const Proto* fleft, const Proto* fright) {
	char warnmessage[200];
	int diff = 0;
	*warnmessage = '\0';
	if (fleft->numparams != fright->numparams){
		diff++;
		strcat(warnmessage, " numparams");
	}
	if (fleft->nups != fright->nups){
		diff++;
		strcat(warnmessage, " nups");
	}
	if (fleft->is_vararg != fright->is_vararg){
		diff++;
		strcat(warnmessage, " is_vararg");
	}
	if (diff > 0){
		fprintf(stderr, "warning! incompatible function : different %s", warnmessage);
	}
	return diff;
}

int replaceFunction(Proto* fparent, int cdest, Proto* fsrc) {
	int diff = checkProto(fparent->p[cdest], fsrc);
	fparent->p[cdest] = fsrc;
	if (diff > 0){
		return diff;
	}
	return 0;
}

#define MIN(a,b) (((a)<(b))?(a):(b))

int replaceSubFunctions(Proto* fdest, Proto* fsrc) {
	int i = 0, diff = 0;
	int minsizep = MIN(fdest->sizep, fsrc->sizep);
	for (i = 0; i < minsizep; i++){
		diff += checkProto(fdest->p[i], fsrc->p[i]);
		fdest->p[i] = fsrc->p[i];
	}
	if (diff > 0){
		return diff;
	}
	return 0;
}

static int writer(lua_State* L, const void* p, size_t size, void* u)
{
	UNUSED(L);
	return (fwrite(p, size, 1, (FILE*)u) != 1) && (size != 0);
}

int main(int argc, char* argv[]) {
	lua_State* L;
	Proto *ftemp, *fparent, *fdest, *fsrc;
	int cdest, csrc;
	char *realdestnum = NULL, *realsrcnum = NULL;
	int diff;
	int i;
	gargc = argc;
	gargv = argv;
	i = doargs(argc,argv);
	argc -= i;
	argv += i;
	filename_argv_from = i;
	if (argc <= 3) {
		usage("need 4 arguments at least", NULL);
	}
	L = lua_open();
	glstate = L;
	luaB_opentests(L);

	if (luaL_loadfile(L, argv[0]) != 0) {
		fatal(lua_tostring(L, -1));
	}
	ftemp = toproto(L, -1);
	realdestnum = (char*)calloc(strlen(argv[1]), sizeof(char));
	fparent = findParentFunction(ftemp, argv[1], &cdest, realdestnum);
	if (fparent == NULL) {
		if (realdestnum) { free(realdestnum); realdestnum = NULL; }
		fatal("cannot find dest function");
	}
	fdest = fparent->p[cdest];

	if (luaL_loadfile(L, argv[2]) != 0) {
		fatal(lua_tostring(L, -1));
	}
	ftemp = toproto(L, -1);
	realsrcnum = (char*)calloc(strlen(argv[3]), sizeof(char));
	fsrc = findParentFunction(ftemp, argv[3], &csrc, realsrcnum);
	if (fsrc == NULL) {
		if (realdestnum) { free(realdestnum); realdestnum = NULL; }
		if (realsrcnum) { free(realsrcnum); realsrcnum = NULL; }
		fatal("cannot find src function");
	}
	fsrc = fsrc->p[csrc];

	if (!replace_sub){
		diff = replaceFunction(fparent, cdest, fsrc);
	} else {
		diff = replaceSubFunctions(fdest, fsrc);
	}

	if (realdestnum) { free(realdestnum); realdestnum = NULL; }
	if (realsrcnum) { free(realsrcnum); realsrcnum = NULL; }

	if (diff > 0){
		fatal("strip mode on, stop on replacing incompatible function with different numparams nups or is_vararg");
	}

	FILE* D = (output == NULL) ? stdout : fopen(output, "wb");
	if (D == NULL) cannot("open");
	lua_lock(L);
	luaU_dump(L, fdest, writer, D, 0);
	lua_unlock(L);
	if (ferror(D)) cannot("write");
	if (fclose(D)) cannot("close");

	lua_close(L);
	return EXIT_SUCCESS;
}
