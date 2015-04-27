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

#include "lua-compat.h"
#include "proto.h"
#include "decompile.h"
#include "disassemble.h"

#ifndef SRCVERSION
	#include "srcversion.h"
#endif

#ifndef LUA_DEBUG
	#define luaB_opentests(L)
#endif

#ifndef PROGNAME
	#define PROGNAME "LuaDec"	/* program name */
#endif

#define	OUTPUT "luadec.out"		/* default output file */

#define VERSION "2.2"

#define VERSION_STRING VERSION " rev: " SRCVERSION

int debug=0;					/* debug decompiler? */
static char* funcnumstr=NULL;
static int printfuncnum=0;      /* print function nums? */
static int dumping=1;			/* dump bytecodes? */
static int stripping=0;			/* strip debug information? */
static int disassemble=0;		/* disassemble? */
int locals=0;					/* strip debug information? */
int localdeclare[255][255];
int functionnum;
int process_sub = 1;            /* process sub functions? */
int func_check=0;				/* compile decompiled function and compare? */
int string_encoding=GBK;
int guess_locals=1;
lua_State* glstate;
Proto* glproto;
static int lds2=0;
char* LDS2;
static char Output[]={ OUTPUT };		/* default output file name */
static const char* output=Output;		/* output file name */
static const char* progname=PROGNAME;	/* actual program name */

static void fatal(const char* message) {
	fprintf(stderr,"%s: %s\n",progname,message);
	if (glstate) {
		lua_close(glstate);
	}
	exit(EXIT_FAILURE);
}

static void usage(const char* message, const char* arg) {
	if (message!=NULL) {
		fprintf(stderr,"%s: ",progname); fprintf(stderr,message,arg); fprintf(stderr,"\n");
	}
	fprintf(stderr,
		"LuaDec " VERSION_STRING " for " LUA_VERSION "\n"
		" Original by Hisham Muhammad (http://luadec.luaforge.net)\n"
		" Ongoing port to Lua 5.1 by Zsolt Sz. Sztupak (http://winmo.sztupy.hu)\n"
		" by VirusCamp (https://github.com/viruscamp/luadec)\n"
		"usage: %s [options] [filename].  Available options are:\n"
		"  -        process stdin\n"
		"  -d       output information for debugging the decompiler\n"
		"  -dis     don't decompile, just disassemble\n"
		"  -f num   decompile only specific function, use -pn option to get available num\n"
		"  -ns      donot process sub functions\n"
		"  -pn      print all sub function numbers and exit\n"
		"  -l LDS   declare locals as defined by LDS\n"
		"  -l2 LDS2 declare locals as defined by LDS2\n"
		"  -dg      disable built-in local guessing\n"
		"  -pg      don't run just print out the LDS2 string used\n"
		"  -s       strip compiled code before decompiling\n"
		"  -a       always declare all register as locals\n"
		"  -fc      compile decompiled function and compare\n"
		"  -se      output strings using selected encoding, available encodings are "ENCODINGS"\n"
		"  --       stop handling options\n", progname);
	exit(EXIT_FAILURE);
}

#define	IS(s)	(strcmp(argv[i],s)==0)

int Inject(Proto * fp, int functionnum) {
	int f,i,c,n,at;
	char number[255];
	for (f=0;f<2;f++) {
		for (i=0;i<255;i++) {
			localdeclare[f][i] = -1;
		}
	}
	f = 0;
	i = 0;
	c = 0;
	n = 0;
	at = 0;
	while (LDS2[c]!='\0') {
		switch (LDS2[c]) {
		case '-':
			if (n!=0) {
				if (f==functionnum) {
					localdeclare[at][i] = atoi(number);
				}
			}
			at=1;
			n=0;
			break;
		case ',':
			if (n!=0) {
				if (f==functionnum) {
					localdeclare[at][i] = atoi(number);
				}
			}
			i++;
			n=0;
			at=0;
			break;
		case ';':
			if (n!=0) {
				if (f==functionnum) {
					localdeclare[at][i] = atoi(number);
				}
			}
			i=0;
			n=0;
			at=0;
			f++;
			break;
		default:
			number[n] = LDS2[c];
			n++;
			number[n] = '\0';
			break;
		}
		c++;
	}
	if (n!=0) {
		if (f==functionnum) {
			localdeclare[at][i] = atoi(number);
		}
	}

	fp->sizelocvars = 0;
	for (i=0; i<255;i++) {
		if (localdeclare[0][i] != -1) {
			fp->sizelocvars++;
		}
	}

	if (fp->sizelocvars>0) {
		fp->locvars = luaM_newvector(glstate,fp->sizelocvars,LocVar);
		for (i=0; i<fp->sizelocvars;i++) {
			char names[10];
			sprintf(names,"l_%d_%d",functionnum,i+fp->numparams);
			fp->locvars[i].varname = luaS_new(glstate, names);
			fp->locvars[i].startpc = localdeclare[0][i];
			fp->locvars[i].endpc = localdeclare[1][i];
		}
	}

	for (f=0;f<2;f++) {
		for (i=0;i<255;i++) {
			localdeclare[f][i] = -1;
		}
	}

	return 1;
}

int LocalsLoad(const char* text) {
	int f,i,c,n;
	char number[255];
	if (text == NULL || *text == '\0') {
		return 0;
	}
	for (f=0;f<255;f++) {
		for (i=0;i<255;i++) {
			localdeclare[f][i] = -1;
		}
	}
	f = 0;
	i = 0;
	c = 0;
	n = 0;
	while (text[c]!='\0') {
		switch (text[c]) {
		case ',':
			if (n!=0) {
				localdeclare[f][i] = atoi(number);
			}
			i++;
			n=0;
			break;
		case ';':
			if (n!=0) {
				localdeclare[f][i] = atoi(number);
			}
			i=0;
			n=0;
			f++;
			break;
		default:
			number[n] = text[c];
			n++;
			number[n] = '\0';
			break;
		}
		c++;
	}
	if (n!=0) {
		localdeclare[f][i] = atoi(number);
	}

	return 1;
}

static int doargs(int argc, char* argv[]) {
	int i;
	if (argv[0]!=NULL && *argv[0]!=0) progname=argv[0];
	for (i=1; i<argc; i++) {
		if (*argv[i]!='-')			/* end of options; keep it */
			break;
		else if (IS("--")) {		/* end of options; skip it */
			++i;
			break;
		}
		else if (IS("-"))			/* end of options; use stdin */
			return i;
		else if (IS("-dis"))			/* list */
			disassemble=1;
		else if (IS("-d"))			/* list */
			debug=1;
		else if (IS("-f")) {
			++i;
			if (argv[i]==NULL || *argv[i]==0) {
				usage("'-f' needs an argument",NULL);
			} else {
				funcnumstr=argv[i];
			}
		}
		else if (IS("-ns"))
			process_sub=0;
		else if (IS("-pn"))
			printfuncnum=1;
		else if (IS("-l")) {		/* list */
			++i;
			guess_locals = 0;
			if (LocalsLoad(argv[i])==0) usage("'-l' needs argument",NULL);
		}
		else if (IS("-l2"))	{		/* list */
			++i;
			guess_locals = 0;
			if (argv[i]==NULL || *argv[i]==0) {
				usage("'-l2' needs an argument",NULL);
			} else {
				LDS2=argv[i];
			}
		}
		else if (IS("-a")) {
			locals=1;
		}
		else if (IS("-o")) {		/* output file */
			output=argv[++i];
			if (output==NULL || *output==0) usage("'-o' needs argument",NULL);
		}
		else if (IS("-p"))			/* parse only */
			dumping=0;
		else if (IS("-pg"))			/* parse only */
			lds2=1;
		else if (IS("-dg"))			/* parse only */
			guess_locals=0;
		else if (IS("-s"))			/* strip debug information */
			stripping=1;
		else if (IS("-v")) {		/* show version */
			printf("LuaDec " VERSION_STRING " for " LUA_VERSION "\n");
			if (argc==2) exit(EXIT_SUCCESS);
		}
		else if (IS("-fc")) {
			func_check = 1;
		}
		else if (IS("-se")) {
			++i;
			if (argv[i] == NULL || *argv[i] == 0) {
				usage("'-se' needs an argument", NULL);
			} else {
				string_encoding = getEncoding(argv[i]);
				if (string_encoding == 0) {
					string_encoding = ASCII;
					usage("'-se' unknown argument: %s, available encodings are "ENCODINGS, argv[i]);
				}
			}
		}
		else					/* unknown option */
			usage("unrecognized option '%s'", argv[i]);
	}
	if (i==argc && (debug || !dumping))	{
		dumping=0;
		argv[--i]=Output;
	}
	return i;
}

Proto* toproto(lua_State* L, int i) {
	const Closure* c=(const Closure*)lua_topointer(L,i);
	return c->l.p;
}

Proto* combine(lua_State* L, int n) {
	if (n==1) {
		int i;
		Proto* f = toproto(L,-1);
		if (LDS2) {
			Inject(f,0);
			for (i=0; i<f->sizep; i++) {
				Inject(f->p[i],i+1);
			}
		}
		return f;
	} else {
		int i,pc=0;
		Proto* f=luaF_newproto(L);
		f->source=luaS_newliteral(L,"=(" PROGNAME ")");
		f->maxstacksize=1;
		f->p=luaM_newvector(L,n,Proto*);
		f->sizep=n;
		f->sizecode=2*n+1;
		f->code=luaM_newvector(L,f->sizecode,Instruction);
		for (i=0; i<n; i++) {
			f->p[i]=toproto(L,i-n);
			f->code[pc++]=CREATE_ABx(OP_CLOSURE,0,i);
			f->code[pc++]=CREATE_ABC(OP_CALL,0,1,1);
		}
		f->code[pc++]=CREATE_ABC(OP_RETURN,0,1,0);
		if (LDS2) {
			Inject(f,0);
			for (i=0; i<n; i++) {
				Inject(f->p[i],i+1);
			}
		}
		return f;
	}
}

static void strip(lua_State* L, Proto* f) {
	int i,n=f->sizep;
	luadec_freearray(L, f->lineinfo, f->sizelineinfo, int);
	f->lineinfo=NULL; f->sizelineinfo=0;
	luadec_freearray(L, f->locvars, f->sizelocvars, LocVar);
	f->locvars=NULL;  f->sizelocvars=0;
#if LUA_VERSION_NUM == 501
	luadec_freearray(L, f->upvalues, f->sizeupvalues, TString*);
	f->upvalues=NULL; f->sizeupvalues=0;
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
	for (i=0; i<f->sizeupvalues; i++) {
		f->upvalues[i].name=luaS_new(L, "");
	}
#endif
	f->source=luaS_new(L, "");
	for (i=0; i<n; i++) {
		strip(L,f->p[i]);
	}
}

int luaU_guess_locals(Proto * f, int main);

void printFuncStructure(Proto * f, char* indent) {
	int i;
	char* newindent = (char*)calloc(strlen(indent)+10, sizeof(char));
	for (i=0;i<f->sizep;i++) {
		printf("%s%d\n",indent,i);
		sprintf(newindent,"  %s%d_",indent,i);
		printFuncStructure(f->p[i],newindent);
	}
	free(newindent);
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

int main(int argc, char* argv[]) {
	lua_State* L;
	Proto* f;
	int i;
	gargc = argc;
	gargv = argv;
	LDS2 = NULL;
	i = doargs(argc,argv);
	argc -= i;
	argv += i;
	filename_argv_from = i;
	if (argc<=0) {
		usage("no input files given",NULL);
	}
	InitOperators();
	L = lua_open();
	glstate = L;
	luaB_opentests(L);
	for (i=0; i<argc; i++) {
		const char* filename=IS("-") ? NULL : argv[i];
		if (luaL_loadfile(L,filename)!=0) fatal(lua_tostring(L,-1));
	}
	f = combine(L,argc);
	glproto = f;
	if (printfuncnum) {
		printf("%d\n",0);
		printFuncStructure(f,"  0_");
		lua_close(L);
		return 0;
	}
	if (stripping) {
		strip(L,f);
	}
	if (guess_locals) {
		luaU_guess_locals(f,0);
	}
	if (disassemble) {
		printf("; Disassembled using luadec " VERSION_STRING " for " LUA_VERSION " from https://github.com/viruscamp/luadec\n");
		printf("; Command line: ");
	} else {
		printf("-- Decompiled using luadec " VERSION_STRING " for " LUA_VERSION " from https://github.com/viruscamp/luadec\n");
		if (func_check) {
			printf("-- function check Command line: ");
		} else {
			printf("-- Command line: ");
		}
	}
	for (i=1; i<gargc; i++) {
		printf("%s ",gargv[i]);
	}
	printf("\n\n");
	if (lds2) {
		int i,i2;
		for (i=-1; i<f->sizep; i++) {
			Proto * x = f;
			if (i!=-1) {
				x = f->p[i];
			}
			for (i2=0; i2<x->sizelocvars; i2++) {
				if (i2!=0) printf(",");
				printf("%d-%d",x->locvars[i2].startpc,x->locvars[i2].endpc);
			}
			printf(";");
		}
		lua_close(L);
		return 0;
	}
	if (funcnumstr) {
		if (disassemble) {
			luadec_disassembleSubFunction(f, debug, funcnumstr);
		} else {
			luaU_decompileSubFunction(f, debug, funcnumstr);
		}
	} else {
		if (disassemble) {
			luadec_disassemble(f, debug, "0");
		} else {
			luaU_decompile(f, debug);
		}
	}
	lua_close(L);
	return 0;
}
