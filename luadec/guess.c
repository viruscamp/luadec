#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"
#include "lstring.h"

#include "lua-compat.h"
#include "StringBuffer.h"
#include "structs.h"
#include "proto.h"
#include "decompile.h"

#define DEBUG_PRINT

#define MAX(a,b) (((a)>(b))?(a):(b))
#define MIN(a,b) (((a)<(b))?(a):(b))

extern lua_State* glstate;

/****************************************
Lua 5.1
opmode = {
	[0]=iABC,iABx,iABC,iABC,iABC,
	iABx,iABC,iABx,iABC,iABC,
	iABC,iABC,iABC,iABC,iABC,
	iABC,iABC,iABC,iABC,iABC,
	iABC,iABC,iAsBx,iABC,iABC,
	iABC,iABC,iABC,iABC,iABC,
	iABC,iAsBx,iAsBx,iABC,iABC,
	iABC,iABx,iABC
}

op = [[
	MOVE LOADK LOADBOOL LOADNIL GETUPVAL
	GETGLOBAL GETTABLE SETGLOBAL SETUPVAL SETTABLE
	NEWTABLE SELF ADD SUB MUL
	DIV MOD POW UNM NOT
	LEN CONCAT JMP EQ LT
	LE TEST TESTSET CALL TAILCALL
	RETURN FORLOOP FORPREP TFORLOOP SETLIST 
	CLOSE CLOSURE VARARG
]]
****************************************/

// 0100 = assign Ra
// 0010 = assign Rb
// 0001 = assign Rc
int op_regassign[] = {
	0100,0100,0100,0100,0000,
	0100,0100,0000,0000,0000,
	0100,0000,0100,0100,0100,
	0100,0100,0100,0100,0100,
	0100,0100,0000,0000,0000,
	0000,0100,0010,0000,0000,
	0000,0000,0100,0000,0000,
	0000,0100,0000
};

// 0100 = use Ra
// 0010 = use Rb
// 0001 = use Rc
int op_regusage[] = {
	0010,0000,0000,0000,0000,
	0000,0011,0100,0100,0011,
	0000,0011,0011,0011,0011,
	0011,0011,0011,0010,0010,
	0010,0000,0000,0011,0011,
	0011,0000,0100,0000,0000,
	0000,0000,0000,0000,0000,
	0000,0100,0000
};

#define T int
#include "macro-array.h"
#undef T

#define T LocVar
#include "macro-array.h"
#undef T

#define last(l) (l.values[l.size-1])
#define addi(l, i) intArray_Push(&l, i)
#define add(l, a, b) do{ LocVar lv; lv.startpc=a; lv.endpc=b; LocVarArray_Push(&l, lv); }while(0)

int luaU_guess_locals(Proto* f, int main) {
	intArray blocklist;
	LocVarArray locallist;
	int regassign[MAXARG_A+1];
	int regusage[MAXARG_A+1];
	int regblock[MAXARG_A+1];
	int lastfree;
	int i,i2,x,pc;
	int func_endpc = FUNC_BLOCK_END(f);
	int ignoreNext = 0;

	if (f->lineinfo != NULL) {
		return 0;
	}

	if (f->sizelocvars > 0) {
		return 0;
	}

	intArray_Init(&blocklist, MAXARG_A+1);
	addi(blocklist, func_endpc);

	LocVarArray_Init(&locallist, MAXARG_A+1);

	lastfree = 0;
	for (i=0; i<f->maxstacksize; i++) {
		regassign[i] = 0;
		regusage[i] = 0;
		regblock[i] = 0;
	}

	// parameters
	for (i = 0; i < f->numparams; i++) {
		add(locallist,0,func_endpc);
		regassign[lastfree] = 0;
		regusage[lastfree] = 1;
		regblock[lastfree] = func_endpc;
		lastfree++;
	}

	// vararg
	if (NEED_ARG(f)) {
		add(locallist,0,func_endpc);
		lastfree++;
		regassign[lastfree] = 0;
		regusage[lastfree] = 1;
		regblock[lastfree] = func_endpc;
		lastfree++;
	}

#if LUA_VERSION_NUM == 501
	// nil optimizations
	{
		Instruction i = f->code[0];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		int b = GETARG_B(i);
		int c = GETARG_C(i);
		int ixx,num_nil = -1;
		switch (o) {
		// read Ra only
		case OP_SETGLOBAL:
		case OP_SETUPVAL:
		case OP_TESTSET:
			num_nil = a;
			break;
		// read Rb only
		case OP_MOVE:
		case OP_UNM:
		case OP_NOT:
		case OP_LEN:
			if (!ISK(b)) {
					num_nil = b;
			}
			break;
		// read Rb and Rc
		case OP_GETTABLE:
		case OP_SETTABLE:
		case OP_SELF:
		case OP_ADD:
		case OP_SUB:
		case OP_MUL:
		case OP_DIV:
		case OP_MOD:
		case OP_POW:
		case OP_EQ:
		case OP_LT:
		case OP_LE:
			if (!ISK(b)) {
				num_nil = b;
			}
			if (!ISK(c)) {
				num_nil = MAX(num_nil, c);
			}
			break;
		case OP_RETURN:
			// read Ra to a+b-2
			// only return 1 value
			// move before return multiple values
			num_nil = MAX(num_nil, a+b-2);
			break;
		}
		for (ixx = lastfree; ixx <= num_nil; ixx++) {
			if (ixx!=num_nil) {
				add(locallist,0,last(blocklist));
				lastfree++;
			}
			regassign[lastfree] = 0;
			regusage[lastfree] = 1;
			regblock[lastfree] = last(blocklist);
			lastfree++;
		}
	}
#endif

	// start code checking
	ignoreNext = 0;
	for (pc = 0; pc < f->sizecode; pc++) {
		Instruction instr = f->code[pc];
		OpCode o = GET_OPCODE(instr);
		int a = GETARG_A(instr);
		int b = GETARG_B(instr);
		int c = GETARG_C(instr);
		int bc = GETARG_Bx(instr);
		int sbc = GETARG_sBx(instr);
		int dest = 0;
		int setreg = -1;
		int setregto = -1;
		int setreg2 = -1;
		int loadreg = -1;
		int loadreg2 = -1;
		int loadreg3 = -1;
		int loadregto = -1;
		int intlocfrom = -1;
		int intlocto = -1;

		if (ignoreNext) {
			ignoreNext--;
			continue;
		}

		if ((o==OP_JMP) || (o==OP_FORPREP)) {
			dest = pc + sbc + 2;
		} else if ((pc+1!=f->sizecode) && (GET_OPCODE(f->code[pc+1])==OP_JMP)) {
			dest = pc + 1 + GETARG_sBx(f->code[pc+1]) + 2;
		}

		// check which registers were read or written to.
		switch (o) {
		case OP_MOVE:
			setreg = a;
			if (b<=a) {
				intlocfrom = b;
				intlocto = b;
			}
			loadreg = b;
			break;
		case OP_UNM:
		case OP_NOT:
		case OP_LEN:
			setreg = a;
			loadreg = b;
			break;
		case OP_LOADNIL:
			setreg = a;
			setregto = b;
			break;
		case OP_LOADK:
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_LOADKX:
#endif
		case OP_GETUPVAL:
#if LUA_VERSION_NUM == 501
		case OP_GETGLOBAL:
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_GETTABUP:
#endif
		case OP_LOADBOOL:
		case OP_NEWTABLE:
		case OP_CLOSURE:
			setreg = a;
			break;
		case OP_GETTABLE:
			setreg = a;
			loadreg = b;
			if (!ISK(c)) {
				loadreg2 = c;
			}
			break;
#if LUA_VERSION_NUM == 501
		case OP_SETGLOBAL:
#endif
		case OP_SETUPVAL:
			loadreg = a;
			break;
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_SETTABUP:
			if (!ISK(b)) {
				loadreg2 = b;
			}
			if (!ISK(c)) {
				if (loadreg2==-1) {
					loadreg2 = c;
				} else {
					loadreg3 = c;
				}
			}
			break;
#endif
		case OP_SETTABLE:
			loadreg = a;
			if (!ISK(b)) {
				loadreg2 = b;
			}
			if (!ISK(c)) {
				if (loadreg2==-1) {
					loadreg2 = c;
				} else {
					loadreg3 = c;
				}
				if ((a+1!=c) && (c>a)) {
					intlocto = c-1;
				}
			}
			intlocfrom = 0;
			if (a-1>=intlocto) {
				intlocto = a-1;
			}
			break;
		case OP_ADD:
		case OP_SUB:
		case OP_MUL:
		case OP_DIV:
		case OP_POW:
		case OP_MOD:
			setreg = a;
			if (!ISK(b)) {
				loadreg = b;
			}
			if (!ISK(c)) {
				if (loadreg==-1) {
					loadreg = c;
				} else {
					loadreg2 = c;
				}
			}
			break;
		case OP_CONCAT:
			setreg = a;
			loadreg = b;
			loadregto = c;
			break;
		case OP_CALL:
			if (c==0) {
				setreg = a;
				setregto = f->maxstacksize;
			} else if (c>=2) {
				setreg = a;
				setregto = a+c-2;
			} else if (c==1) {
				intlocfrom = 0;
				intlocto = a-1;
			}
			if (b==0) {
				loadreg = a;
				loadregto = f->maxstacksize;
			} else {
				loadreg = a;
				loadregto = a+b-1;
			}
			break;
		case OP_RETURN:
			if (b==0) {
				loadreg = a;
				loadregto = f->maxstacksize;
			} else if (b>=2) {
				loadreg = a;
				loadregto = a+b-2;
			}
			break;
		case OP_TAILCALL:
			if (b==0) {
				loadreg = a;
				loadregto = f->maxstacksize;
			} else {
				loadreg = a;
				loadregto = a+b-1;
			}
			break;
		case OP_VARARG:
			if (b==0) {
				setreg = a;
				setregto = f->maxstacksize;
			} else {
				setreg = a;
				setregto = a+b-1;
			}
			break;
		case OP_SELF:
			setreg = a;
			setregto = a+1;
			loadreg = b;
			if (a>b) {
				intlocfrom = 0;
				intlocto = b;
			}
			if (!ISK(c)) {
				loadreg2 = c;
			}
			break;
		case OP_EQ:
		case OP_LT:
		case OP_LE:
			if (!ISK(b)) {
				loadreg = b;
			}
			if (!ISK(c)) {
				if (loadreg==-1) {
					loadreg = c;
				} else {
					loadreg2 = c;
				}
			}
			break;
		case OP_TEST:
			loadreg = a;
			break;
		case OP_TESTSET: 
			setreg = a;
			loadreg = b;
			break;
		case OP_SETLIST:
			loadreg = a;
			if (b==0) {
				loadregto = f->maxstacksize;
			} else {
				loadregto = a+b;
			}
			if (c == 0) {
				ignoreNext = 1;
			}
			break;
		case OP_FORLOOP:
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_TFORCALL:
#endif
		case OP_TFORLOOP:
			break;
		case OP_FORPREP:
			loadreg = a;
			loadregto = a+2;
			setreg = a;
			setregto = a+3;
			intlocfrom = a;
			intlocto = a+3;
			regassign[a] = pc;
			regassign[a+1] = pc;
			regassign[a+2] = pc;
			regassign[a+3] = pc+1;
			regblock[a] = dest;
			regblock[a+1] = dest;
			regblock[a+2] = dest;
			regblock[a+3] = dest-1;

			addi(blocklist, dest-1);
			if (GET_OPCODE(f->code[dest-2])==OP_JMP) {
				last(blocklist)--;
			}
			break;
		case OP_JMP:
			if (GET_OPCODE(f->code[dest-1]) == LUADEC_TFORLOOP) {
				int a = GETARG_A(f->code[dest-1]);
				int c = GETARG_C(f->code[dest-1]);
				setreg = a;
				setregto = a+c+2;
				loadreg = a;
				loadregto = a+2;
				intlocfrom = a;
				intlocto = a+c+2;
				regassign[a] = pc;
				regassign[a+1] = pc;
				regassign[a+2] = pc;
				regblock[a] = dest+1;
				regblock[a+1] = dest+1;
				regblock[a+2] = dest+1;
				for (x=a+3;x<=a+c+2;x++) {
					regassign[x] = pc+1;
					regblock[x] = dest-1;
				}
			}
			if (dest>pc) {
				addi(blocklist, dest-1);
				if (GET_OPCODE(f->code[dest-2])==OP_JMP) {
					last(blocklist)--;
				}
			}
			break;
#if LUA_VERSION_NUM == 501
		case OP_CLOSE:
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_EXTRAARG:
#endif
		default:
			break;
		}
		
		for (i=1; i<blocklist.size; i++) {
			x = blocklist.values[i];
			i2 = i-1;
			while ((i2>=0) && (blocklist.values[i2]<x)) {
				blocklist.values[i2+1] = blocklist.values[i2];
				i2 = i2-1;
			}
			blocklist.values[i2+1] = x;
		}

		if (loadreg!=-1) {
			if (loadregto==-1)
				loadregto = loadreg;
			for (i=loadreg;i<=loadregto;i++) {
				regusage[i]--;
			}
			if (loadreg2!=-1) regusage[loadreg2]--;
			if (loadreg3!=-1) regusage[loadreg3]--;
		}

		if (setreg!=-1) {
			if (setregto==-1)
				setregto = setreg;
			for (i=setreg;i<=setregto;i++) {
				regusage[i]++;
			}
			if (setreg2!=-1) regusage[setreg2]++;
		}

		i2 = lastfree-1;
		for (i=lastfree; i<f->maxstacksize; i++) {
			if ((regusage[i]<0) || (regusage[i]>1)) {
				i2 = i;
			}
			if ((intlocfrom!=-1) && ((intlocfrom<=i) && (i<=intlocto))) {
				i2 = i;
			}
		}

		for (i=setreg; i<=setregto; i++) {
			if (i>i2) {
				regassign[i] = pc+1;
				regblock[i] = last(blocklist);
			}
		}

		for (i=lastfree; i<=i2; i++) {
			//fprintf(stderr,"%d %d %d %d\n",i,regassign[i],regblock[i],block);
			add(locallist,regassign[i],regblock[i]);
			lastfree++;
		}

		while (blocklist.size > 0 && last(blocklist) <= pc+1) {
			intArray_Pop(&blocklist);
		}
		if (blocklist.size == 0) {
			fprintf(stderr, "cannot find blockend > %d , pc = %d, f->sizecode = %d\n", pc+1, pc, f->sizecode);
		}
		while ((lastfree!=0) && (regblock[lastfree-1] <= pc+1)) {
			lastfree--;
			regusage[lastfree]=0;
		}
	}
	intArray_Clear(&blocklist);

	// print out information
	{
		int length = locallist.size;
		f->sizelocvars = length;
		if (f->sizelocvars>0) {
			f->locvars = luaM_newvector(glstate,f->sizelocvars,LocVar);
			for (i = 0; i < length; i++) {
				char names[10];
				sprintf(names,"l_%d_%d",main,i);
				f->locvars[i].varname = luaS_new(glstate, names);
				f->locvars[i].startpc = locallist.values[i].startpc;
				f->locvars[i].endpc = locallist.values[i].endpc;
			}
		}
	}
	LocVarArray_Clear(&locallist);

	// run with all functions
	for (i=0; i<f->sizep; i++) {
		luaU_guess_locals(f->p[i],main+i+1);
	}
	return 1;
}
