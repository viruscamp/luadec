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
	#define PROGNAME "LuaOpSwap"		/* program name */
#endif

#define	OPCODES_TXT "luaopswap.txt"		/* default opcodes file */
#define	OUTPUT "luaopswap.luac"			/* default output file */

#define VERSION "1.0"

#define VERSION_STRING VERSION " rev: " SRCVERSION

static int cmp_gen_luac = 0;           /* -gs  compare <input.luac> with x86-standard allopcodes.luac to generate a opcodes.txt */
static int cmp_gen_lua = 0;            /* -gf  compare <input.luac> with a fresh compiled allopcodes.lua to generate a opcodes.txt*/
lua_State* glstate;

static char Output[] = { OUTPUT };		/* default output file name */
static const char* output = Output;		/* output file name */
static const char* progname = PROGNAME;	/* actual program name */

unsigned char allopcodes_lua[];
#include "allopcodes_lua.h"

unsigned char allopcodes_luac[];
#include "allopcodes_luac.h"

static void fatal(const char* message) {
	fprintf(stderr, "%s: %s\n", progname, message);
	if (glstate) {
		lua_close(glstate);
	}
	exit(EXIT_FAILURE);
}

static void cannot(const char* what, const char* filename) {
	fprintf(stderr, "%s: cannot %s %s: %s\n", progname, what, filename, strerror(errno));
	exit(EXIT_FAILURE);
}

static void usage(const char* message, const char* arg) {
	if (message != NULL) {
		fprintf(stderr ,"%s: " ,progname);
		fprintf(stderr, message, arg);
		fprintf(stderr, "\n");
	}
	fprintf(stderr,
		"LuaOpSwap " VERSION_STRING " for " LUA_VERSION "\n"
		" by VirusCamp (https://github.com/viruscamp/luadec)\n"
		"usage: %s [options] <input.luac> [opcodes.txt]\n"
		" Swap the opcodes in <input.luac> using method in [opcodes.txt]\n"
		" Default [opcodes.txt] is '"OPCODES_TXT"'.\n"
		" Available options are:\n"
		"  -template output "OPCODES_TXT" template to stdout and exit\n"
		"  -lua      output allopcodes.lua to stdout and exit\n"
		"  -o name   output to file 'name' (default is \"%s\")\n"
		"  -gs       compare <input.luac> with x86-standard allopcodes.luac to generate a "OPCODES_TXT"\n"
		"  -gf       compare <input.luac> with a fresh compiled allopcodes.lua to generate a "OPCODES_TXT"\n"
		"  -v        show version information\n"
		"  --        stop handling options\n",
		progname, Output);
	exit(EXIT_FAILURE);
}

static void outputTemplate(FILE *f) {
	int i;
	for (i = 0; i < NUM_OPCODES; i++) {
		fprintf(f, "%d %s\n", i, luaP_opnames[i]);
	}
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
		else if (IS("-template")) {		/* output OPCODES_TXT template */
			outputTemplate(stdout);
			exit(EXIT_SUCCESS);
		}
		else if (IS("-lua")) {		/* output allopcodes.lua */
			fwrite(allopcodes_lua, sizeof(unsigned char), allopcodes_lua_len, stdout);
			exit(EXIT_SUCCESS);
		}
		else if (IS("-o")) {		/* output file */
			output = argv[++i];
			if (output == NULL || *output == 0) {
				usage("'-o' needs argument", NULL);
			}
		}
		else if (IS("-gs")) {		/* compare <input.luac> with x86-standard allopcodes.luac to generate a opcodes.txt */
			cmp_gen_luac = 1;
		}
		else if (IS("-gf")) {		/* compare <input.luac> with a fresh compiled allopcodes.luac to generate a opcodes.txt */
			cmp_gen_lua = 1;
		}
		else if (IS("-v")) {		/* show version */
			printf("LuaOpSwap " VERSION_STRING " for " LUA_VERSION "\n");
			exit(EXIT_SUCCESS);
		}
		else {						/* unknown option */
			usage("unrecognized option '%s'", argv[i]);
		}
	}
	return i;
}

int getOpIndex(const char* str) {
	char* endptr;
	long val = strtol(str, &endptr, 10);
	if (errno || endptr == str) {
		int i;
		for (i = 0; i < NUM_OPCODES; i++) {
			if (strcmp(str, luaP_opnames[i]) == 0) {
				return i;
			}
		}
		return -1;
	}
	return val;
}

#define OP2OP_SIZE (1<<SIZE_OP)
int op2op[OP2OP_SIZE];

int generateOp2op(const char* opcodes_def) {
	int i = 0, retval = 1;
	char left[32], right[32];
	int readcount = 0, linenum = 0;

	FILE* F = (opcodes_def == NULL) ? stdout : fopen(opcodes_def, "rt");
	if (F == NULL) cannot("open", opcodes_def);

	for (i = 0; i < OP2OP_SIZE; i++) {
		op2op[i] = i;
	}

	while ((readcount = fscanf(F, "%30s %30s\n", left, right)) != EOF) {
		linenum++;
		if (readcount == 2) {
			int li = getOpIndex(left);
			int ri = getOpIndex(right);
			if (0 <= li && li < OP2OP_SIZE && 0 <= ri && ri < OP2OP_SIZE) {
				op2op[li] = ri;
			} else {
				fprintf(stderr, " error in line %d : cannot find OpCode or OpNumber not in range(0 - %d).\n", linenum, OP2OP_SIZE);
				retval = 0;
				break;
			}
		} else if (readcount == 1 || readcount > 2) {
			fprintf(stderr, " error in line %d : One line must have 2 OpCode or OpNumber.\n", linenum);
			retval = 0;
			break;
		}
	}

	if (fclose(F)) cannot("close", opcodes_def);
	return retval;
}

void swapOpCode(Proto* f) {
	int pc, i;
	
	for (pc = 0; pc < f->sizecode; pc++) {
		Instruction ins = f->code[pc];
		OpCode op = GET_OPCODE(ins);
		OpCode newop = op2op[op];
		f->code[pc] = SET_OPCODE(ins, newop);
	}

	for (i = 0; i < f->sizep; i++) {
		swapOpCode(f->p[i]);
	}
}

int CompareAndGenOp2op(const Proto* input_proto, const Proto* allopcodes_proto) {
	int pc, i;
	int diff = 0;
	for (i = 0; i < OP2OP_SIZE; i++) {
		op2op[i] = i;
	}
	for (pc = 0; pc < input_proto->sizecode; pc++) {
		OpCode leftop = GET_OPCODE(input_proto->code[pc]);
		OpCode rightop = GET_OPCODE(allopcodes_proto->code[pc]);
		op2op[leftop] = rightop;
	}
	return diff;
}

int PrintOp2op() {
	int i;
	int count = 0;
	for (i = 0; i < OP2OP_SIZE; i++) {
		int j = op2op[i];
		if (i != j) {
			count++;
			if (j < NUM_OPCODES) {
				printf("%d %s\n", i, luaP_opnames[j]);
			} else {
				printf("%d %d\n", i, j);
			}
		}
	}
	return count;
}

int CompareAndGenOpcodes(const Proto* input_proto, const Proto* allopcodes_proto) {
	int diff = 0, count = 0;
	char errorstr[128] = { "cannot generate opcodes.txt. Cause protos to compare have" };
	if (!(input_proto->sizep > 0 && allopcodes_proto->sizep > 0)) {
		strcat(errorstr, " null function 0_0 .");
		fatal(errorstr);
	}
	input_proto = input_proto->p[0];
	allopcodes_proto = allopcodes_proto->p[0];
	if (!(input_proto && allopcodes_proto)) {
		strcat(errorstr, " null function 0_0 .");
		fatal(errorstr);
	}
	if (input_proto->numparams != allopcodes_proto->numparams) {
		diff++;
		strcat(errorstr, " different params size;");
	}
	if (NUPS(input_proto) != NUPS(allopcodes_proto)) {
		diff++;
		strcat(errorstr, " different upvalues size;");
	}
	if (input_proto->is_vararg != allopcodes_proto->is_vararg) {
		diff++;
		strcat(errorstr, " different is_vararg;");
	}
	if (input_proto->sizecode != allopcodes_proto->sizecode) {
		diff++;
		strcat(errorstr, " different code size;");
	}
	if (diff > 0) {
		fatal(errorstr);
	}
	diff = CompareAndGenOp2op(input_proto, allopcodes_proto);
	count = PrintOp2op();
	fprintf(stderr, " %d OpCodes swapped", count);
	return diff;
}

Proto* toproto(lua_State* L, int i) {
	const Closure* c = (const Closure*)lua_topointer(L, i);
	return c->l.p;
}

static int writer(lua_State* L, const void* p, size_t size, void* u) {
	UNUSED(L);
	return (fwrite(p, size, 1, (FILE*)u) != 1) && (size != 0);
}

int gargc = 0;
char** gargv = NULL;

int main(int argc, char* argv[]) {
	const char *input_luac, *opcodes_def;
	int i;
	lua_State* L;
	Proto* f;
	FILE* D;

	gargc = argc;
	gargv = argv;
	i = doargs(argc,argv);
	argc -= i;
	argv += i;

	if (argc < 1) {
		usage("need 1 arguments at least", NULL);
	}

	L = lua_open();
	glstate = L;
	//luaB_opentests(L);

	input_luac = argv[0];
	if (luaL_loadfile(L, input_luac) != 0) {
		fatal(lua_tostring(L, -1));
	}
	f = toproto(L, -1);

	if (cmp_gen_lua || cmp_gen_luac) {
		Proto* input_proto = f;
		Proto* allopcodes_proto;
		const char* buff = cmp_gen_lua ? allopcodes_lua : allopcodes_luac;
		int bufflen = cmp_gen_lua ? allopcodes_lua_len : allopcodes_luac_len;		
		if (luaL_loadbuffer(L, buff, bufflen, "allopcodes.lua") != 0) {
			fatal(lua_tostring(L, -1));
		}
		allopcodes_proto = toproto(L, -1);
		CompareAndGenOpcodes(input_proto, allopcodes_proto);
	} else {
		opcodes_def = (argv[1]) ? (argv[1]) : OPCODES_TXT;
		if (!generateOp2op(opcodes_def)) {
			fprintf(stderr, "opcodes.txt file: %s format error!", opcodes_def);
			return EXIT_FAILURE;
		}
		swapOpCode(f);

		D = (output == NULL) ? stdout : fopen(output, "wb");
		if (D == NULL) cannot("open", output);
		lua_lock(L);
		luaU_dump(L, f, writer, D, 0);
		lua_unlock(L);
		if (ferror(D)) cannot("write", output);
		if (fclose(D)) cannot("close", output);

		printf("%s generated!\n", output);
	}

	lua_close(L);
	return EXIT_SUCCESS;
}
