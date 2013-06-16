/* luadec, based on luac */
#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#define DEBUG_PRINT

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"
#include "lstring.h"

#include "StringBuffer.h"
#include "proto.h"

#include "decompile.h"
#include "structs.h"

#define IS_CONSTANT(r) (r >= 256) // TODO: Lua5.1 specific. Should use MSR!!!!

extern lua_State* glstate;

struct llist;

struct llist {
	int startpc;
	int endpc;
	struct llist * next;
};

struct llist * add(struct llist * list, int startpc, int endpc) {
	list->startpc = startpc;
	list->endpc = endpc;
	list->next = (struct llist *)calloc(1, sizeof(struct llist));
	list->next->next = NULL;
	return list->next;
}

void deletellist(struct llist * list) {
	struct llist *curr, *next;
	curr = list;
	while(curr){
		next = curr->next;
		free(curr);
		curr = next;
	}
}

int luaU_guess_locals(Proto * f, int main) {
	int blockend[255];
	int block;
	int regassign[MAXARG_A];
	int regusage[MAXARG_A];
	int regblock[MAXARG_A];
	int lastfree;
	int i,i2,x,y,pc;
	struct llist list_begin;
	struct llist *list_next = &list_begin;

	if (f->lineinfo != NULL) {
		return 0;
	}

	if (f->sizelocvars>0) {
		return 0;
	}

	list_begin.next = NULL;
	block = 0;
	lastfree = 0;
	blockend[block] = f->sizecode-1;

	for (i=0; i<f->maxstacksize; i++) {
		regassign[i] = 0;
		regusage[i] = 0;
		regblock[i] = 0;
	}

	// parameters, varargs, nil optimizations
	for (i = 0; i < f->numparams; i++) {
		list_next = add(list_next,0,blockend[block]);
		regassign[lastfree] = 0;
		regusage[lastfree] = 1;
		regblock[lastfree] = blockend[block];
		lastfree++;
	}
	if ((f->is_vararg==7) || ((f->is_vararg&2))) {
		if (main!=0) {
			list_next = add(list_next,0,blockend[block]);
			lastfree++;
			regassign[lastfree] = 0;
			regusage[lastfree] = 1;
			regblock[lastfree] = blockend[block];
			lastfree++;
		}
	}
	{
		Instruction i = f->code[0];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		if ((o == OP_SETGLOBAL) || (o == OP_SETUPVAL)) {
			int ixx;
			for (ixx = lastfree; ixx <= a; ixx++) {
				if (ixx!=a) {
					list_next = add(list_next,0,blockend[block]);
					lastfree++;
				}
				regassign[lastfree] = 0;
				regusage[lastfree] = 1;
				regblock[lastfree] = blockend[block];
				lastfree++;
			}
		} else if (o != OP_JMP) {
			int ixx;
			for (ixx = lastfree; ixx <= a-1; ixx++) {
				list_next = add(list_next,0,blockend[block]);
				lastfree++;
				regassign[lastfree] = 0;
				regusage[lastfree] = 1;
				regblock[lastfree] = blockend[block];
				lastfree++;
			}
		}
	}

	// start code checking
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
		if ((o==OP_JMP) || (o==OP_FORPREP)) {
			dest = pc + sbc + 2;
		} else if ((pc+1!=f->sizecode) && (GET_OPCODE(f->code[pc+1])==OP_JMP)) {
			dest = pc+1+GETARG_sBx(f->code[pc+1])+2;
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
	case OP_GETUPVAL:
	case OP_GETGLOBAL:
	case OP_LOADBOOL:
	case OP_NEWTABLE:
	case OP_CLOSURE:
		setreg = a;
		break;
	case OP_GETTABLE:
		setreg = a;
		loadreg = b;
		if (!IS_CONSTANT(c)) {
			loadreg2 = c;
		}
		break;
	case OP_SETGLOBAL:
	case OP_SETUPVAL:
		loadreg = a;
		break;
	case OP_SETTABLE:
		loadreg = a;
		if (!IS_CONSTANT(b)) {
			loadreg2 = b;
		}
		if (!IS_CONSTANT(c)) {
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
		if (!IS_CONSTANT(b)) {
			loadreg = b;
		}
		if (!IS_CONSTANT(c)) {
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
		if (!IS_CONSTANT(c)) {
			loadreg2 = c;
		}
		break;
	case OP_EQ:
	case OP_LT:
	case OP_LE:
		if (!IS_CONSTANT(b)) {
			loadreg = b;
		}
		if (!IS_CONSTANT(c)) {
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
		break;
	case OP_FORLOOP:
		break;
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
		block++;
		blockend[block] = dest-1;
		if (GET_OPCODE(f->code[dest-2])==OP_JMP) {
			blockend[block]--;
		}
		break;
	case OP_JMP:
		if (GET_OPCODE(f->code[dest-1]) == OP_TFORLOOP) {
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
			block++;
			blockend[block] = dest-1;
		}
		if (GET_OPCODE(f->code[dest-2])==OP_JMP) {
			blockend[block]--;
		}
		break;
	case OP_CLOSE:
	default:
		break;
		}

		for (i=1; i<=block; i++) {
			x = blockend[i];
			i2 = i-1;
			while ((i2>=0) && (blockend[i2]<x)) {
				blockend[i2+1] = blockend[i2];
				i2 = i2-1;
			}
			blockend[i2+1] = x;
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
				regblock[i] = blockend[block];
			}
		}

		for (i=lastfree; i<=i2; i++) {
			//fprintf(stderr,"%d %d %d %d\n",i,regassign[i],regblock[i],block);
			list_next = add(list_next,regassign[i],regblock[i]);
			lastfree++;
		}

		while (blockend[block] <= pc+1) {
			block--;
		}
		while ((lastfree!=0) && (regblock[lastfree-1] <= pc+1)) {
			lastfree--;
			regusage[lastfree]=0;
		}

	}

	// print out information
	{
		int length = 0;
		struct llist* list = &list_begin;

		while (list->next!=NULL) {
			length++;
			list = list->next;
		}
		f->sizelocvars = length;
		if (f->sizelocvars>0) {
			f->locvars = luaM_newvector(glstate,f->sizelocvars,LocVar);
			list = &list_begin;
			length = 0;
			while (list->next != NULL) {
				char names[10];
				sprintf(names,"l_%d_%d",main,length);
				f->locvars[length].varname = luaS_new(glstate, names);
				f->locvars[length].startpc = list->startpc;
				f->locvars[length].endpc = list->endpc;
				length++;
				list = list->next;
			}
		}
	}

	deletellist(list_begin.next);

	// run with all functions
	for (i=0; i<f->sizep; i++) {
		luaU_guess_locals(f->p[i],main+i+1);
	}
	return 1;
}
