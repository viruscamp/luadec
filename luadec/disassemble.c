#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#include "lua.h"
#include "lauxlib.h"
#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"
#include "lstring.h"

#include "lua-compat.h"
#include "StringBuffer.h"
#include "proto.h"
#include "disassemble.h"

extern int process_sub;           /* process sub functions? */

Proto* findSubFunction(Proto* f, const char* funcnumstr, char* realfuncnumstr);

void luadec_disassembleSubFunction(Proto* f, int dflag, const char* funcnumstr) {
	char* realfuncnumstr = (char*)calloc(strlen(funcnumstr) + 10, sizeof(char));
	Proto* cf = findSubFunction(f, funcnumstr, realfuncnumstr);
	if (cf == NULL) {
		fprintf(stderr, "No such sub function num : %s , use -pn option to get available num.\n", funcnumstr);
		free(realfuncnumstr);
		return;
	}
	luadec_disassemble(cf, dflag, realfuncnumstr);
	free(realfuncnumstr);
}

void luadec_disassemble(Proto* fwork, int dflag, const char* name) {
	char line[128];
	StringBuffer* lend = StringBuffer_newBySize(MAXCONSTSIZE + 128);

	char tmp[MAXCONSTSIZE+128];
	char tmp2[MAXCONSTSIZE+128];
	char* tmpconstant1 = NULL;
	char* tmpconstant2 = NULL;

	Proto* f = fwork;
	int pc,l;
	int name_len = name ? strlen(name) : 0;

	printf("; Function:        %s\n", name);
	printf("; Defined at line: %d\n", f->linedefined);
	printf("; #Upvalues:       %d\n", NUPS(f));
	printf("; #Parameters:     %d\n", f->numparams);
	printf("; Is_vararg:       %d\n", f->is_vararg);
	printf("; Max Stack Size:  %d\n", f->maxstacksize);
	printf("\n");

	for (pc=0; pc<f->sizecode; pc++) {
		Instruction i = f->code[pc];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		int b = GETARG_B(i);
		int c = GETARG_C(i);
		int bc = GETARG_Bx(i);
		int sbc = GETARG_sBx(i);
		sprintf(line,"%s","");
		StringBuffer_printf(lend,"%s","");
		switch (o) {
		case OP_MOVE:
			sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
			StringBuffer_printf(lend,"%c%d := %c%d",CC(a),CV(a),CC(b),CV(b));
			break;
		case OP_LOADK:
			tmpconstant1 = DecompileConstant(f,bc);
			sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
			StringBuffer_printf(lend,"%c%d := %s",CC(a),CV(a),tmpconstant1);
			free(tmpconstant1);
			break;
#if LUA_VERSION_NUM == 502
		case OP_LOADKX:
			// TODO 5.2 OP_LOADKX
			break;
		case OP_EXTRAARG:
			// TODO 5.2 OP_EXTRAARG
			break;
#endif
		case OP_LOADBOOL:
			sprintf(line,"%c%d %d %d",CC(a),CV(a),b,c);
			if (b) {
				if (c) {
					StringBuffer_printf(lend,"%c%d := true; goto %d",CC(a),CV(a),pc+2);
				} else {
					StringBuffer_printf(lend,"%c%d := true",CC(a),CV(a));
				}
			} else {
				if (c) {
					StringBuffer_printf(lend,"%c%d := false; goto %d",CC(a),CV(a),pc+2);
				} else {
					StringBuffer_printf(lend,"%c%d := false",CC(a),CV(a));
				}
			}
			break;
		case OP_LOADNIL:
			sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
			StringBuffer_printf(lend,"%s","");
			for (l=a; l<=b; l++) {
				sprintf(tmp,"R%d := ", l);
				StringBuffer_add(lend,tmp);
			}
			StringBuffer_add(lend,"nil");
			break;
		case OP_VARARG:
			//VARARG A B
			//R(A), R(A+1), ..., R(A+B-2) = vararg
			//ANoFrillsIntroToLua51VMInstructions.pdf is wrong
			sprintf(line,"%c%d %d",CC(a),CV(a),b);
			if (b > 2) {
				StringBuffer_printf(lend, "R%d to R%d := ...", a, a+b-2);
			} else if (b == 2){
				StringBuffer_printf(lend, "R%d := ...", a);
			} else if (b == 0) {
				StringBuffer_printf(lend, "R%d to top := ...", a);
			} else {
				StringBuffer_printf(lend, "");
			}
			break;
		case OP_GETUPVAL:
			sprintf(line,"%c%d U%d",CC(a),CV(a),b);
			StringBuffer_printf(lend,"%c%d := U%d",CC(a),CV(a),b);
			break;
#if LUA_VERSION_NUM == 501
		case OP_GETGLOBAL:
			sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
			StringBuffer_printf(lend,"%c%d := %s",CC(a),CV(a),GLOBAL(bc));
			break;
#endif
#if LUA_VERSION_NUM == 502
		case OP_GETTABUP:
			// TODO 5.2 OP_GETTABUP
			break;
#endif
		case OP_GETTABLE:
			sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
			if (IS_CONSTANT(c)) {
				tmpconstant1 = DecompileConstant(f,INDEXK(c));
				StringBuffer_printf(lend,"R%d := R%d[%s]",a,b,tmpconstant1);
				free(tmpconstant1);
			} else {
				StringBuffer_printf(lend,"R%d := R%d[R%d]",a,b,c);
			}
			break;
#if LUA_VERSION_NUM == 501
		case OP_SETGLOBAL:
			sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
			StringBuffer_printf(lend,"%s := %c%d",GLOBAL(bc), CC(a),CV(a));
			break;
#endif
#if LUA_VERSION_NUM == 502
		case OP_SETTABUP:
			// TODO 5.2 OP_SETTABUP
			break;
#endif
		case OP_SETUPVAL:
			sprintf(line,"%c%d U%d",CC(a),CV(a),b);
			StringBuffer_printf(lend,"U%d := %c%d",b, CC(a),CV(a));
			break;
		case OP_SETTABLE:
			sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
			if (IS_CONSTANT(b)) {
				if (IS_CONSTANT(c)) {
					tmpconstant1 = DecompileConstant(f,INDEXK(b));
					tmpconstant2 = DecompileConstant(f,INDEXK(c));
					StringBuffer_printf(lend,"R%d[%s] := %s",a,tmpconstant1,tmpconstant2);
					free(tmpconstant1);
					free(tmpconstant2);
				} else {
					tmpconstant1 = DecompileConstant(f,INDEXK(b));
					StringBuffer_printf(lend,"R%d[%s] := R%d",a,tmpconstant1,c);
					free(tmpconstant1);
				}
			} else {
				if (IS_CONSTANT(c)) {
					tmpconstant2 = DecompileConstant(f,INDEXK(c));
					StringBuffer_printf(lend,"R%d[R%d] := %s",a,b,tmpconstant2);
					free(tmpconstant2);
				} else {
					StringBuffer_printf(lend,"R%d[R%d] := R%d",a,b,c);
				}
			}
			break;
		case OP_NEWTABLE:
			sprintf(line,"%c%d %d %d",CC(a),CV(a),b,c);
			StringBuffer_printf(lend,"%c%d := {}",CC(a),CV(a));
			break;
		case OP_SELF:
			sprintf(line,"R%d R%d %c%d",a,b,CC(c),CV(c));
			if (IS_CONSTANT(c)) {
				tmpconstant1 = DecompileConstant(f,INDEXK(c));
				StringBuffer_printf(lend,"R%d := R%d; R%d := R%d[%s]",a+1,b,a,b,tmpconstant1);
				free(tmpconstant1);
			} else {
				StringBuffer_printf(lend,"R%d := R%d; R%d := R%d[R%d]",a+1,b,a,b,c);
			}
			break;
		case OP_ADD:
		case OP_SUB:
		case OP_MUL:
		case OP_DIV:
		case OP_POW:
		case OP_MOD:
			sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
			if (IS_CONSTANT(b) && IS_CONSTANT(c)) {
				tmpconstant1 = DecompileConstant(f,INDEXK(b));
				tmpconstant2 = DecompileConstant(f,INDEXK(c));
				StringBuffer_printf(lend,"R%d := %s %s %s",a,tmpconstant1,operators[o],tmpconstant2);
				free(tmpconstant1);
				free(tmpconstant2);
			} else if (IS_CONSTANT(b)) {
				tmpconstant1 = DecompileConstant(f,INDEXK(b));
				StringBuffer_printf(lend,"R%d := %s %s R%d",a,tmpconstant1,operators[o],c);
				free(tmpconstant1);
			} else if(IS_CONSTANT(c)) {
				tmpconstant2 = DecompileConstant(f,INDEXK(c));
				StringBuffer_printf(lend,"R%d := R%d %s %s",a,b,operators[o],tmpconstant2);
				free(tmpconstant2);
			} else {
				StringBuffer_printf(lend,"R%d := R%d %s R%d",a,b,operators[o],c);
			}
			break;
		case OP_UNM:
		case OP_NOT:
		case OP_LEN:
			sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
			if (IS_CONSTANT(b)) {
				tmpconstant1 = DecompileConstant(f,INDEXK(b));
				StringBuffer_printf(lend,"R%d := %s %s",a,operators[o],tmpconstant1);
				free(tmpconstant1);
			} else {
				StringBuffer_printf(lend,"R%d := %s R%d",a,operators[o],b);
			}
			break;
		case OP_CONCAT:
			sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
			StringBuffer_printf(lend,"R%d := ",a);
			for (l=b; l<c; l++) {
				sprintf(tmp,"R%d .. ", l);
				StringBuffer_add(lend,tmp);
			}
			sprintf(tmp,"R%d",c);
			StringBuffer_add(lend,tmp);
			break;
		case OP_JMP:
			{
				int dest = pc + sbc + 1;
				sprintf(line, "%d", sbc);
				StringBuffer_printf(lend, "PC += %d , goto %d", sbc, dest);
			}
			break;
		case OP_EQ:
		case OP_LT:
		case OP_LE:
			{
				int dest = GETARG_sBx(f->code[pc+1]) + pc + 2;
				sprintf(line,"%d %c%d %c%d",a,CC(b),CV(b),CC(c),CV(c));
				sprintf(tmp,"R%d",b);
				sprintf(tmp2,"R%d",c);
				if (IS_CONSTANT(b)) {
					tmpconstant1 = DecompileConstant(f,INDEXK(b));
					sprintf(tmp,"%s",tmpconstant1);
					free(tmpconstant1);
				}
				if (IS_CONSTANT(c)) {
					tmpconstant2 = DecompileConstant(f,INDEXK(c));
					sprintf(tmp2,"%s",tmpconstant2);
					free(tmpconstant2);
				}
				if (a) {
					StringBuffer_printf(lend,"if %s %s %s then goto %d else goto %d",tmp,invopstr(o),tmp2,pc+2,dest);
				} else {
					StringBuffer_printf(lend,"if %s %s %s then goto %d else goto %d",tmp,opstr(o),tmp2,pc+2,dest);
				}
			}
			break;
		case OP_TEST:
			{
				int dest = GETARG_sBx(f->code[pc+1]) + pc + 2;
				sprintf(line,"%c%d %d",CC(a),CV(a),c);
				sprintf(tmp,"R%d",a);
				if (IS_CONSTANT(a)) {
					tmpconstant1 = DecompileConstant(f,INDEXK(a));
					sprintf(tmp,"%s",tmpconstant1);
					free(tmpconstant1);
				}
				if (c) {
					StringBuffer_printf(lend,"if not %s then goto %d else goto %d",tmp,pc+2,dest);
				} else {
					StringBuffer_printf(lend,"if %s then goto %d else goto %d",tmp,pc+2,dest);
				}
			}
			break;
		case OP_TESTSET:
			{
				int dest = GETARG_sBx(f->code[pc+1]) + pc + 2;
				sprintf(line,"%c%d %c%d %d",CC(a),CV(a),CC(b),CV(b),c);
				sprintf(tmp,"R%d",a);
				sprintf(tmp2,"R%d",b);
				if (IS_CONSTANT(a)) {
					tmpconstant1 = DecompileConstant(f,INDEXK(a));
					sprintf(tmp,"%s",tmpconstant1);
					free(tmpconstant1);
				}
				if (IS_CONSTANT(b)) {
					tmpconstant2 = DecompileConstant(f,INDEXK(b));
					sprintf(tmp2,"%s",tmpconstant2);
					free(tmpconstant2);
				}
				if (c) {
					StringBuffer_printf(lend,"if %s then %s := %s ; goto %d else goto %d",tmp2,tmp,tmp2,pc+2,dest);
				} else {
					StringBuffer_printf(lend,"if not %s then %s := %s ; goto %d else goto %d",tmp2,tmp,tmp2,pc+2,dest);
				}
			}
			break;
		case OP_CALL:
		case OP_TAILCALL:
			{
				sprintf(line,"R%d %d %d",a,b,c);
				if (b>=2) {
					sprintf(tmp,"R%d to R%d", a+1, a+b-1);
				} else if (b==0) {
					sprintf(tmp,"R%d to top",a+1);
				} else {
					sprintf(tmp,"%s","");
				}

				if (c>=2) {
					sprintf(tmp2, "R%d to R%d := ", a, a+c-2);
				} else if (c==0) {
					sprintf(tmp2,"R%d to top := ",a);
				} else {
					sprintf(tmp2,"%s","");
				}
				StringBuffer_printf(lend,"%sR%d(%s)",tmp2,a,tmp);
			}
			break;
		case OP_RETURN:
			{
				sprintf(line,"R%d %d",a,b);
				if (b==0){
					sprintf(tmp, "R%d to top", a);
				} else if (b==2){
					sprintf(tmp, "R%d", a);
				} else if (b>=2) {
					sprintf(tmp, "R%d to R%d", a, a+b-2);
				} else {
					sprintf(tmp,"%s","");
				}
				StringBuffer_printf(lend,"return %s",tmp);
			}
			break;
		case OP_FORLOOP:
			{
				int dest = pc + sbc + 1;
				sprintf(line, "R%d %d", a, sbc);
				StringBuffer_printf(lend, "R%d += R%d; if R%d <= R%d then R%d := R%d; PC += %d , goto %d end", a, a+2, a, a+1, a+3, a, sbc, dest);
			}
			break;
		case OP_TFORLOOP:
			{
				sprintf(line,"R%d %d",a,c);

				if (c==1){
					sprintf(tmp2, "R%d", a+3);
				}else if (c>1) {
					sprintf(tmp2, "R%d to R%d", a+3, a+c+2);
				} else {
					sprintf(tmp2,"");
				}
				StringBuffer_printf(lend,"%s := R%d(R%d,R%d); if R%d ~= nil then R%d := R%d else goto %d",tmp2, a,a+1,a+2, a+3, a+2, a+3, pc+2);
			}
			break;
		case OP_FORPREP:
			{
				sprintf(line,"R%d %d",a,sbc);
				StringBuffer_printf(lend,"R%d -= R%d; goto %d",a,a+2,pc+sbc+1);
			}
			break;
		case OP_SETLIST:
			{
				int startindex = (c-1)*LFIELDS_PER_FLUSH;
				char explain[80];
				sprintf(line,"R%d %d %d",a,b,c);
				if ( b == 0 ){
					StringBuffer_printf(lend, "R%d[%d] to R%d[top] := R%d to top", a, startindex, a, a+1);
				} else if ( b == 1){
					StringBuffer_printf(lend, "R%d[%d] := R%d",a,startindex,a+1);
				} else if ( b > 1){
					StringBuffer_printf(lend, "R%d[%d] to R%d[%d] := R%d to R%d",
						a, startindex, a, startindex+b-1, a+1, a+b);
				}
				sprintf(explain, " ; R(a)[(c-1)*FPF+i] := R(a+i), 1 <= i <= b, a=%d, b=%d, c=%d, FPF=%d", a, b, c, LFIELDS_PER_FLUSH);
				StringBuffer_add(lend, explain);
			}
			break;
#if LUA_VERSION_NUM == 501
		case OP_CLOSE:
			sprintf(line,"R%d",a);
			StringBuffer_printf(lend,"SAVE R%d to top",a);
			break;
#endif
		case OP_CLOSURE:
			sprintf(line,"R%d %d",a,bc);
			if (name_len>0) {
				StringBuffer_printf(lend, "R%d := closure(Function #%s_%d)", a, name, bc);
			} else {
				StringBuffer_printf(lend, "R%d := closure(Function #%d)", a, bc);
			}
			break;
		default:
			break;
		}
		printf("%5d [-]: %-9s %-13s; %s\n",pc,luaP_opnames[o],line,StringBuffer_getRef(lend));
	}
	StringBuffer_delete(lend);
	lend = NULL;
	printf("\n\n");
	if (process_sub && f->sizep != 0) {
		char* subname = (char*)calloc(name_len + 10, sizeof(char));
		for (pc=0; pc < f->sizep; pc++) {
			if (name_len > 0){
				sprintf(subname, "%s_%d", name, pc);
			} else {
				sprintf(subname, "%d", pc);
			}
			luadec_disassemble(f->p[pc], dflag, subname);
		}
		free(subname);
	}
}
