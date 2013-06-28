/* luadec, based on luac */
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

#include "proto.h"
#include "disassemble.h"

void luaU_disassemble(Proto* fwork, int dflag, int functions, char* name) {
	char tmp[MAXCONSTSIZE+128];
	char tmp2[MAXCONSTSIZE+128];
	char *tmpconstant1 = NULL, *tmpconstant2 = NULL;
	Proto* f = fwork;
	int pc,l;
	if (functions!=0) {
		f = fwork->p[functions-1];
	}

	printf("; Name:            %s\n","");
	printf("; Defined at line: %d\n",f->linedefined);
	printf("; #Upvalues:       %d\n",f->nups);
	printf("; #Parameters:     %d\n",f->numparams);
	printf("; Is_vararg:       %d\n",f->is_vararg);
	printf("; Max Stack Size:  %d\n",f->maxstacksize);
	printf("\n");

	for (pc=0; pc<f->sizecode; pc++) {
		Instruction i = f->code[pc];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		int b = GETARG_B(i);
		int c = GETARG_C(i);
		int bc = GETARG_Bx(i);
		int sbc = GETARG_sBx(i);
		char line[100];
		char lend[MAXCONSTSIZE+128];
		sprintf(line,"%s","");
		sprintf(lend,"%s","");
		switch (o) {
	  case OP_MOVE:
		  sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
		  sprintf(lend,"%c%d := %c%d",CC(a),CV(a),CC(b),CV(b));
		  break;
	  case OP_LOADK:
		  tmpconstant1 = DecompileConstant(f,bc);
		  sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
		  sprintf(lend,"%c%d := %s",CC(a),CV(a),tmpconstant1);
		  free(tmpconstant1);
		  break;
	  case OP_LOADBOOL:
		  sprintf(line,"%c%d %d %d",CC(a),CV(a),b,c);
		  if (b) {
			  if (c) {
				  sprintf(lend,"%c%d := true; PC := %d",CC(a),CV(a),pc+2);
			  } else {
				  sprintf(lend,"%c%d := true",CC(a),CV(a));
			  }
		  } else {
			  if (c) {
				  sprintf(lend,"%c%d := false; PC := %d",CC(a),CV(a),pc+2);
			  } else {
				  sprintf(lend,"%c%d := false",CC(a),CV(a));
			  }
		  }
		  break;
	  case OP_LOADNIL:
		  sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
		  sprintf(lend,"%s","");
		  for (l=a; l<=b; l++) {
			  sprintf(tmp,"R%d := ", l);
			  strcat(lend,tmp);
		  }
		  strcat(lend,"nil");
		  break;
	  case OP_VARARG:
		  //VARARG A B
		  //R(A), R(A+1), ..., R(A+B-2) = vararg
		  //ANoFrillsIntroToLua51VMInstructions.pdf is wrong
		  sprintf(line,"%c%d %d",CC(a),CV(a),b);
		  if (b > 2) {
			  sprintf(lend, "R%d to R%d := ...", a, a+b-2);
		  } else if (b == 2){
			  sprintf(lend, "R%d := ...", a);
		  } else if (b == 0) {
			  sprintf(lend, "R%d to top := ...", a);
		  } else {
			  sprintf(lend, "");
		  }
		  break;
	  case OP_GETUPVAL:
		  sprintf(line,"%c%d U%d",CC(a),CV(a),b);
		  sprintf(lend,"%c%d := U%d",CC(a),CV(a),b);
		  break;
	  case OP_GETGLOBAL:
		  sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
		  sprintf(lend,"%c%d := %s",CC(a),CV(a),GLOBAL(bc));
		  break;
	  case OP_GETTABLE:
		  sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
		  if (IS_CONSTANT(c)) {
			  tmpconstant1 = DecompileConstant(f,INDEXK(c));
			  sprintf(lend,"R%d := R%d[%s]",a,b,tmpconstant1);
			  free(tmpconstant1);
		  } else {
			  sprintf(lend,"R%d := R%d[R%d]",a,b,c);
		  }
		  break;
	  case OP_SETGLOBAL:
		  sprintf(line,"%c%d K%d",CC(a),CV(a),bc);
		  sprintf(lend,"%s := %c%d",GLOBAL(bc), CC(a),CV(a));
		  break;
	  case OP_SETUPVAL:
		  sprintf(line,"%c%d U%d",CC(a),CV(a),b);
		  sprintf(lend,"U%d := %c%d",b, CC(a),CV(a));
		  break;
	  case OP_SETTABLE:
		  sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
		  if (IS_CONSTANT(b)) {
			  if (IS_CONSTANT(c)) {
				  tmpconstant1 = DecompileConstant(f,INDEXK(b));
				  tmpconstant2 = DecompileConstant(f,INDEXK(c));
				  sprintf(lend,"R%d[%s] := %s",a,tmpconstant1,tmpconstant2);
				  free(tmpconstant1);
				  free(tmpconstant2);
			  } else {
				  tmpconstant1 = DecompileConstant(f,INDEXK(b));
				  sprintf(lend,"R%d[%s] := R%d",a,tmpconstant1,c);
				  free(tmpconstant1);
			  }
		  } else {
			  if (IS_CONSTANT(c)) {
				  tmpconstant2 = DecompileConstant(f,INDEXK(c));
				  sprintf(lend,"R%d[R%d] := %s",a,b,tmpconstant2);
				  free(tmpconstant2);
			  } else {
				  sprintf(lend,"R%d[R%d] := R%d",a,b,c);
			  }
		  }
		  break;
	  case OP_NEWTABLE:
		  sprintf(line,"%c%d %d %d",CC(a),CV(a),b,c);
		  sprintf(lend,"%c%d := {}",CC(a),CV(a));
		  break;
	  case OP_SELF:
		  sprintf(line,"R%d R%d %c%d",a,b,CC(c),CV(c));
		  if (IS_CONSTANT(c)) {
			  tmpconstant1 = DecompileConstant(f,INDEXK(c));
			  sprintf(lend,"R%d := R%d; R%d := R%d[%s]",a+1,b,a,b,tmpconstant1);
			  free(tmpconstant1);
		  } else {
			  sprintf(lend,"R%d := R%d; R%d := R%d[R%d]",a+1,b,a,b,c);
		  }
		  break;
	  case OP_ADD:
	  case OP_SUB:
	  case OP_MUL:
	  case OP_DIV:
	  case OP_POW:
	  case OP_MOD:
		  sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
		  if (IS_CONSTANT(b)) {
			  if (IS_CONSTANT(c)) {
				  tmpconstant1 = DecompileConstant(f,INDEXK(b));
				  tmpconstant2 = DecompileConstant(f,INDEXK(c));
				  sprintf(lend,"R%d := %s %s %s",a,tmpconstant1,operators[o],tmpconstant2);
				  free(tmpconstant1);
				  free(tmpconstant2);
			  } else {
				  tmpconstant1 = DecompileConstant(f,INDEXK(b));
				  sprintf(lend,"R%d := %s %s R%d",a,tmpconstant1,operators[o],c);
				  free(tmpconstant1);
			  }
		  } else {
			  if (IS_CONSTANT(c)) {
				  tmpconstant2 = DecompileConstant(f,INDEXK(c));
				  sprintf(lend,"R%d := R%d %s %s",a,b,operators[o],tmpconstant2);
				  free(tmpconstant2);
			  } else {
				  sprintf(lend,"R%d := R%d %s R%d",a,b,operators[o],c);
			  }
		  }
		  break;
	  case OP_UNM:
	  case OP_NOT:
	  case OP_LEN:
		  sprintf(line,"%c%d %c%d",CC(a),CV(a),CC(b),CV(b));
		  if (IS_CONSTANT(b)) {
			  tmpconstant1 = DecompileConstant(f,INDEXK(b));
			  sprintf(lend,"R%d := %s %s",a,operators[o],tmpconstant1);
			  free(tmpconstant1);
		  } else {
			  sprintf(lend,"R%d := %s R%d",a,operators[o],b);
		  }
		  break;
	  case OP_CONCAT:
		  sprintf(line,"%c%d %c%d %c%d",CC(a),CV(a),CC(b),CV(b),CC(c),CV(c));
		  sprintf(lend,"R%d := ",a);
		  for (l=b; l<c; l++) {
			  sprintf(tmp,"R%d .. ", l);
			  strcat(lend,tmp);
		  }
		  sprintf(tmp,"R%d",c);
		  strcat(lend,tmp);
		  break;
	  case OP_JMP:
		  {
			  int dest = sbc + pc + 1;
			  sprintf(line, "%d",dest);
			  sprintf(lend, "PC := %d",dest);
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
				  sprintf(lend,"if %s %s %s then PC := %d else PC := %d",tmp,invopstr(o),tmp2,pc+2,dest);
			  } else {
				  sprintf(lend,"if %s %s %s then PC := %d else PC := %d",tmp,opstr(o),tmp2,pc+2,dest);
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
				  sprintf(lend,"if not %s then PC := %d else PC := %d",tmp,pc+2,dest);
			  } else {
				  sprintf(lend,"if %s then PC := %d else PC := %d",tmp,pc+2,dest);
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
				  sprintf(lend,"if %s then %s := %s ; PC := %d else PC := %d",tmp2,tmp,tmp2,pc+2,dest);
			  } else {
				  sprintf(lend,"if not %s then %s := %s ; PC := %d else PC := %d",tmp2,tmp,tmp2,pc+2,dest);
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
				  sprintf(tmp2, "R%d to R%d", a, a+c-2);
			  } else if (c==0) {
				  sprintf(tmp2,"R%d to top := ",a);
			  } else {
				  sprintf(tmp2,"%s","");
			  }
			  sprintf(lend,"%sR%d(%s)",tmp2,a,tmp);
		  }
		  break;
	  case OP_RETURN:
		  {
			  sprintf(line,"R%d %d",a,b);
			  if (b>=2) {
				  sprintf(tmp,"%s","");
				  for (l=a;l<a+b-2;l++) {
					  sprintf(lend,"R%d,",l);
					  strcat(tmp,lend);
						}
				  sprintf(lend,"R%d",a+b-2);
				  strcat(tmp,lend);
			  } else if (b==0) {
				  sprintf(tmp,"R%d to top",a);
			  } else {
				  sprintf(tmp,"%s","");
					}
			  sprintf(lend,"return %s",tmp);
		  }
		  break;
	  case OP_FORLOOP:
		  {
			  sprintf(line,"R%d %d",a,pc+sbc+1);
			  sprintf(lend,"R%d += R%d; if R%d <= R%d then begin PC := %d; R%d := R%d end",a,a+2,a,a+1,pc+sbc+1,a+3,a);
		  }
		  break;
	  case OP_TFORLOOP:
		  {
			  //int dest = GETARG_sBx(f->code[pc+1]) + pc + 2;
			  sprintf(line,"R%d %d",a,c);
			  if (c>=1) {
				  sprintf(tmp2,"%s","");
				  for (l=a+3;l<a+c+2;l++) {
					  sprintf(lend,"R%d,",l);
					  strcat(tmp2,lend);
				  }
				  sprintf(lend,"R%d := ",a+c+2);
				  strcat(tmp2,lend);
			  } else {
				  sprintf(tmp2,"R%d to top := ",a);
			  }
			  sprintf(lend,"%s R%d(R%d,R%d); if R%d ~= nil then R%d := R%d else PC := %d",tmp2, a,a+1,a+2, a+3, a+2, a+3, pc+2);
		  }
		  break;
	  case OP_FORPREP:
		  {
			  sprintf(line,"R%d %d",a,pc+sbc+1);
			  sprintf(lend,"R%d -= R%d; PC := %d",a,a+2,pc+sbc+1);
		  }
		  break;
	  case OP_SETLIST:
		  {
			  int startindex = (c-1)*LFIELDS_PER_FLUSH;
			  char explain[80];
			  sprintf(line,"R%d %d %d",a,b,c);
			  if ( b == 0 ){
				  sprintf(lend, "R%d[%d] to R%d[top] := R%d to top", a, startindex, a, a+1);
			  } else if ( b == 1){
				  sprintf(lend, "R%d[%d] := R%d",a,startindex,a+1);
			  } else if ( b > 1){
				  sprintf(lend, "R%d[%d] to R%d[%d] := R%d to R%d",
					  a, startindex, a, startindex+b-1, a+1, a+b);
			  }
			  sprintf(explain, " ; R(a)[(c-1)*FPF+i] := R(a+i), 1 <= i <= b, a=%d, b=%d, c=%d, FPF=%d", a, b, c, LFIELDS_PER_FLUSH);
			  strcat(lend, explain);
		  }
		  break;
	  case OP_CLOSE:
		  sprintf(line,"R%d",a);
		  sprintf(lend,"SAVE R%d to top",a);
		  break;
	  case OP_CLOSURE:
		  sprintf(line,"R%d %d",a,bc);
		  if (strlen(name)==0) {
			  sprintf(lend,"R%d := closure(Function #%d)",a,bc+1);
		  } else {
			  sprintf(lend,"R%d := closure(Function #%s_%d)",a,name,bc+1);
		  }
		  break;
	  default:
		  break;
		}
		printf("%5d [-]: %-9s %-13s; %s\n",pc,luaP_opnames[o],line,lend);
	}
	printf("\n\n");
	if (f->sizep !=0) {
		for (pc=0; pc < f->sizep; pc++) {
			char n[256];
			if (strlen(name)==0) {
				sprintf(n,"%d",pc + 1);
			} else {
				sprintf(n,"%s_%d",name,pc + 1);
			}
			printf("; Function #%s:\n",n);
			printf(";\n");
			luaU_disassemble(f->p[pc],dflag,0,n);
		}
	}
}
