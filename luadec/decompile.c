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

#include "lua-compat.h"
#include "StringBuffer.h"
#include "structs.h"
#include "proto.h"
#include "ast.h"
#include "decompile.h"

#define DEBUG_PRINT

#define stddebug stdout

extern int locals;
extern int localdeclare[255][255];
extern int functionnum;
extern int process_sub;           /* process sub functions? */
extern int func_check;            /* compile decompiled function and compare */
extern int guess_locals;
extern lua_State* glstate;
extern Proto* glproto;

char unknown_local[] = { "ERROR_unknown_local_xxxx" };
char unknown_upvalue[] = { "ERROR_unknown_upvalue_xxxx" };
StringBuffer* errorStr;
char errortmp[256];

/*
* -------------------------------------------------------------------------
*/

void FixLocalNames(Proto* f, const char* funcnumstr) {
	int i;
	char* tmpname = (char*)calloc(strlen(funcnumstr) + 12, sizeof(char));
	int need_arg = NEED_ARG(f);
	int func_endpc = FUNC_BLOCK_END(f);

	if (f->sizelocvars < f->numparams + need_arg) {
		f->locvars = luaM_reallocvector(glstate, f->locvars, f->sizelocvars, f->numparams + need_arg, LocVar);
		for (i = f->sizelocvars; i < f->numparams; i++) {
			sprintf(tmpname, "p_%s_%d", funcnumstr, i);
			f->locvars[i].varname = luaS_new(glstate, tmpname);
			f->locvars[i].startpc = 0;
			f->locvars[i].endpc = func_endpc;
		}
		if (need_arg) {
			sprintf(tmpname, "arg");
			f->locvars[i].varname = luaS_new(glstate, tmpname);
			f->locvars[i].startpc = 0;
			f->locvars[i].endpc = func_endpc;
		}
		f->sizelocvars = f->numparams + need_arg;
	}
	for (i = 0; i < f->sizelocvars; i++) {
		TString* name = f->locvars[i].varname;
		if (name == NULL || LUA_STRLEN(name) == 0 ||
			strlen(getstr(name)) == 0 || !isIdentifier(getstr(name))) {
			sprintf(tmpname, "l_%s_%d", funcnumstr, i);
			name = luaS_new(glstate, tmpname);
			f->locvars[i].varname = name;
		}
	}
	free(tmpname);
}

// i : index of Proto.locvars, not reg number
const char* getLocalName(const Proto* f, int i) {
	if (f->locvars && i < f->sizelocvars) {
		// no need to test after FixLocalNames
		return getstr(f->locvars[i].varname);
	} else {
		sprintf(unknown_local, "ERROR_unknown_local_%d", i);
		return unknown_local;
	}
}

// i : index of Proto.upvalues
const char* getUpvalName(const Proto* f, int i) {
	if (f->upvalues && i < f->sizeupvalues) {
		// no need to test after FixUpvalNames
		return getstr(UPVAL_NAME(f, i));
	} else {
		sprintf(unknown_upvalue, "ERROR_unknown_upvalue_%d", i);
		return unknown_upvalue;
	}
}

char* luadec_strdup(const char* src) {
	return ((src) ? strdup(src) : NULL);
}

#define UPVALUE(i) (getUpvalName(F->f,i))
#define LOCAL(i) (getLocalName(F->f,i))
#define LOCAL_STARTPC(i) F->f->locvars[i].startpc
#define LOCAL_ENDPC(i) F->f->locvars[i].endpc
#define REGISTER(r) F->R[r]
#define PRIORITY(r) (r>=MAXSTACK ? 0 : F->Rprio[r])
#define PENDING(r) F->Rpend[r]
#define CALL(r) F->Rcall[r]
#define IS_TABLE(r) F->Rtabl[r]
#define IS_VARIABLE(r) F->Rvar[r]

#define MAX(a,b) (((a)>(b))?(a):(b))
#define MIN(a,b) (((a)<(b))?(a):(b))

#define SET_ERROR(F,e) { StringBuffer_printf(errorStr,"-- DECOMPILER ERROR at PC%d: %s\n", (F)->pc, (e)); RawAddStatement((F),errorStr); }
/*  error = e; errorCode = __LINE__; */ /*if (debug) { printf("DECOMPILER ERROR: %s\n", e);  }*/

extern int debug;

static char* error;
static int errorCode;

int GetJmpAddr(Function* F, int addr) {
	int real_end = addr;
	if (real_end >= F->f->sizecode) {
		real_end = F->f->sizecode;
		return real_end;
	}
	if (real_end < 0) {
		real_end = -1;
		return real_end;
	}
	while (GET_OPCODE(F->f->code[real_end]) == OP_JMP) {
		real_end = GETARG_sBx(F->f->code[real_end]) + real_end + 1;
	}
	return real_end;
}

void RawAddStatement(Function* F, StringBuffer* str);
void DeclareLocal(Function* F, int ixx, const char* value);

LoopItem* NewLoopItem(LoopType type, int prep, int start, int body, int end, int out) {
	LoopItem* self = (LoopItem*)calloc(1, sizeof(LoopItem));

	self->parent = NULL;
	self->child = NULL;
	self->prev = NULL;
	self->next = NULL;

	self->type = type;
	self->prep = prep;
	self->start = start;
	self->body = body;
	self->end = end;
	self->out = out;

	return self;
}

int MatchLoopItem(LoopItem* item, LoopItem* match) {
	return ((item->type == match->type)||(match->type == INT_MIN))
		&& ((item->prep == match->prep)||(match->prep == INT_MIN))
		&& ((item->start == match->start)||(match->start == INT_MIN))
		&& ((item->body == match->body)||(match->body == INT_MIN))
		&& ((item->end == match->end)||(match->end == INT_MIN))
		&& ((item->out == match->out)||(match->out == INT_MIN));
}

int AddToLoopTree(Function* F, LoopItem* item) {
	while (F->loop_ptr) {
		if (item->start >= F->loop_ptr->start && item->end < F->loop_ptr->end) {
			//find parent , then insert as the first child
			item->parent = F->loop_ptr;
			item->next = F->loop_ptr->child;
			item->prev = NULL;
			item->child = NULL;
			item->indent = F->loop_ptr->indent + 1;

			if (F->loop_ptr->child) {
				F->loop_ptr->child->prev = item;
			}
			F->loop_ptr->child = item;
			F->loop_ptr = item;
			return 1;
		} else {
			F->loop_ptr = F->loop_ptr->parent;
		}
	}
	return 0;
}

void DeleteLoopTree(LoopItem* item) {
	LoopItem* next = item;
	while (item) {
		if (item->child) {
			next = item->child;
			item->child = NULL;
		} else {
			if (item->next) {
				next = item->next;
				item->next = NULL;
			} else {
				next = item->parent;
			}
			free(item);
		}
		item = next;
	}
}

void DeleteLoopTree2(LoopItem* item) {
	if (item == NULL) return;
	DeleteLoopTree2(item->child);
	DeleteLoopTree2(item->next);
	free(item);
}

IntListItem* NewIntListItem(int v) {
	IntListItem* self = (IntListItem*)calloc(1, sizeof(IntListItem));
	self->super.prev = NULL;
	self->super.next = NULL;
	self->value = v;
	return self;
}

int MatchIntListItem(IntListItem* item, int* match_value) {
	return (item->value == *match_value);
}

void DeleteIntListItem(IntListItem* item, void* dummy) {
	free(item);
}

LogicExp* MakeExpNode(BoolOp* boolOp) {
	LogicExp* node = (LogicExp*)calloc(1, sizeof(LogicExp));
	node->parent = NULL;
	node->subexp = NULL;
	node->next = NULL;
	node->prev = NULL;
	node->op1 = luadec_strdup(boolOp->op1);
	node->op2 = luadec_strdup(boolOp->op2);
	node->op = boolOp->op;
	node->dest = boolOp->dest;
	node->neg = boolOp->neg;
	node->is_chain = 0;
	return node;
}

LogicExp* MakeExpChain(int dest) {
	LogicExp* node = (LogicExp*)calloc(1, sizeof(LogicExp));
	node->parent = NULL;
	node->subexp = NULL;
	node->next = NULL;
	node->prev = NULL;
	node->op1 = NULL;
	node->op2 = NULL;
	node->neg = 0;
	node->dest = dest;
	node->is_chain = 1;
	return node;
}

LogicExp* FindLogicExpTreeRoot(LogicExp* exp) {
	LogicExp* curr = exp;
	while (curr->parent) {
		curr = curr->parent;
	}
	return curr;
}

void DeleteLogicExpSubTree(LogicExp* exp) {
	if (exp) {
		DeleteLogicExpSubTree(exp->subexp);
		DeleteLogicExpSubTree(exp->next);
		if (exp->op1) {
			free(exp->op1);
		}
		if (exp->op2) {
			free(exp->op2);
		}
		free(exp);
	}
}

void DeleteLogicExpTree(LogicExp* exp) {
	if (exp) {
		LogicExp* root = FindLogicExpTreeRoot(exp);
		DeleteLogicExpSubTree(root);
	}
}

void PrintLogicItem(StringBuffer* str, LogicExp* exp, int inv, int rev) {
	if (exp->subexp) {
		StringBuffer_addChar(str, '(');
		PrintLogicExp(str, exp->dest, exp->subexp, inv, rev);
		StringBuffer_addChar(str, ')');
	} else {
		char* op;
		int cond = exp->neg;
		if (inv) cond = !cond;
		if (rev) cond = !cond;
		if (cond) {
			op = invopstr(exp->op);
		} else {
			op = opstr(exp->op);
		}
		if ((exp->op != OP_TEST) && (exp->op != OP_TESTSET)) {
			StringBuffer_addPrintf(str, "%s %s %s", exp->op1, op, exp->op2);
		} else if (op) {
			StringBuffer_addPrintf(str, "%s %s", op, exp->op2);
		} else {
			StringBuffer_addPrintf(str, "%s", exp->op2);
		}
	}
}

void PrintLogicExp(StringBuffer* str, int dest, LogicExp* exp, int inv_, int rev) {
	int inv = inv_;
	while (exp->next) {
		char* op;
		int cond = exp->dest > dest;
		inv = cond ? inv_ : !inv_;
		PrintLogicItem(str, exp, inv, rev);
		exp = exp->next;
		if (inv_) cond = !cond;
		if (rev) cond = !cond;
		op = cond ? "and" : "or";
		StringBuffer_addPrintf(str, " %s ", op);
	}
	PrintLogicItem(str, exp, inv_, rev);
}

void TieAsNext(LogicExp* curr, LogicExp* item) {
	curr->next = item;
	item->prev = curr;
	item->parent = curr->parent;
}

void Untie(LogicExp* curr, int* thenaddr) {
	LogicExp* previous = curr->prev;
	if (previous) {
		previous->next = NULL;
	}
	curr->prev = NULL;
	curr->parent = NULL;
}


void TieAsSubExp(LogicExp* parent, LogicExp* item) {
	parent->subexp = item;
	while (item) {
		item->parent = parent;
		item = item->next;
	}
}

LogicExp* MakeBoolean(Function* F, int* thenaddr, int* endif) {
	int i;
	int firstaddr, elseaddr;
	BoolOp *first, *realLast, *last, *tmpLast, *curr;
	int lastCount;
	LogicExp *currExp=NULL, *firstExp=NULL;
	int dest;

	if (endif) {
		*endif = 0;
	}

	if (F->bools.size == 0) {
		SET_ERROR(F,"Attempted to build a boolean expression without a pending context");
		return NULL;
	}

	first = (BoolOp*)FirstItem(&(F->bools));
	realLast = (BoolOp*)LastItem(&(F->bools));
	last = realLast;
	firstaddr = first->pc + 2;
	*thenaddr = last->pc + 2;
	elseaddr = last->dest;

	for (curr = realLast; curr; curr = cast(BoolOp*, curr->super.prev)) {
		int dest = curr->dest;
		if ((elseaddr > *thenaddr) &&
			(((curr->op == OP_TEST) || (curr->op == OP_TESTSET)) ? (dest > elseaddr+1) :
			(dest > elseaddr))) {
				last = curr;
				*thenaddr = curr->pc + 2;
				elseaddr = dest;
		}
	}

	tmpLast = last;
	for (curr = first; curr && curr != tmpLast; curr = cast(BoolOp*, curr->super.next)) {
		int dest = curr->dest;
		if (elseaddr > firstaddr) {
			if (dest < firstaddr) {
				last = curr;
				*thenaddr = curr->pc + 2;
				elseaddr = dest;
			}
		} else {
			if (dest == firstaddr) {
				last = curr;
				*thenaddr = curr->pc + 2;
				elseaddr = dest;
			} else {
				break;
			}
		}
	}

	dest = first->dest;
	currExp = MakeExpNode(first);

	if (dest > firstaddr && dest <= *thenaddr) {
		firstExp = MakeExpChain(dest);
		TieAsSubExp(firstExp, currExp);
	} else {
		firstExp = currExp;
		if (endif) {
			*endif = dest;
		}
	}

	if (debug) {
		printf("\n");
		for (curr = first, i = 0; curr && curr != cast(BoolOp*, last->super.next); i++, curr = cast(BoolOp*, curr->super.next)) {
			BoolOp* op = curr;
			if (debug) {
				printf("Exps(%d): at %d\tdest %d\tneg %d\t(%s %s %s) cpd %d \n", i,
					op->pc, op->dest, op->neg, op->op1, opstr(op->op), op->op2, currExp->parent ? currExp->parent->dest : -1);
			}
		}
		printf("\n");
	}

	for (curr = cast(BoolOp*, first->super.next), lastCount = 1; curr && curr != cast(BoolOp*, last->super.next); curr = cast(BoolOp*, curr->super.next), lastCount++) {
		BoolOp* op = curr;
		int at = op->pc;
		int dest = op->dest;

		LogicExp* exp = MakeExpNode(op);
		if (dest < firstaddr) {
			/* jump to loop in a while */
			TieAsNext(currExp, exp);
			currExp = exp;
			if (endif)
				*endif = dest;
		} else if (dest > *thenaddr) {
			/* jump to "else" */
			TieAsNext(currExp, exp);
			currExp = exp;
			if (endif) {
				if ((op->op != OP_TEST) && (op->op != OP_TESTSET)) {
					if (*endif != 0 && *endif != dest) {
						SET_ERROR(F,"Unhandled construct in 'MakeBoolean' P1");
						//return NULL;
					}
				}
				*endif = dest;
			}
		} else if (dest == currExp->dest) {
			/* within current chain */
			TieAsNext(currExp, exp);
			currExp = exp;
		} else if (dest > currExp->dest) {
			if (currExp->parent == NULL || dest < currExp->parent->dest) {
				/* creating a new level */
				LogicExp* subexp = MakeExpChain(dest);
				LogicExp* savecurr;
				TieAsNext(currExp, exp);
				currExp = exp;
				savecurr = currExp;
				if (currExp->parent == NULL) {
					TieAsSubExp(subexp, firstExp);
					firstExp = subexp;
				}
			} else if (dest > currExp->parent->dest) {
				/* start a new chain */
				LogicExp* prevParent;
				LogicExp* chain;
				TieAsNext(currExp, exp);
				currExp = currExp->parent;
				if (!currExp->is_chain) {
					DeleteLogicExpTree(firstExp);
					SET_ERROR(F,"Unhandled construct in 'MakeBoolean' P2");
					return NULL;
				};
				prevParent = currExp->parent;
				chain = MakeExpChain(dest);
				Untie(currExp, thenaddr);
				if (prevParent && prevParent->is_chain) {
					prevParent = prevParent->subexp;
				}
				TieAsSubExp(chain, currExp);

				//currExp->parent = prevParent; // WHY use this line cause a memory leak, but output is better
				if (prevParent == NULL) {
					firstExp = chain;
				} else {
					// todo
					TieAsNext(prevParent, chain);
				}
			} else {
				SET_ERROR(F,"Unhandled construct in 'MakeBoolean' P3");
				DeleteLogicExpSubTree(exp);
			}
		} else if (dest > firstaddr && dest < currExp->dest) {
			/* start a new chain */
			LogicExp* subexp = MakeExpChain(dest);
			TieAsSubExp(subexp, exp);
			TieAsNext(currExp, subexp);
			currExp = exp;
		} else {
			DeleteLogicExpSubTree(exp);
			DeleteLogicExpTree(firstExp);
			SET_ERROR(F,"Unhandled construct in 'MakeBoolean' P4");
			return NULL;
		}

		if (currExp->parent && at+3 > currExp->parent->dest) {
			currExp->parent->dest = currExp->dest;
			if (curr != last) {
				LogicExp* chain = MakeExpChain(currExp->dest);
				TieAsSubExp(chain, firstExp);
				firstExp = chain;
			}
			currExp = currExp->parent;
		}
	}
	if (firstExp->is_chain) {
		firstExp = firstExp->subexp;
	}
	if (last) {
		if (F->bools.tail == (ListItem*)last) {
			F->bools.head = NULL;
			F->bools.tail = NULL;
			F->bools.size = 0;
		} else {
			F->bools.head = last->super.next;
			F->bools.head->prev = NULL;
			F->bools.size -= lastCount;
		}

	}
	curr = last; 
	while (curr) {
		BoolOp* prev = cast(BoolOp*, curr->super.prev);
		DeleteBoolOp(curr);
		curr = prev;
	}
	if (endif && *endif == 0) {
		*endif = *thenaddr;
	}
	return firstExp;
}

char* WriteBoolean(LogicExp* exp, int* thenaddr, int* endif, int test) {
	char* result = NULL;
	StringBuffer* str = StringBuffer_new(NULL);

	if (exp) {
		PrintLogicExp(str, *thenaddr, exp, 0, test);
		if (test && endif && *endif == 0) {
			//SET_ERROR(F, "Unhandled construct in 'WriteBoolean'");
			result = (char*)calloc(30, sizeof(char));
			sprintf(result,"__UNHANDLEDCONTRUCT_1__");
			goto WriteBoolean_CLEAR_HANDLER1;
		}
	} else {
		result = (char*)calloc(30, sizeof(char));
		sprintf(result, "__UNHANDLEDCONTRUCT_2__");
		goto WriteBoolean_CLEAR_HANDLER1;
	}
	result = StringBuffer_getBuffer(str);

WriteBoolean_CLEAR_HANDLER1:
	StringBuffer_delete(str);

	return result;
}

char* OutputBoolean(Function* F, int* thenaddr, int* endif, int test) {
	char* result = NULL;
	LogicExp* exp = NULL;
	error = NULL;

	exp = MakeBoolean(F, thenaddr, endif);
	if (error) goto OutputBoolean_CLEAR_HANDLER1;
	result = WriteBoolean(exp, thenaddr, endif, test);	
	if (error) goto OutputBoolean_CLEAR_HANDLER1;

OutputBoolean_CLEAR_HANDLER1:
	if (exp) DeleteLogicExpTree(exp);

	return result;
}

void RawAddAstStatement(Function* F, AstStatement* stmt) {
	if (F->released_local) {
		AstStatement* block = F->currStmt;
		AstStatement* curr = cast(AstStatement*, block->sub->head);
		AstStatement* tail = cast(AstStatement*, block->sub->tail);
		AstStatement* prev = NULL;
		int count = 0;
		int lpc = F->released_local;
		F->released_local = 0;
		while (curr) {
			if (curr->line >= lpc) {
				break;
			}
			prev = curr;
			curr = cast(AstStatement*, prev->super.next);
			count++;
		}
		if (curr) {
			//TODO check list.size
			int blockSize = block->sub->size;

			AstStatement* dostmt = MakeBlockStatement(BLOCK_STMT, NULL);
			dostmt->line = lpc;

			while (curr) {
				AstStatement* next = cast(AstStatement*, curr->super.next);
				RemoveFromList(block->sub, cast(ListItem*,curr));
				AddToStatement(dostmt, curr);
				curr = next;
			}
			AddToStatement(block, dostmt);
			F->currStmt = dostmt;
		}
	}
	stmt->line = F->pc;
	AddToStatement(F->currStmt, stmt);
	F->lastLine = F->pc;
}

void RawAddStatement(Function* F, StringBuffer* str) {
	AstStatement* stmt = MakeSimpleStatement(StringBuffer_getBuffer(str));
	stmt->line = F->pc;
	RawAddAstStatement(F, stmt);
}

void FlushWhile1(Function* F) {
	LoopItem* walk = F->loop_ptr;
	StringBuffer* str = StringBuffer_new(NULL);

	if (walk->type == WHILE && walk->start <= F->pc && walk->body == -1) {
		AstStatement* whilestmt = MakeBlockStatement(WHILE_STMT, strdup("1"));
		RawAddAstStatement(F, whilestmt);
		F->currStmt = whilestmt;
		walk->body = walk->start;
		walk = walk->parent;
	}

	StringBuffer_delete(str);
}

void FlushBoolean(Function* F) {
	if (F->bools.size == 0) {
		FlushWhile1(F);
	}
	while (F->bools.size > 0) {
		int flushWhile = 0;
		int endif = 0, thenaddr = 0;
		char* test = NULL;
		StringBuffer* str = StringBuffer_new(NULL);
		LoopItem* walk = NULL;

		test = OutputBoolean(F, &thenaddr, &endif, 0);
		if (error) goto FlushBoolean_CLEAR_HANDLER1;

		//TODO find another method to determine while loop body to output while do
		//search parent
		walk = F->loop_ptr;
		if (walk->type == WHILE && walk->out == endif -1 && walk->body == -1) {
			int whileStart = walk->start;
			walk->body = thenaddr;
			flushWhile = 1;
		}

		if (flushWhile) {
			AstStatement* whilestmt = MakeBlockStatement(WHILE_STMT, test);
			test = NULL;
			RawAddAstStatement(F, whilestmt);
			F->currStmt = whilestmt;
		} else {
			AstStatement* ifstmt = NULL;
			FlushWhile1(F);
			ifstmt = MakeIfStatement(test);
			ThenStart(ifstmt) = thenaddr;
			ElseStart(ifstmt) = endif - 1;
			test = NULL;
			RawAddAstStatement(F, ifstmt);
			F->currStmt = ThenStmt(ifstmt);
		}

FlushBoolean_CLEAR_HANDLER1:
		if (test) free(test);
		StringBuffer_delete(str);
		if (error) return;
	}
	F->testpending = 0;
}

void DeclareLocalsAddStatement(Function* F, StringBuffer* statement) {
	if (F->pc > 0) {
		FlushBoolean(F);
		if (error) return;
	}
	RawAddStatement(F, statement);
}

void AddStatement(Function* F, StringBuffer* statement) {
	FlushBoolean(F);
	if (error) return;

	RawAddStatement(F, statement);
}

void AddAstStatement(Function* F, AstStatement* stmt) {
	FlushBoolean(F);
	if (error) return;

	RawAddAstStatement(F, stmt);
}

/*
* -------------------------------------------------------------------------
*/

void DeclarePendingLocals(Function* F);

void AssignGlobalOrUpvalue(Function* F, const char* dest, const char* src) {
	F->testjump = 0;
	AddToVarList(&(F->vpend), luadec_strdup(dest), luadec_strdup(src), -1);
}

void AssignReg(Function* F, int reg, const char* src, int prio, int mayTest) {
	char* dest = REGISTER(reg);
	char* nsrc = NULL;

	if (PENDING(reg)) {
		if (guess_locals) {
			sprintf(errortmp, "Overwrote pending register: R%d in 'AssignReg'", reg);
			SET_ERROR(F, errortmp);
		} else {
			sprintf(errortmp, "Overwrote pending register: R%d in 'AssignReg'. Creating missing local", reg);
			SET_ERROR(F, errortmp);
			DeclareLocal(F, reg, dest);
		}
		return;
	}

	PENDING(reg) = 1;
	CALL(reg) = 0;
	F->Rprio[reg] = prio;

	if (debug) {
		printf("SET_SIZE(tpend) = %d \n", SET_SIZE(F->tpend));
	}

	nsrc = luadec_strdup(src);
	if (F->testpending == reg+1 && mayTest && F->testjump == F->pc+2) {
		int thenaddr, endif;
		char* test = OutputBoolean(F, &thenaddr, &endif, 1);
		if (error) {
			free(nsrc);
			if (test) free(test);
			return;
		}
		if (endif >= F->pc) {
			StringBuffer* str = StringBuffer_new(NULL);
			StringBuffer_printf(str, "%s or %s", test, src);
			free(nsrc);
			nsrc = StringBuffer_getBuffer(str);
			StringBuffer_delete(str);
			F->testpending = 0;
			F->Rprio[reg] = 8;
		}
		if (test) free(test);
	}
	F->testjump = 0;

	if (!IS_VARIABLE(reg)) {
		if (REGISTER(reg)) free(REGISTER(reg));
		REGISTER(reg) = nsrc;
		AddToSet(F->tpend, reg);
	} else {
		AddToVarList(&(F->vpend), luadec_strdup(dest), nsrc, reg);
	}
}

/*
** Table Functions
*/

DecTableItem* NewTableItem(const char* value, int index, const char* key) {
	DecTableItem* self = (DecTableItem*)calloc(1, sizeof(DecTableItem));
	self->super.prev = NULL;
	self->super.next = NULL;
	self->value = luadec_strdup(value);
	self->index = index;
	self->key = luadec_strdup(key);
	return self;
}

void ClearTableItem(DecTableItem* item, void* dummy) {
	if (item) {
		if (item->key) {
			free(item->key);
		}
		if (item->value) {
			free(item->value);
		}
	}
}

void DeleteTableItem(DecTableItem* item) {
	ClearTableItem(item, NULL);
	free(item);
}

int MatchTable(DecTable* tbl, int* reg) {
	return tbl->reg == *reg;
}

void DeleteTable(DecTable* tbl) {
	ClearList(&(tbl->keyed), (ListItemFn)ClearTableItem);
	ClearList(&(tbl->array), (ListItemFn)ClearTableItem);
	free(tbl);
}

void CloseTable(Function* F, int r) {
	DecTable* tbl = (DecTable*)RemoveFromList(&(F->tables), FindFromListTail(&(F->tables), (ListItemCmpFn)MatchTable, &r));
	DeleteTable(tbl);
	IS_TABLE(r) = 0;
}

void PrintTableItemNumeric(StringBuffer* str, DecTableItem* item) {
	char* value = item->value;
	if (value[0] == '{' && StringBuffer_lastChar(str) != '\n') {
		StringBuffer_add(str, "\n");
	}
	StringBuffer_add(str, value);
	if (value[strlen(value) - 1] == '}') {
		StringBuffer_add(str, "\n");
	}
}

void PrintTableItemKeyed(Function* F, StringBuffer* str, DecTableItem* item) {
	char* value = item->value;
	if (value[0] == '{' && StringBuffer_lastChar(str) != '\n') {
		StringBuffer_add(str, "\n");
	}
	MakeIndex(F, str, item->key, TABLE);
	StringBuffer_addPrintf(str, " = %s", item->value);
	if (value[strlen(value) - 1] == '}') {
		StringBuffer_add(str, "\n");
	}
}

char* PrintTable(Function* F, int r, int returnCopy) {
	char* result = NULL;
	int numerics = 0;
	DecTableItem* item;
	StringBuffer* str = StringBuffer_new("{");
	DecTable* tbl = (DecTable*)FindFromListTail(&(F->tables), (ListItemCmpFn)MatchTable, &r);
	if (tbl == NULL) {
		IS_TABLE(r) = 0;
		return F->R[r];
	}
	item = cast(DecTableItem*, tbl->array.head);
	if (item) {
		numerics = 1;
		PrintTableItemNumeric(str, item);
		item = cast(DecTableItem*, item->super.next);
		while (item) {
			StringBuffer_add(str, ", ");
			PrintTableItemNumeric(str, item);
			item = cast(DecTableItem*, item->super.next);
		}
	}
	item = cast(DecTableItem*, tbl->keyed.head);
	if (item) {
		if (numerics) {
			StringBuffer_add(str, "; ");
		}
		PrintTableItemKeyed(F, str, item);
		item = cast(DecTableItem*, item->super.next);
		while (item) {
			StringBuffer_add(str, ", ");
			PrintTableItemKeyed(F, str, item);
			item = cast(DecTableItem*, item->super.next);
		}
	}
	StringBuffer_addChar(str, '}');
	PENDING(r) = 0;
	AssignReg(F, r, StringBuffer_getRef(str), 0, 0);
	if (error) {
		result = NULL;
	} else if (returnCopy) {
		result = StringBuffer_getBuffer(str);
	}
	StringBuffer_delete(str);
	CloseTable(F, r);
	return result;
}

DecTable* NewTable(int r, int b, int c, int pc) {
	DecTable* self = (DecTable*)calloc(1, sizeof(DecTable));
	self->super.prev = NULL;
	self->super.next = NULL;
	InitList(&(self->array));
	InitList(&(self->keyed));
	self->reg = r;
	self->arraySize = luaO_fb2int(b);
	self->keyedSize = luaO_fb2int(c);
	self->pc = pc;
	return self;
}

void StartTable(Function* F, int r, int b, int c, int pc) {
	DecTable* tbl = NewTable(r, b, c, pc);
	AddToListHead(&(F->tables), (ListItem*)tbl);
	PENDING(r) = 1;
	IS_TABLE(r) = 1;
}

void AddToTable(Function* F, DecTable* tbl, const char* value, const char* key) {
	DecTableItem* item;
	List* list;
	if (key == NULL) {
		list = &(tbl->array);
		item = NewTableItem(value, list->size, NULL);
	} else {
		list = &(tbl->keyed);
		item = NewTableItem(value, 0, key);
	}
	AddToList(list, (ListItem*)item);
}

void SetList(Function* F, int a, int b, int c) {
	int i;
	DecTable* tbl = (DecTable*)FindFromListTail(&(F->tables), (ListItemCmpFn)MatchTable, &a);
	if (tbl == NULL) {
		sprintf(errortmp, "No list found for R%d , SetList fails", a);
		SET_ERROR(F, errortmp);
		return;
	}
	if (b == 0) {
		const char* rstr;
		i = 1;
		while (1) {
			rstr = GetR(F, a + i);
			if (error)
				return;
			if (strcmp(rstr,".end") == 0)
				break;
			AddToTable(F, tbl, rstr, NULL); // Lua5.1 specific TODO: it's not really this :(
			i++;
		};
	} //should be {...} or func(func()) ,when b == 0, that will use all avaliable reg from R(a)

	for (i = 1; i <= b; i++) {
		const char* rstr = GetR(F, a + i);
		if (error)
			return;
		AddToTable(F, tbl, rstr, NULL); // Lua5.1 specific TODO: it's not really this :(
	}
}

void UnsetPending(Function* F, int r) {
	if (!IS_VARIABLE(r)) {
		if (!PENDING(r) && !CALL(r)) {
			if (guess_locals) {
				sprintf(errortmp, "Confused about usage of register: R%d in 'UnsetPending'", r);
				SET_ERROR(F, errortmp);
			} else {
				sprintf(errortmp, "Confused about usage of register: R%d in 'UnsetPending'. Creating missing local", r);
				SET_ERROR(F, errortmp);
				DeclareLocal(F, r, REGISTER(r));
			}
			return;
		}
		PENDING(r) = 0;
		RemoveFromSet(F->tpend, r);
	}
}

int SetTable(Function* F, int a, char* bstr, char* cstr) {
	DecTable* tbl = (DecTable*)FindFromListTail(&(F->tables), (ListItemCmpFn)MatchTable, &a);
	if (tbl==NULL) {
		UnsetPending(F, a);
		return 0;
	}
	AddToTable(F, tbl, cstr, bstr);
	return 1;
}

/*
** BoolOp Functions
*/

BoolOp* NewBoolOp() {
	BoolOp* value = (BoolOp*)calloc(1, sizeof(BoolOp));
	value->super.prev = NULL;
	value->super.next = NULL;
	value->op1 = NULL;
	value->op2 = NULL;
	return value;
}

BoolOp* MakeBoolOp(char* op1, char* op2, OpCode op, int neg, int pc, int dest) {
	BoolOp* value = (BoolOp*)calloc(1, sizeof(BoolOp));
	value->super.prev = NULL;
	value->super.next = NULL;
	value->op1 = op1;
	value->op2 = op2;
	value->op = op;
	value->neg = neg;
	value->pc = pc;
	value->dest = dest;
	return value;
}

void ClearBoolOp(BoolOp* ptr, void* dummy) {
	if (ptr) {
		if (ptr->op1) {
			free(ptr->op1);
			ptr->op1 = NULL;
		}
		if (ptr->op2) {
			free(ptr->op2);
			ptr->op2 = NULL;
		}
	}
}

void DeleteBoolOp(BoolOp* ptr) {
	ClearBoolOp(ptr, NULL);
	free(ptr);
}

/*
** -------------------------------------------------------------------------
*/

Function* NewFunction(const Proto* f) {
	Function* self = (Function*)calloc(1, sizeof(Function));
	self->f = f;
	InitList(&(self->vpend));
	self->tpend = NewIntSet(0);

	self->loop_tree = NewLoopItem(FUNC_ROOT,-1,-1,0,f->sizecode-1,f->sizecode);
	self->loop_ptr = self->loop_tree;

	self->funcBlock = MakeBlockStatement(FUNCTION_STMT, NULL);
	self->currStmt = self->funcBlock;

	InitList(&(self->breaks));
	InitList(&(self->continues));
	InitList(&(self->jmpdests));

	self->do_opens = NewIntSet(0);
	self->do_closes = NewIntSet(0);
	self->decompiledCode = StringBuffer_new(NULL);

	InitList(&(self->bools));

	self->intspos = 0;

	self->funcnumstr = NULL;

	return self;
}

void DeleteFunction(Function* self) {
	int i;
	DeleteAstStatement(self->funcBlock);
	ClearList(&(self->bools), (ListItemFn)ClearBoolOp);
	/*
	* clean up registers
	*/
	for (i = 0; i < MAXARG_A; i++) {
		if (self->R[i]) {
			free(self->R[i]);
		}
	}
	StringBuffer_delete(self->decompiledCode);
	ClearList(&(self->vpend), (ListItemFn)ClearVarListItem);
	DeleteIntSet(self->tpend);
	ClearList(&(self->breaks), NULL);
	ClearList(&(self->continues), NULL);
	ClearList(&(self->jmpdests), (ListItemFn)ClearAstStatement);
	DeleteLoopTree(self->loop_tree);
	DeleteIntSet(self->do_opens);
	DeleteIntSet(self->do_closes);
	if (self->funcnumstr) {
		free(self->funcnumstr);
	}
	free(self);
}

void DeclareVariable(Function* F, const char* name, int reg);

const char* GetR(Function* F, int r) {
	if (IS_TABLE(r)) {
		PrintTable(F, r, 0);
		if (error) return NULL;
	}
	UnsetPending(F, r);
	if (error) return NULL;

	if (F->R[r] == NULL) {
		char sb[] = { "R%rrrrr%_PC%pcccccccc%" };
		sprintf(sb, "R%d_PC%d", r, F->pc);
		DeclareVariable(F, sb, r);
	}//dirty hack , some numeric FOR loops may cause error
	return F->R[r];
}

void DeclareVariable(Function* F, const char* name, int reg) {
	IS_VARIABLE(reg) = 1;
	if (F->R[reg]) {
		free(F->R[reg]);
	}
	F->R[reg] = luadec_strdup(name);
	F->Rprio[reg] = 0;
	UnsetPending(F, reg);
	if (error) return;
}

void OutputAssignments(Function* F) {
	int i, srcs;
	ListItem *walk, *tail;
	StringBuffer* vars = StringBuffer_new(NULL);
	StringBuffer* exps = StringBuffer_new(NULL);
	if (!SET_IS_EMPTY(F->tpend)) {
		goto OutputAssignments_ERROR_HANDLER;
	}
	srcs = 0;
	walk = F->vpend.head;
	tail = F->vpend.tail;
	i = 0;
	while (walk) {
		int r = cast(VarListItem*, walk)->reg;
		char* src = cast(VarListItem*, walk)->src;
		char* dest = cast(VarListItem*, walk)->dest;
		if (!(r == -1 || PENDING(r))) {
			sprintf(errortmp, "Confused about usage of register: R%d in 'OutputAssignments'", r);
			SET_ERROR(F, errortmp);
			goto OutputAssignments_ERROR_HANDLER;
		}

		if (i > 0) {
			StringBuffer_prepend(vars, ", ");
		}
		StringBuffer_prepend(vars, dest);

		if (src && (srcs > 0 || (srcs == 0 && strcmp(src, "nil") != 0) || walk == tail)) {
			if (srcs > 0) {
				StringBuffer_prepend(exps, ", ");
			}
			StringBuffer_prepend(exps, src);
			srcs++;
		}
		if (r != -1) {
			PENDING(r) = 0;
		}
		walk = walk->next;
		i++;
	}

	if (i > 0) {
		StringBuffer_add(vars, " = ");
		StringBuffer_add(vars, StringBuffer_getRef(exps));
		AddStatement(F, vars);
		if (error) {
			goto OutputAssignments_ERROR_HANDLER;
		}
	}
OutputAssignments_ERROR_HANDLER:
	ClearList(&(F->vpend), (ListItemFn)ClearVarListItem);
	StringBuffer_delete(vars);
	StringBuffer_delete(exps);
}

void ReleaseLocals(Function* F) {
	int i;
	for (i = F->f->sizelocvars-1; i >=0 ; i--) {
		if (F->f->locvars[i].endpc == F->pc) {
			int r;
			F->freeLocal--;
			if (F->freeLocal < 0) {
				F->freeLocal = 0;
				fprintf(stderr, "freeLocal<0 in void ReleaseLocals(Function* F)\n");
				fprintf(stderr, " at line %d in file %s\n", __LINE__, __FILE__);
				fprintf(stderr, " for lua files: ");
				printFileNames(stderr);
				fprintf(stderr, "\n");
				fprintf(stderr, " at lua function %s pc=%d\n\n", F->funcnumstr, F->pc);
				fflush(stderr);
				SET_ERROR(F, "freeLocal<0 in 'ReleaseLocals'");
				return;
			}
			r = F->freeLocal;
			//fprintf(stderr,"%d %d %d\n",i,r, F->pc);
			if (!IS_VARIABLE(r)) {
				// fprintf(stderr,"--- %d %d\n",i,r);
				sprintf(errortmp, "Confused about usage of register R%d for local variables in 'ReleaseLocals'", r);
				SET_ERROR(F, errortmp);
				return;
			}
			IS_VARIABLE(r) = 0;
			F->Rprio[r] = 0;
			if (!F->ignore_for_variables && !F->released_local) {
				F->released_local = F->f->locvars[i].startpc;
			}
		}
	}
	F->ignore_for_variables = 0;
}

void DeclareLocals(Function* F) {
	int i;
	int locals;
	int internalLocals = 0;
	//int loopstart;
	//int loopvars;
	int loopconvert;
	StringBuffer *str, *rhs;
	char* names[MAXARG_A];
	int startparams = 0;
	/*
	* Those are declaration of parameters.
	*/
	if (F->pc == 0) {
		startparams = F->f->numparams;
		if (NEED_ARG(F->f)) {
			startparams++;
		}
	}
	str = StringBuffer_new("local ");
	rhs = StringBuffer_new(" = ");
	locals = 0;
	if (F->pc != 0) {
		for (i=startparams; i < F->f->maxstacksize; i++) {
			if (functionnum >=0 && functionnum < 255 && localdeclare[functionnum][i]==F->pc) {
				int r = i;
				char* name = (char*)calloc(12, sizeof(char));
				sprintf(name,"l_%d_%d",functionnum,i);
				if (F->Rinternal[r]) {
					names[r] = name;
					F->Rinternal[r] = 0;
					internalLocals++;
					continue;
				}
				if (PENDING(r)) {
					if (locals > 0) {
						StringBuffer_add(str, ", ");
						StringBuffer_add(rhs, ", ");
					}
					StringBuffer_add(str, name);
					StringBuffer_add(rhs, GetR(F, r));
				} else {
					StringBuffer_add(str, ", ");
					StringBuffer_add(str, name);
				}
				CALL(r) = 0;
				IS_VARIABLE(r) = 1;
				names[r] = name;
				locals++;
			}
		}
	}
	loopconvert = 0;
	for (i = startparams; i < F->f->sizelocvars; i++) {
		if (F->f->locvars[i].startpc == F->pc) {
			int r = F->freeLocal + locals + internalLocals;
			Instruction instr = F->f->code[F->pc];
			// handle FOR loops
			if (GET_OPCODE(instr) == OP_FORPREP) {
				F->f->locvars[i].startpc = F->pc+1;
				continue;
			}
			// handle TFOR loops
			if (GET_OPCODE(instr) == OP_JMP) {
				Instruction n2 = F->f->code[F->pc+1+GETARG_sBx(instr)];
				//fprintf(stderr,"3 %d\n",F->pc+1+GETARG_sBx(instr));
				//fprintf(stderr,"4 %s %d\n",luaP_opnames[GET_OPCODE(n2)], F->pc+GETARG_sBx(instr));
				if (GET_OPCODE(n2) == LUADEC_TFORLOOP) {
					F->f->locvars[i].startpc = F->pc+1;
					continue;
				}
			}
			if ((F->Rinternal[r])) {
				names[r] = luadec_strdup(LOCAL(i));
				PENDING(r) = 0;
				IS_VARIABLE(r) = 1;
				F->Rinternal[r] = 0;
				internalLocals++;
				continue;
			}
			if (PENDING(r)) {
				if (locals > 0) {
					StringBuffer_add(str, ", ");
					StringBuffer_add(rhs, ", ");
				}
				StringBuffer_add(str, LOCAL(i));
				StringBuffer_add(rhs, GetR(F, r));
				if (error) return;
			} else {
				if (locals > 0) {
					StringBuffer_add(str, ", ");
				}
				StringBuffer_add(str, LOCAL(i));
			}
			CALL(r) = 0;
			IS_VARIABLE(r) = 1;
			names[r] = luadec_strdup(LOCAL(i));
			locals++;
		}
	}
	if (locals > 0) {
		StringBuffer_add(str, StringBuffer_getRef(rhs));
		if (strcmp(StringBuffer_getRef(rhs)," = ") == 0) {
			StringBuffer_add(str,"nil");
		}
		DeclareLocalsAddStatement(F, str);
		if (error) return;
	}
	StringBuffer_delete(rhs);
	StringBuffer_delete(str);
	for (i = 0; i < locals + internalLocals; i++) {
		int r = F->freeLocal + i;
		DeclareVariable(F, names[r], r);
		if (names[r]) free(names[r]);
		if (error) return;
	}
	F->freeLocal += locals + internalLocals;
}

void PrintFunctionCheck(Function* F) {
}

char* PrintFunction(Function* F) {
	StringBuffer* buff = F->decompiledCode;
	int indent = F->indent;
	PrintFunctionCheck(F);
	StringBuffer_prune(buff);

	if (IsMain(F->f)) {
		StringBuffer_addPrintf(buff, "-- params : %s\n", F->funcBlock->code);
		PrintAstSub(F->funcBlock, buff, 0);
	} else {
		StringBuffer_addPrintf(buff, "function(%s)\n", F->funcBlock->code);
		PrintAstSub(F->funcBlock, buff, indent+1);
		PrintIndent(buff, indent);
		StringBuffer_add(buff, "end\n");
	}

	return StringBuffer_getBuffer(F->decompiledCode);
}

/*
** -------------------------------------------------------------------------
*/

char* RegisterOrConstant(Function* F, int r) {
	if (IS_CONSTANT(r)) {
		return DecompileConstant(F->f, INDEXK(r));
	} else {
		return luadec_strdup(GetR(F, r));
	}
}

// isalpha in stdlib is undefined when ch>=256 , may throw a assertion error.
int luadec_isalpha(int ch) {
	return (ch>='A' && ch<='Z') || (ch>='a' && ch<='z');
}
int luadec_isdigit(int ch) {
	return (ch>='0' && ch<='9');
}
int luadec_isalnum(int ch) {
	return (ch>='0' && ch<='9') || (ch>='a' && ch<='z') || (ch>='A' && ch<='Z');
}

const int numofkeywords = 23;
const char* keywords[] = {
	"and", "break", "do", "else", "elseif",
	"end", "false", "for", "function", "if",
	"in", "local", "nil", "not", "or",
	"repeat", "return", "then", "true", "until",
	"while", "continue", "goto"
};

int isIdentifier(const char* src) {
	int dot = 0;
	if (luadec_isalpha(src[0]) || src[0] == '_') {
		int i;
		const char *at;
		int len = strlen(src);
		dot = 1;
		for (at = src + 1; at < src + len; at++) {
			if (!(luadec_isalnum(*at) || *at == '_')) {
				dot = 0;
				break;
			}
		}
		for (i = 0; i < numofkeywords; i++) {
			if (strcmp(keywords[i], src) == 0) {
				dot = 0;
				break;
			}
		}
	}
	return dot;
}

/*
** type: DOT, SELF, TABLE, SQUARE_BRACKET
** input and output
** rstr   "a"  " a"    "or"    a       a+2
** SELF   :a   ERROR   ERROR   ERROR   ERROR
** DOT    .a   [" a"]  ["or"]  [a]     [a+2]
** TABLE   a   [" a"]  ["or"]  [a]     [a+2]
** SB    ["a"] [" a"]  ["or"]  [a]     [a+2]
*/
IndexType MakeIndex(Function* F, StringBuffer* str, char* rstr, IndexType type) {
	int ret;
	int len = strlen(rstr);
	if (type==SQUARE_BRACKET) {
		StringBuffer_addPrintf(str, "[%s]", rstr);
		return SQUARE_BRACKET;
	}
	/*
	* see if index can be expressed without quotes
	*/
	if (rstr[0] == '\"' && rstr[len-1] == '\"') {
		rstr[len - 1] = '\0';
		if (isIdentifier((rstr + 1))) {
			switch (type) {
			case SELF:
				StringBuffer_addPrintf(str, ":%s", (rstr + 1));
				ret = SELF;
				break;
			case DOT:
				StringBuffer_addPrintf(str, ".%s", (rstr + 1));
				ret = DOT;
				break;
			case TABLE:
				StringBuffer_addPrintf(str, "%s", (rstr + 1));
				ret = TABLE;
				break;
			}
			rstr[len - 1] = '\"';
			return ret;
		}
		rstr[len - 1] = '\"';
	}

	if (type != SELF) {
		StringBuffer_addPrintf(str, "[%s]", rstr);
		return SQUARE_BRACKET;
	} else {
		char* errorbuff = (char*)calloc((len + 50), sizeof(char));
		StringBuffer_addPrintf(str, ":[%s]", rstr);
		sprintf(errorbuff, "[%s] should be a SELF Operator", rstr);
		SET_ERROR(F, errorbuff);
		free(errorbuff);
		return SQUARE_BRACKET;
	}
}

void ShowState(Function* F) {
	int i;
	ListItem* walk;
	fprintf(stddebug, "\n");
	fprintf(stddebug, "next bool: %d\n", F->bools.size);
	fprintf(stddebug, "locals(%d): ", F->freeLocal);
	for (i = 0; i < F->freeLocal; i++) {
		fprintf(stddebug, "%d{%s} ", i, REGISTER(i));
	}
	fprintf(stddebug, "\n");
	fprintf(stddebug, "vpend(%d): ", F->vpend.size);

	walk = F->vpend.head;
	i = 0;
	while (walk) {		
		int r = cast(VarListItem*, walk)->reg;
		char* src = cast(VarListItem*, walk)->src;
		char* dest = cast(VarListItem*, walk)->dest;
		if (r != -1 && !PENDING(r)) {
			sprintf(errortmp, "Confused about usage of register R%d for variables", r);
			SET_ERROR(F, errortmp);
			return;
		}
		fprintf(stddebug, "%d{%s=%s} ", r, dest, src);
		walk = walk->next;
	}
	fprintf(stddebug, "\n");
	fprintf(stddebug, "tpend(%d): ", SET_SIZE(F->tpend));
	walk = F->tpend->list.head;
	while (walk) {
		int r = cast(IntSetItem*, walk)->value;
		fprintf(stddebug, "%d{%s} ", r, REGISTER(r));
		if (!PENDING(r)) {
			sprintf(errortmp, "Confused about usage of register R%d for temporaries", r);
			SET_ERROR(F, errortmp);
			return;
		}
		walk = walk->next;
	}
	fprintf(stddebug, "\n");
}

#define TRY(x)  x; if (error) goto errorHandler

void DeclareLocal(Function* F, int ixx, const char* value) {
	if (!IS_VARIABLE(ixx)) {
		char x[10];
		StringBuffer* str = StringBuffer_new(NULL);

		sprintf(x,"l_%d_%d",functionnum, ixx);
		DeclareVariable(F, x, ixx);
		IS_VARIABLE(ixx) = 1;
		StringBuffer_printf(str,"local %s = %s",x,value);
		RawAddStatement(F, str);
		F->freeLocal++;
		StringBuffer_delete(str);
	}
}

void DeclarePendingLocals(Function* F) {
	StringBuffer* str = StringBuffer_new(NULL);
	if (SET_SIZE(F->tpend)>0) {
		if (guess_locals) {
			StringBuffer_set(str,"-- WARNING: pending registers.");
		} else {
			ListItem* walk = F->tpend->list.head;
			StringBuffer_set(str,"-- WARNING: pending registers. Declaring locals.");
			AddStatement(F,str);
			while (walk) {
				int reg = cast(IntSetItem*, walk)->value;
				char* s = luadec_strdup(REGISTER(reg));
				GetR(F, reg);
				DeclareLocal(F, reg, s);
				free(s);
				walk = walk->next;
			}
		}
	}
	StringBuffer_delete(str);
}

Proto* toproto(lua_State* L, int i);

int FunctionCheck(Proto* f, const char* funcnumstr, StringBuffer* str) {
	lua_State* newState;
	int check_result;
	char* decompiled = ProcessSubFunction(f, 1, luadec_strdup(funcnumstr));
	newState = lua_open();
	if (luaL_loadstring(newState, decompiled) != 0) {
		check_result = -1;
		StringBuffer_printf(str, "-- function check fail %s : cannot compile", funcnumstr);
	} else {
		StringBuffer* compare_result_str = StringBuffer_newBySize(127);
		Proto* newProto = toproto(newState, -1);;
		if (!IsMain(f)) {
			newProto = newProto->p[0];
		}
		check_result = CompareProto(f, newProto, compare_result_str);
		if (check_result == 0) {
			StringBuffer_printf(str, "-- function check pass %s", funcnumstr);
		} else {
			StringBuffer_printf(str, "-- function check fail %s : %s", funcnumstr, StringBuffer_getRef(compare_result_str));
		}
		StringBuffer_delete(compare_result_str);
	}

	lua_close(newState);
	free(decompiled);
	return check_result;
}

int CompareProto(const Proto* fleft, const Proto* fright, StringBuffer* str) {
	int sizesame, pc, minsizecode;
	int diff = 0;
	StringBuffer_set(str, "");
	if (fleft->numparams != fright->numparams) {
		diff++;
		StringBuffer_add(str, " different params size;");
	}
	if (NUPS(fleft) != NUPS(fright)) {
		diff++;
		StringBuffer_add(str, " different upvalues size;");
	}
	if (fleft->is_vararg != fright->is_vararg) {
		diff++;
		StringBuffer_add(str, " different is_vararg;");
	}
	if (fleft->sizecode != fright->sizecode) {
		diff++;
		StringBuffer_add(str, " different code size;");
	}
	sizesame = 0;
	minsizecode = MIN(fleft->sizecode, fright->sizecode);
	for (pc = 0; pc < minsizecode; pc++) {
		Instruction ileft = fleft->code[pc];
		Instruction iright = fright->code[pc];
		if (ileft == iright) {
			sizesame++;
		} else {
			OpCode opleft = GET_OPCODE(ileft);
			int aleft = GETARG_A(ileft);
			int bleft = GETARG_B(ileft);
			int cleft = GETARG_C(ileft);
			int bcleft = GETARG_Bx(ileft);
			int sbcleft = GETARG_sBx(ileft);
			OpCode opright = GET_OPCODE(iright);
			int aright = GETARG_A(iright);
			int bright = GETARG_B(iright);
			int cright = GETARG_C(iright);
			int bcright = GETARG_Bx(iright);
			int sbcright = GETARG_sBx(iright);

			if (opleft == opright) {
				if (opleft == OP_EQ && aleft == aright &&
					bleft == cright && cleft == bright) {
					sizesame++;
				}
			} else if ((opleft == OP_LT && opright == OP_LE) ||
				(opleft == OP_LE && opright == OP_LT)) {
				if (aleft == !aright &&	bleft == cright && cleft == bright) {
					sizesame++;
				}
			}
		}
	}
	if (sizesame != fleft->sizecode) {
		diff++;
		StringBuffer_addPrintf(str, " sizecode org: %d, decompiled: %d, same: %d;", fleft->sizecode, fright->sizecode, sizesame);
	}
	return diff;
}

char* PrintFunctionOnlyParamsAndUpvalues(const Proto* f, int indent, char* funcnumstr) {
	char* output = NULL;
	StringBuffer* code = StringBuffer_newBySize(512);

	StringBuffer_set(code, "function(");
	listParams(f, code);
	StringBuffer_add(code, ") ");

	if (NUPS(f) > 0) {
		StringBuffer_add(code, "local _upvalues_ = {");
		listUpvalues(f, code);
		StringBuffer_add(code, "};");
	}

	StringBuffer_add(code, " end");

	output = StringBuffer_getBuffer(code);
	StringBuffer_delete(code);

	return output;
}

void listParams(const Proto* f, StringBuffer* str) {
	if (f->numparams > 0) {
		int i = 0;
		StringBuffer_add(str, getLocalName(f, i));
		for (i = 1; i < f->numparams; i++) {
			StringBuffer_addPrintf(str, ", %s", getLocalName(f, i));
		}
		if (f->is_vararg) {
			StringBuffer_add(str, ", ...");
		}
	} else if (f->is_vararg) {
		StringBuffer_add(str, "...");
	}
}

void listUpvalues(const Proto* f, StringBuffer* str) {
	int i = 0;
	StringBuffer_add(str, getUpvalName(f, i));
	for (i = 1; i < NUPS(f); i++) {
		StringBuffer_addPrintf(str, ", %s", getUpvalName(f, i));
	}
}

int isTestOpCode(OpCode op) {
	return (op == OP_EQ || op == OP_LE || op == OP_LT || op == OP_TEST || op == OP_TESTSET);
}

AstStatement* LeaveBlock(Function* F, AstStatement* currStmt, StatementType type) {
	char msg[128];
	while (currStmt && currStmt->type != type) {
		sprintf(msg, "LeaveBlock: unexpected jumping out %s", stmttype[currStmt->type]);
		SET_ERROR(F, msg);
		if (currStmt->type == FUNC_ROOT || currStmt->type == FORLOOP_STMT || currStmt->type == TFORLOOP_STMT) {
			sprintf(msg, "LeaveBlock: cannot find end of %s , stop at %s", stmttype[type], stmttype[currStmt->type]);
			SET_ERROR(F, msg);
			return currStmt;
		}
		currStmt = currStmt->parent;
	}

	if (currStmt) {
		return currStmt->parent;
	} else {
		sprintf(msg, "LeaveBlock: cannot find end of %s ,fatal NULL returned", stmttype[type]);
		SET_ERROR(F, msg);
		return NULL;
	}
}

char* ProcessCode(Proto* f, int indent, int func_checking, char* funcnumstr) {
	int i = 0;

	int ignoreNext = 0;

	Function* F;
	StringBuffer* str = StringBuffer_new(NULL);

	const Instruction* code = f->code;
	int pc, n = f->sizecode;
	int baseIndent = indent;

	char* output;

	LoopItem* next_child;

	F = NewFunction(f);
	F->funcnumstr = funcnumstr;
	F->indent = indent;
	F->pc = 0;
	error = NULL;

	FixLocalNames(f, funcnumstr);

	/*
	* Function parameters are stored in registers from 0 on.
	*/
	for (i = 0; i < f->numparams; i++) {
		TRY(DeclareVariable(F, LOCAL(i), i));
		IS_VARIABLE(i) = 1;
	}
	F->freeLocal = f->numparams;

	StringBuffer_prune(str);
	listParams(f, str);
	F->funcBlock->code = StringBuffer_getBuffer(str);
	if (!IsMain(f)) {
		F->indent++;
	}

	// make function comment
	StringBuffer_printf(str, "-- function num : %s", funcnumstr);
	if (NUPS(f) > 0) {
		StringBuffer_add(str, " , upvalues : ");
		listUpvalues(f, str);
	}
	TRY(RawAddStatement(F, str));
	StringBuffer_prune(str);

	if (func_check == 1 && func_checking == 0) {
		int func_check_result = FunctionCheck(f, funcnumstr, str);
		TRY(RawAddStatement(F, str));
	}

	if (NEED_ARG(f)) {
		TRY(DeclareVariable(F, "arg", F->freeLocal));
		F->freeLocal++;
	}

	if (locals) {
		for (i=F->freeLocal; i<f->maxstacksize; i++) {
			DeclareLocal(F,i,"nil");
		}
	}

	for (pc = n - 1; pc >= 0; pc--) {
		Instruction i = code[pc];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		int sbc = GETARG_sBx(i);
		int dest = sbc + pc + 1;
		int real_end = GetJmpAddr(F,pc + 1);

		OpCode o_1 = OP_VARARG + 1;
		if (pc > 0) {
			o_1 = GET_OPCODE(code[pc-1]);
		}

		while (pc < F->loop_ptr->start) {
			F->loop_ptr = F->loop_ptr->parent;
		}

#if LUA_VERSION_NUM == 501
		if (o == OP_CLOSE) {
			int startreg = a;
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		if (o == OP_JMP && a > 0) {
			// instead OP_CLOSE in 5.2 : if (A) close all upvalues >= R(A-1)
			int startreg = a - 1;
#endif
			AddToSet(F->do_opens, f->locvars[startreg].startpc);
			AddToSet(F->do_closes, f->locvars[startreg].endpc);
			// continue; // comment out because of 5.2 OP_JMP
		}

#if LUA_VERSION_NUM == 501
		if (o == OP_JMP && pc > 0 && o_1 == OP_TFORLOOP) {
			// OP_TFORLOOP /* A C	R(A+3), ... ,R(A+2+C) := R(A)(R(A+1), R(A+2));if R(A+3) ~= nil then R(A+2)=R(A+3) else pc++	*/
			// OP_JMP /* sBx	pc += sBx */
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		if (o == OP_TFORLOOP) {
			// OP_TFORCALL /* A C	R(A+3), ... ,R(A+2+C) := R(A)(R(A+1), R(A+2)); */
			// OP_TFORLOOP /* A sBx	if R(A+1) ~= nil then { R(A)=R(A+1); pc += sBx } */
#endif
			LoopItem* item = NewLoopItem(TFORLOOP, dest-1, dest, dest, pc, real_end);
			AddToLoopTree(F, item);
			continue;
		}

		if (o == OP_FORLOOP) {
			LoopItem* item = NewLoopItem(FORLOOP, dest-1, dest, dest, pc, real_end);
			AddToLoopTree(F, item);
			continue;
		}

		if (o == OP_JMP && pc > 0) {
			AstStatement* jmp = NULL;
			AstStatement* jmpdest = cast(AstStatement*, F->jmpdests.tail);
			while (jmpdest && jmpdest->line > dest) {
				jmpdest = cast(AstStatement*, jmpdest->super.prev);
			}
			if (jmpdest == NULL || jmpdest->line < dest) {
				AstStatement* newjmpdest = MakeBlockStatement(JMP_DEST_STMT, NULL);
				newjmpdest->line = dest;
				AddAllAfterListItem(&(F->jmpdests), (ListItem*)jmpdest, (ListItem*)newjmpdest);
				jmpdest = newjmpdest;
			}
			jmp = MakeSimpleStatement(NULL);
			jmp->line = pc;
			jmp->parent = jmpdest;
			AddToListHead(jmpdest->sub, (ListItem*)jmp);

			if (dest == F->loop_ptr->out) {
				if (!isTestOpCode(o_1)) {
					//breaks
					IntListItem* intItem = NewIntListItem(pc);
					AddToList(&(F->breaks), cast(ListItem*, intItem));
				}
			} else if (F->loop_ptr->start <= dest && dest < pc) {
				if (isTestOpCode(o_1)) { //REPEAT jump back
					/* 
					** if the out loop(loop_ptr) is while and body=loop_ptr.start,
					** jump back may be 'until' or 'if', they are the same,
					** but 'if' is more clear, so we skip making a loop to choose 'if'.
					** see the lua code:
					** local a,b,c,f
					** 
					** while 1 do
					**	repeat
					**		f(b)
					**	until c
					**	f(a)
					** end
					** 
					** while 1 do
					**	f(b)
					** 	if c then
					** 		f(a)
					**	end
					** end
					*/
					if (!((F->loop_ptr->type == WHILE) && (dest == F->loop_ptr->start))) {
						LoopItem* item = NewLoopItem(REPEAT, dest, dest, dest, pc, real_end);
						AddToLoopTree(F, item);
					}
				} else {
					// WHILE jump back
					LoopItem* item = NewLoopItem(WHILE, dest, dest, -1, pc, real_end);
					AddToLoopTree(F, item);
				}
			}
		}
	}

	F->loop_ptr = F->loop_tree;
	next_child = F->loop_tree->child;

	for (pc = 0; pc < n; pc++) {
		Instruction i = code[pc];
		OpCode o = GET_OPCODE(i);
		int a = GETARG_A(i);
		int b = GETARG_B(i);
		int c = GETARG_C(i);
		int bc = GETARG_Bx(i);
		int sbc = GETARG_sBx(i);


		F->pc = pc;

		if (pc > F->loop_ptr->end) {
			next_child = F->loop_ptr->next;
			F->loop_ptr = F->loop_ptr->parent;
		}

		while (next_child && pc >= next_child->body) {
			F->loop_ptr = next_child;
			next_child = F->loop_ptr->child;
		}

		// nil optimization of Lua 5.1
		if (pc == 0) {
			int ixx, num_nil = -1;
			switch (o) {
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
				case OP_SETTABUP:
					if (!IS_CONSTANT(b)) {
						num_nil = b;
					}
				case OP_GETTABUP:
					if (!IS_CONSTANT(c)) {
						num_nil = MAX(num_nil,c);
					}
					break;
#endif
#if LUA_VERSION_NUM == 501
				case OP_SETGLOBAL:
#endif
				case OP_SETUPVAL:
					num_nil = a;
					break;
				case OP_JMP:
					break;
				default:
					num_nil = a-1;
					break;
			}
			for (ixx = F->freeLocal; ixx <= num_nil; ixx++) {
				TRY(AssignReg(F, ixx, "nil", 0, 1));
				PENDING(ixx)=1;
			}
		}
		if (ignoreNext) {
			ignoreNext--;
			continue;
		}

		/*
		* Disassembler info
		*/
		if (debug) {
			fprintf(stddebug, "----------------------------------------------\n");
			fprintf(stddebug, "\t%d\t", pc + 1);
			fprintf(stddebug, "%-9s\t", luaP_opnames[o]);
			switch (getOpMode(o)) {
			case iABC:
				fprintf(stddebug, "%d %d %d", a, b, c);
				break;
			case iABx:
				fprintf(stddebug, "%d %d", a, bc);
				break;
			case iAsBx:
				fprintf(stddebug, "%d %d", a, sbc);
				break;
			}
			fprintf(stddebug, "\n");
		}

		TRY(DeclareLocals(F));
		TRY(ReleaseLocals(F));

		while (RemoveFromSet(F->do_opens, pc)) {
			AstStatement* blockstmt = MakeBlockStatement(BLOCK_STMT, NULL);
			AddAstStatement(F, cast(AstStatement*, blockstmt));
			F->currStmt = blockstmt;
		}

		while (RemoveFromSet(F->do_closes, pc)) {
			AstStatement* block = F->currStmt;
			F->currStmt = LeaveBlock(F, block, BLOCK_STMT);
		}

		while ((F->currStmt->type == IF_THEN_STMT || F->currStmt->type == IF_ELSE_STMT)
			&& ElseStart(F->currStmt->parent) == GetJmpAddr(F, pc)) {
			AstStatement* ifstmt = F->currStmt->parent;
			F->currStmt = ifstmt->parent;
		}

		if (F->jmpdests.head && cast(AstStatement*, F->jmpdests.head)->line == pc) {
			AstStatement* jmpdest = cast(AstStatement*, RemoveFromList(&(F->jmpdests), F->jmpdests.head));
			AddToStatement(F->currStmt, jmpdest);
		}

		if ((F->loop_ptr->start == pc) && (F->loop_ptr->type == REPEAT || F->loop_ptr->type == WHILE)) {
			LoopItem* walk = F->loop_ptr;

			while (walk->parent && (walk->parent->start == pc) &&(walk->parent->type == REPEAT || walk->parent->type == WHILE)) {
				walk = walk->parent;
			}

			while (!(walk == F->loop_ptr)) {
				AstStatement* loopstmt = NULL;
				if (walk->type == WHILE) {
					walk->body = walk->start;
					loopstmt = MakeBlockStatement(WHILE_STMT, strdup("1"));
				} else if (walk->type == REPEAT) {
					loopstmt = MakeBlockStatement(REPEAT_STMT, NULL);
				}
				RawAddAstStatement(F, cast(AstStatement*, loopstmt));
				F->currStmt = loopstmt;
				walk = walk->child;
			}

			if (walk->type == REPEAT) {
				AstStatement* loopstmt = MakeBlockStatement(REPEAT_STMT, NULL);
				RawAddAstStatement(F, cast(AstStatement*, loopstmt));
				F->currStmt = loopstmt;
			} else if (walk->type == WHILE) { 
				/*
				** try to process all while as " while 1 do if "
				** see the lua code:
				** local f, a, b, c
				** 
				** while test do
				** 	whilebody
				** end
				** 
				** while 1 do
				** 	if test then
				** 		whilebody
				** 	else
				** 		break
				** 	end
				** end
				*/
				AstStatement* loopstmt = MakeBlockStatement(WHILE_STMT, strdup("1"));
				RawAddAstStatement(F, cast(AstStatement*, loopstmt));
				F->currStmt = loopstmt;
				walk->body = walk->start;
			}
		}

		StringBuffer_prune(str);

		switch (o) {
		case OP_MOVE:
		/* Upvalue handling added to OP_CLOSURE */
		{
			const char* bstr = NULL;
			if (a == b)
				break;
			if (CALL(b) < 2)
				bstr = GetR(F, b);
			else
				UnsetPending(F, b);
			if (error)
				goto errorHandler;
			/*
			* Copy from one register to another
			*/
			TRY(AssignReg(F, a, bstr, PRIORITY(b), 1));
			break;
		}
		case OP_LOADK:
		{
			/*
			* Constant. Store it in register.
			*/
			char *ctt = DecompileConstant(f, bc);
			TRY(AssignReg(F, a, ctt, 0, 1));
			free(ctt);
			break;
		}
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_LOADKX:
		{
			int ax = GETARG_Ax(code[pc+1]);
			char *ctt = DecompileConstant(f, ax);
			TRY(AssignReg(F, a, ctt, 0, 1));
			free(ctt);
			pc++;
			break;
		}
		case OP_EXTRAARG:
			break;
#endif
		case OP_LOADBOOL:
		{
			if ((F->bools.size == 0) || (c==0)) {
				/*
				* assign boolean constant
				*/
				if (PENDING(a)) {
					// some boolean constructs overwrite pending regs :(
					TRY(UnsetPending(F, a));
				}
				TRY(AssignReg(F, a, b ? "true" : "false", 0, 1));
			} else {
				/*
				* assign boolean value
				*/
				int thenaddr = 0, endif = 0;
				char *test = NULL;
				TRY(test = OutputBoolean(F, &thenaddr, NULL, 1));
				TRY(AssignReg(F, a, test, 0, 0));
				if (test) free(test);
			}
			if (c)
				ignoreNext = 1;
			break;
		}
		case OP_LOADNIL:
		{
			int ra, rb;
			ra = a;
#if LUA_VERSION_NUM == 501
			// 5.1	A B	R(A) to R(B) := nil
			rb = b;
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
			// 5.2	A B	R(A) to R(A+B) := nil
			rb = a + b;
#endif
			do {
				TRY(AssignReg(F, rb--, "nil", 0, 1));
			} while (rb >= ra);
			break;
		}
		case OP_VARARG: // Lua5.1 specific.
		{
			int i;
			/*
			* Read ... into register.
			*/
			if (b==0) {
				IS_VARIABLE(a) = 0; PENDING(a) = 0;
				TRY(AssignReg(F, a, "...", 0, 1));
				CALL(a) = 1;
				IS_VARIABLE(a+1) = 0; PENDING(a+1) = 0;
				TRY(AssignReg(F, a+1, ".end", 0, 1));
				CALL(a+1) = 2;
			} else {
				for (i = 0; i < b-1; i++) {
					PENDING(a+i) = 0;
					TRY(AssignReg(F, a+i, "...", 0, 1));
					CALL(a+i) = i+1;
				}
			}
			break;
		}
		case OP_GETUPVAL:
		{
			/*	A B	R(A) := UpValue[B]				*/
			TRY(AssignReg(F, a, UPVALUE(b), 0, 1));
			break;
		}
#if LUA_VERSION_NUM == 501
		case OP_GETGLOBAL:
		{
			/*	A Bx	R(A) := Gbl[Kst(Bx)]				*/
			TRY(AssignReg(F, a, GLOBAL(bc), 0, 1));
			break;
		}
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_GETTABUP:
		{
			/*	A B C	R(A) := UpValue[B][RK(C)]			*/
			const char *upvstr = UPVALUE(b);
			char *keystr = RegisterOrConstant(F, c);
			StringBuffer_set(str, "");
			if (strcmp(upvstr, "_ENV")==0 && IS_CONSTANT(c)) {
				if (MakeIndex(F, str, keystr, TABLE)!=TABLE) {
					StringBuffer_prepend(str, upvstr);
				}
			} else {
				StringBuffer_set(str, upvstr);
				MakeIndex(F, str, keystr, DOT);
			}
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 1));
			free(keystr);
			break;
		}
#endif
		case OP_GETTABLE:
		{
			/*	A B C	R(A) := R(B)[RK(C)]				*/
			const char *bstr;
			char* cstr;
			TRY(cstr = RegisterOrConstant(F, c));
			TRY(bstr = GetR(F, b));
			if (isIdentifier(bstr)) {
				StringBuffer_set(str, bstr);
			} else {
				StringBuffer_printf(str, "(%s)", bstr);
			}
			MakeIndex(F, str, cstr, DOT);
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			free(cstr);
			break;
		}
#if LUA_VERSION_NUM == 501
		case OP_SETGLOBAL:
		{
			/*	A Bx	Gbl[Kst(Bx)] := R(A)				*/
			const char *var = GLOBAL(bc);
			const char *astr;
			TRY(astr = GetR(F, a));
			TRY(AssignGlobalOrUpvalue(F, var, astr));
			break;
		}
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_SETTABUP:
		{
			/*	A B C	UpValue[A][RK(B)] := RK(C)			*/
			const char *upvstr = UPVALUE(a);
			char *keystr = RegisterOrConstant(F, b);
			char *cstr = RegisterOrConstant(F, c);
			StringBuffer_set(str, "");
			if (strcmp(upvstr, "_ENV")==0 && IS_CONSTANT(b)) {
				if (MakeIndex(F, str, keystr, TABLE)!=TABLE) {
					StringBuffer_prepend(str, upvstr);
				}
			} else {
				StringBuffer_set(str, upvstr);
				MakeIndex(F, str, keystr, DOT);
			}
			TRY(AssignGlobalOrUpvalue(F, StringBuffer_getRef(str), cstr));
			free(keystr);
			free(cstr);
			break;
		}
#endif
		case OP_SETUPVAL:
		{
			/*	A B	UpValue[B] := R(A)				*/
			const char *var = UPVALUE(b);
			const char *astr;
			TRY(astr = GetR(F, a));
			TRY(AssignGlobalOrUpvalue(F, var, astr));
			break;
		}
		case OP_SETTABLE:
		{
			/*	A B C	R(A)[RK(B)] := RK(C)				*/
			const char *astr;
			char *bstr, *cstr;
			int settable;
			TRY(bstr = RegisterOrConstant(F, b));
			TRY(cstr = RegisterOrConstant(F, c));
			/*
			* first try to add into a table
			*/
			TRY(settable = SetTable(F, a, bstr, cstr));
			if (!settable) {
				/*
				* if failed, just output an assignment
				*/
				TRY(astr = GetR(F, a));
				if (isIdentifier(astr)) {
					StringBuffer_set(str, astr);
				} else {
					StringBuffer_printf(str, "(%s)", astr);
				}
				MakeIndex(F, str, bstr, DOT);
				TRY(AssignGlobalOrUpvalue(F, StringBuffer_getRef(str), cstr));
			}
			free(bstr);
			free(cstr);
			break;
		}
		case OP_NEWTABLE:
		{
			TRY(StartTable(F, a, b, c, pc));
			break;
		}
		case OP_SELF:
		{
			/*
			* Read table entry into register.
			*/
			const char *bstr;
			char *cstr;
			TRY(cstr = RegisterOrConstant(F, c));
			TRY(bstr = GetR(F, b));

			TRY(AssignReg(F, a+1, bstr, PRIORITY(b), 0));
			if (isIdentifier(bstr)) {
				StringBuffer_set(str, bstr);
			} else {
				StringBuffer_addPrintf(str, "(%s)", bstr);
			}
			MakeIndex(F, str, cstr, SELF);
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			free(cstr);
			break;
		}
		case OP_ADD:
		case OP_SUB:
		case OP_MUL:
		case OP_DIV:
		case OP_POW:
		case OP_MOD:
#if LUA_VERSION_NUM == 503
		case OP_IDIV:
		case OP_BAND:
		case OP_BOR:
		case OP_BXOR:
		case OP_SHL:
		case OP_SHR:
#endif
		{
			char *bstr, *cstr;
			const char *oper = operators[o];
			int prio = priorities[o];
			int bprio = PRIORITY(b);
			int cprio = PRIORITY(c);
			TRY(bstr = RegisterOrConstant(F, b));
			TRY(cstr = RegisterOrConstant(F, c));
			// FIXME: might need to change from <= to < here
			if ((prio != 1 && bprio <= prio) || (prio == 1 && bstr[0] != '-')) {
				StringBuffer_add(str, bstr);
			} else {
				StringBuffer_addPrintf(str, "(%s)", bstr);
			}
			StringBuffer_addPrintf(str, " %s ", oper);
			// FIXME: being conservative in the use of parentheses
			if (cprio < prio) {
				StringBuffer_add(str, cstr);
			} else {
				StringBuffer_addPrintf(str, "(%s)", cstr);
			}
			TRY(AssignReg(F, a, StringBuffer_getRef(str), prio, 0));
			free(bstr);
			free(cstr);
			break;
		}
		case OP_UNM:
		case OP_NOT:
		case OP_LEN:
#if LUA_VERSION_NUM == 503
		case OP_BNOT:
#endif
		{
			const char *bstr;
			int prio = priorities[o];
			int bprio = PRIORITY(b);
			TRY(bstr = GetR(F, b));
			StringBuffer_add(str, operators[o]);
			if (bprio <= prio) {
				StringBuffer_add(str, bstr);
			} else {
				StringBuffer_addPrintf(str, "(%s)", bstr);
			}
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			break;
		}
		case OP_CONCAT:
		{
			int i;
			for (i = b; i <= c; i++) {
				const char *istr;
				TRY(istr = GetR(F, i));
				if (PRIORITY(i) > priorities[o]) {
					StringBuffer_addPrintf(str, "(%s)", istr);
				} else {
					StringBuffer_add(str, istr);
				}
				if (i < c)
					StringBuffer_add(str, " .. ");
			}
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			break;
		}
		case OP_JMP:
		{
			// instead OP_CLOSE in 5.2 : if (A) close all upvalues >= R(A-1)
			int dest = sbc + pc + 2;
			Instruction idest = code[dest - 1];
			IntListItem* foundInt = (IntListItem*)RemoveFromList(&(F->breaks), FindFromListTail(&(F->breaks), (ListItemCmpFn)MatchIntListItem, &pc));
			if (foundInt != NULL) { // break
				free(foundInt);
				StringBuffer_printf(str, "do break end");
				TRY(AddStatement(F, str));
			} else if (F->loop_ptr->end == pc) { // until jmp has been processed, tforloop has ignored the jmp, forloop does not have a jmp
				if (F->currStmt->type == IF_THEN_STMT && ElseStart(F->currStmt->parent) == GetJmpAddr(F, pc + 1)) {
					// Change 'while 1 do if' to 'while'
					AstStatement* currStmt = F->currStmt;
					AstStatement* ifStmt = currStmt->parent;
					AstStatement* parentStmt = ifStmt->parent;
					if (parentStmt->type == WHILE_STMT && parentStmt->sub->size == 1) {
						// if is the first statment of while body
						AstStatement* whileStmt = parentStmt;
						char* whileTest = whileStmt->code;
						if (strcmp(whileTest, "1") == 0) {
							// ifthen to while
							RemoveFromList(ifStmt->sub, (ListItem*)currStmt);
							currStmt->type = WHILE_STMT;
							currStmt->code = ifStmt->code;
							currStmt->line = ifStmt->line;
							currStmt->parent = whileStmt->parent;
							RemoveFromList(whileStmt->parent->sub, (ListItem*)whileStmt);
							AddToStatement(currStmt->parent, currStmt);
							ifStmt->code = NULL;
							DeleteAstStatement(whileStmt);
						}
					}
				}
				F->currStmt = LeaveBlock(F, F->currStmt, WHILE_STMT);
			} else if (F->currStmt->type == IF_THEN_STMT && ElseStart(F->currStmt->parent) == GetJmpAddr(F, pc + 1)) { // jmp before 'else'
				AstStatement* ifstmt = F->currStmt->parent;
				F->currStmt = ElseStmt(ifstmt);
				ElseStart(ifstmt) = GetJmpAddr(F, dest);
			} else if (GET_OPCODE(idest) == LUADEC_TFORLOOP) { // jmp of generic for
				// TODO 5.2 OP_TFORCALL
				/*
				* generic 'for'
				*/
				int i;
				//int step;
				const char *generator, *control, *state;
				//char *variables[20];
				const char* vname[40];
				AstStatement* forstmt = NULL;
				//int stepLen;

				a = GETARG_A(idest);
				c = GETARG_C(idest);

				F->intspos++;
				generator = GetR(F, a);
				control = GetR(F, a + 2);
				state = GetR(F, a + 1);
				for (i=1; i<=c; i++) {
					if (!IS_VARIABLE(a+2+i)) {
						int i2;
						int loopvars = 0;
						vname[i-1] = NULL;
						for (i2 = 0; i2 < f->sizelocvars; i2++) {
							if (f->locvars[i2].startpc == pc + 1) {
								loopvars++;
								//search for the loop variable. Set it's endpc one step further so it will be the same for all loop variables
								if (GET_OPCODE(F->f->code[f->locvars[i2].endpc-2]) == LUADEC_TFORLOOP) {
									f->locvars[i2].endpc -= 2;
								}
								if (GET_OPCODE(F->f->code[f->locvars[i2].endpc-1]) == LUADEC_TFORLOOP) {
									f->locvars[i2].endpc -= 1;
								}
								if (loopvars==3+i) {
									vname[i-1] = LOCAL(i2);
									break;
								}
							}
						}
						if (vname[i-1] == NULL) {
							char tmp[5];
							sprintf(tmp,"i_%d",i);
							TRY(DeclareVariable(F, tmp, a+2+i));
							vname[i-1] = F->R[a+2+i];
						}
					} else {
						vname[i-1] = F->R[a+2+i];
					}
					F->Rinternal[a+2+i] = 1;
				}

				DeclarePendingLocals(F);

				StringBuffer_printf(str,"%s",vname[0]);
				for (i=2; i<=c; i++) {
					StringBuffer_addPrintf(str, ",%s",vname[i-1]);
				}
				StringBuffer_addPrintf(str," in ");
				StringBuffer_addPrintf(str,"%s",generator);

				F->Rinternal[a] = 1;
				F->Rinternal[a + 1] = 1;
				F->Rinternal[a + 2] = 1;

				F->intbegin[F->intspos] = a;
				F->intend[F->intspos] = a+2+c;
				forstmt = MakeBlockStatement(TFORLOOP_STMT, StringBuffer_getBuffer(str));
				AddAstStatement(F, forstmt);
				F->currStmt = forstmt;
				break;
			} else if (sbc == 2 && GET_OPCODE(code[pc+2]) == OP_LOADBOOL) {
				/*
				* JMP 2
				* LOADBOOL Ra 0 1 must mark one as useful
				* LOADBOOL Ra 1 0
				* ::jmp_target
				*/
				fprintf(stderr, "processing OP_JMP to } else if (sbc == 2 && GET_OPCODE(code[pc+2]) == OP_LOADBOOL) { \n");
				fprintf(stderr, " at line %d in file %s\n", __LINE__, __FILE__);
				fprintf(stderr, " for lua files: ");
				printFileNames(stderr);
				fprintf(stderr, "\n");
				fprintf(stderr, " at lua function %s pc=%d\n\n", funcnumstr, pc);
				fflush(stderr);
				{
				int boola = GETARG_A(code[pc+1]);
				int thenaddr = 0, endif = 0;
				char* test = NULL;
				/* skip */
				const char* ra = REGISTER(boola);
				AddToList(&(F->bools), (ListItem*)MakeBoolOp(luadec_strdup(ra), luadec_strdup(ra), OP_TESTSET, c, pc+3, dest));
				F->testpending = a+1;
				F->testjump = dest;
				TRY(test = OutputBoolean(F, &thenaddr, NULL, 1));
				TRY(UnsetPending(F, boola));
				TRY(AssignReg(F, boola, test, 0, 0));
				if (test) free(test);
				ignoreNext = 2;
				}
			} else if (GET_OPCODE(idest) == OP_LOADBOOL) { // WHY
				/*
				* constant boolean value
				* JMP 
				* ....skipped , not decompiled
				* ::jmp_target
				* LOADBOOL
				*/
				fprintf(stderr, "processing OP_JMP to } else if (GET_OPCODE(idest) == OP_LOADBOOL) { \n");
				fprintf(stderr, " at line %d in file %s\n", __LINE__, __FILE__);
				fprintf(stderr, " for lua files: ");
				printFileNames(stderr);
				fprintf(stderr, "\n");
				fprintf(stderr, " at lua function %s pc=%d\n\n", funcnumstr, pc);
				fflush(stderr);
				pc = dest - 2;
			} else if (sbc == 0) {
				/* dummy jump -- ignore it */
				break;
			} else { // WHY
				fprintf(stderr, "processing OP_JMP to } else { \n");
				fprintf(stderr, " at line %d in file %s\n", __LINE__, __FILE__);
				fprintf(stderr, " for lua files: ");
				printFileNames(stderr);
				fprintf(stderr, "\n");
				fprintf(stderr, " at lua function %s pc=%d\n\n", funcnumstr, pc);
				fflush(stderr);
				{
				int nextpc = pc+1;
				int nextsbc = sbc-1;
				for (;;) {
					Instruction nextins = code[nextpc];
					if (GET_OPCODE(nextins) == OP_JMP && GETARG_sBx(nextins) == nextsbc) {
						nextpc++;
						nextsbc--;
					} else
						break;
					if (nextsbc == -1) {
						break;
					}
				}
				if (nextsbc == -1) {
					pc = nextpc-1;
					break;
				}
				if (F->indent > baseIndent) {
					StringBuffer_printf(str, "do return end");
				} else {
					pc = dest-2;
				}
				TRY(AddStatement(F, str));
				}
			}
			break;
		}
		case OP_EQ:
		case OP_LT:
		case OP_LE:
		{
			// WHY can't we remove it
			if (IS_CONSTANT(b)) {
				int swap = b;
				b = c;
				c = swap;
				if (o != OP_EQ) a = !a;
				if (o == OP_LT) o = OP_LE;
				else if (o == OP_LE) o = OP_LT;
			}
			AddToList(&(F->bools), (ListItem*)MakeBoolOp(RegisterOrConstant(F, b), RegisterOrConstant(F, c), o, a, pc+1, -1));
			goto LOGIC_NEXT_JMP;
			break;
		}
		case OP_TESTSET: // Lua5.1 specific TODO: correct it
		{
			const char *ra, *rb;

			if (!IS_VARIABLE(a)) {
				ra = REGISTER(a);
				PENDING(a) = 0;
			} else {
				TRY(ra = GetR(F, a));
			}
			TRY(rb = GetR(F, b));
			AddToList(&(F->bools), (ListItem*)MakeBoolOp(luadec_strdup(ra), luadec_strdup(rb), o, c, pc + 1, -1));
			F->testpending = a + 1;
			goto LOGIC_NEXT_JMP;
			break;
		}
		case OP_TEST:
		{
			const char *ra;

			TRY(ra = GetR(F, a));
			if (!IS_VARIABLE(a)) {
				PENDING(a) = 0;
				F->testpending = a + 1;
			}
			AddToList(&(F->bools), (ListItem*)MakeBoolOp(luadec_strdup(ra), luadec_strdup(ra), o, c, pc + 1, -1));
			goto LOGIC_NEXT_JMP;
			break;
		}
LOGIC_NEXT_JMP:
		{
			int dest;
			BoolOp* lastBool;
			pc++;
			F->pc = pc;
			i = code[pc];
			o = GET_OPCODE(i);
			if (o != OP_JMP) {
				assert(0);
			}
			sbc = GETARG_sBx(i);
			dest = sbc + pc + 2;
			lastBool = cast(BoolOp*, LastItem(&(F->bools)));
			lastBool->dest = dest;
			if (F->testpending) {
				F->testjump = dest;
			}
			if ((F->loop_ptr->type == REPEAT) && (F->loop_ptr->end == F->pc)) {
				int endif, thenaddr;
				char* test = NULL;
				LogicExp* exp = NULL;
				AstStatement* currStmt = F->currStmt;
				AstStatement* parentStmt = NULL;
				TRY(exp = MakeBoolean(F, &thenaddr, &endif));
				TRY(test = WriteBoolean(exp, &thenaddr, &endif, 0));

				while (currStmt && currStmt->type != REPEAT_STMT) {
					currStmt = currStmt->parent;
				}
				if (currStmt) {
					currStmt->code = test;
					test = NULL;
					F->currStmt = currStmt->parent;
				} else {
					SET_ERROR(F, "LeaveBlock: cannot find 'until' of 'repeat'");
				}
				if (test) free(test);
				if (exp) DeleteLogicExpTree(exp);
			}
			break;
		}
		case OP_CALL:
		case OP_TAILCALL:
		{
			/*
			* Function call. The CALL opcode works like this:
			* R(A),...,R(A+F-2) := R(A)(R(A+1),...,R(A+B-1))
			*/
			int i, limit, self;
			const char* astr;
			self = 0;

			if (b == 0) {
				limit = a + 1;
				while (PENDING(limit) || IS_VARIABLE(limit)) limit++;
			} else {
				limit = a + b;
			}
			StringBuffer_prune(str);
			if (o == OP_TAILCALL) {
				StringBuffer_set(str, "return ");
				ignoreNext = 1;
			}
			TRY(astr = GetR(F, a));
			if (isIdentifier(astr)) {
				StringBuffer_addPrintf(str, "%s(", astr);
			} else {
				const char* at = astr + strlen(astr) - 1;
				while (at > astr && (luadec_isalnum(*at) || *at == '_')) {
					at--;
				}
				if (*at == ':') {
					self = 1;
					StringBuffer_addPrintf(str, "%s(", astr);
				} else {
					StringBuffer_addPrintf(str, "(%s)(", astr);
				}
			}

			for (i = a + 1; i < limit; i++) {
				const char *ireg = NULL;
				TRY(ireg = GetR(F, i));
				if (strcmp(ireg,".end") == 0)
					break;
				if (self && i == a+1)
					continue;
				if (i > a + 1 + self)
					StringBuffer_add(str, ", ");
				if (ireg)
					StringBuffer_add(str, ireg);
			}
			StringBuffer_addChar(str, ')');

			if (c == 0) {
				F->lastCall = a;
			}
			if (GET_OPCODE(code[pc+1]) == OP_LOADNIL && GETARG_A(code[pc+1]) == a+1) {
				StringBuffer_prepend(str, "(");
				StringBuffer_add(str, ")");
				c += GETARG_B(code[pc+1]) - GETARG_A(code[pc+1]) + 1;
				// ignoreNext = 1;
			}
			if (o == OP_TAILCALL || c == 1) {
				TRY(AddStatement(F, str));
			} else if (c == 0) {
				IS_VARIABLE(a) = 0; PENDING(a) = 0;
				TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
				CALL(a) = 1;
				IS_VARIABLE(a+1) = 0; PENDING(a+1) = 0;
				TRY(AssignReg(F, a+1, ".end", 0, 1));
				CALL(a+1) = 2;
			} else {
				PENDING(a) = 0;
				TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
				for (i = 0; i < c-1; i++) {
					CALL(a+i) = i+1;
				}
			}
			break;
		}
		case OP_RETURN:
		{
			/*
			* Return call. The RETURN opcode works like this: return
			* R(A),...,R(A+B-2)
			*/
			int i, limit;

			/* skip the last RETURN */
			if (pc == n - 1)
				break;
			if (b == 0) {
				limit = a;
				while (PENDING(limit) || IS_VARIABLE(limit)) limit++;
			}
			else
				limit = a + b - 1;
			StringBuffer_set(str, "return ");
			for (i = a; i < limit; i++) {
				const char* istr = GetR(F, i);
				if (strcmp(istr,".end") == 0)
					break;
				if (i > a)
					StringBuffer_add(str, ", ");
				TRY(StringBuffer_add(str, istr));
			}
			TRY(AddStatement(F, str));
			break;
		}
		case OP_FORLOOP: //Lua5.1 specific. TODO: CHECK
		{
			int i;
			AstStatement* currStmt = F->currStmt;

			for (i=F->intbegin[F->intspos]; i<=F->intend[F->intspos]; i++)
			{
				//fprintf(stderr,"X %d\n",i);
				IS_VARIABLE(i)=0;
				F->Rinternal[i] = 0;
			}
			F->intspos--;
			F->ignore_for_variables = 0;

			F->currStmt = LeaveBlock(F, currStmt, FORLOOP_STMT);
			break;
		}
		case LUADEC_TFORLOOP: // TODO: CHECK
		{
			// 5.1 OP_TFORLOOP	A C		R(A+3), ... ,R(A+2+C) := R(A)(R(A+1), R(A+2));
			//	if R(A+3) ~= nil then R(A+2)=R(A+3) else pc++
			// 5.1 OP_JMP sBx	pc += sBx

			// 5.2 OP_TFORCALL	A C		R(A+3), ... ,R(A+2+C) := R(A)(R(A+1), R(A+2));
			// 5.2 OP_TFORLOOP	A sBx	if R(A+1) ~= nil then { R(A)=R(A+1); pc += sBx }

			int i;
			AstStatement* currStmt = F->currStmt;
			for (i=F->intbegin[F->intspos]; i<=F->intend[F->intspos]; i++)
			{
				IS_VARIABLE(i)=0;
				F->Rinternal[i] = 0;
			}
			F->intspos--;

			F->ignore_for_variables = 0;

			F->currStmt = LeaveBlock(F, currStmt, TFORLOOP_STMT);

			ignoreNext = 1;
			break;
		}
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
		case OP_TFORLOOP:
			break;
#endif
		case OP_FORPREP: //Lua5.1 specific. TODO: CHECK
			{
				/*
				* numeric 'for'
				*/
				int i;
				int step;
				const char *idxname = NULL;
				const char *initial, *a1str, *endstr;
				int stepLen;
				AstStatement* forstmt = NULL;
				F->intspos++;
				TRY(initial = GetR(F, a));
				TRY(endstr = GetR(F, a+2));
				TRY(a1str = GetR(F, a+1));

				if (!IS_VARIABLE(a+3)) {
					int loopvars = 0;
					for (i = 0; i < f->sizelocvars; i++) {
						if (f->locvars[i].startpc == pc + 1) {
							loopvars++;
							//search for the loop variable. Set it's endpc one step further so it will be the same for all loop variables
							if (GET_OPCODE(F->f->code[f->locvars[i].endpc-1]) == OP_FORLOOP) {
								f->locvars[i].endpc -=1;
							}
							if (loopvars==4) {
								idxname = LOCAL(i);
								break;
							}
						}
					}
					if (idxname == NULL) {
						idxname = "i";
						TRY(DeclareVariable(F, idxname, a + 3));
					}
				} else {
					idxname = F->R[a+3];
				}
				DeclarePendingLocals(F);
				/*
				* if A argument for FORLOOP is not a known variable,
				* it was declared in the 'for' statement. Look for
				* its name in the locals table.
				*/



				//initial = luadec_strdup(initial);
				step = atoi(REGISTER(a + 2));
				stepLen = strlen(REGISTER(a + 2));
				// findSign = strrchr(initial, '-');

				// if (findSign) {
				//    initial[strlen(initial) - stepLen - 3] = '\0';
				// }

				if (step == 1) {
					StringBuffer_printf(str, "%s = %s, %s",
						idxname, initial, a1str);
				} else {
					StringBuffer_printf(str, "%s = %s, %s, %s",
						idxname, initial, a1str, REGISTER(a + 2));
				}

				/*
				* Every numeric 'for' declares 4 variables.
				*/
				F->Rinternal[a] = 1;
				F->Rinternal[a + 1] = 1;
				F->Rinternal[a + 2] = 1;
				F->Rinternal[a + 3] = 1;
				F->intbegin[F->intspos] = a;
				F->intend[F->intspos] = a+3;
				forstmt = MakeBlockStatement(FORLOOP_STMT, StringBuffer_getBuffer(str));
				AddAstStatement(F, forstmt);
				F->currStmt = forstmt;
				break;
			}
		case OP_SETLIST:
		{
			TRY(SetList(F, a, b, c));
			break;
		}
#if LUA_VERSION_NUM == 501
		case OP_CLOSE:
		{
			// close all upvalues >= R(A)
			/*
			* Handled in do_opens/do_closes variables.
			*/
			break;
		}
#endif
		case OP_CLOSURE:
		{
			/*
			* Function.
			*/
			int i;
			int uvn;
			int cfnum = functionnum;
			Proto* cf = f->p[c];
			char* tmpname = (char*)calloc(strlen(funcnumstr) + 12, sizeof(char));

			uvn = NUPS(cf);

			/* determining upvalues */
#if LUA_VERSION_NUM == 501
			if (!cf->upvalues) {
				cf->sizeupvalues = uvn;
				cf->upvalues = luaM_newvector(glstate, uvn, UPVAL_TYPE);
				for (i = 0; i < uvn; i++) {
					UPVAL_NAME(cf, i) = NULL;
				}
			}
#endif

			// always FixUpvalNames
			// lua 5.1 : upvalue names = next n opcodes after CLOSURE
			// lua 5.2 : upvalue names determined by cf->upvalues->instack and cf->upvalues->idx
			for (i = 0; i < uvn; i++) {
				TString* upvalname = UPVAL_NAME(cf, i);
				if (upvalname == NULL || LUA_STRLEN(upvalname) == 0 ||
					strlen(getstr(upvalname)) == 0 || !isIdentifier(getstr(upvalname))) {
#if LUA_VERSION_NUM == 501
					Instruction ins = code[pc+i+1];
					OpCode op = GET_OPCODE(ins);
					int b = GETARG_B(ins);
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
					Upvaldesc upval = cf->upvalues[i];
					int b = upval.idx;
#endif
#if LUA_VERSION_NUM == 501
					if (op == OP_MOVE) {
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
					if (upval.instack == 1) {
#endif
						// TODO completely wrong, f->locvars[b] is not R[b]
						// Get name from local name
						if (f->locvars && b < f->sizelocvars) {
							// no need to test after FixLocalNames
							upvalname = f->locvars[b].varname;
						} else {
							sprintf(tmpname, "l_%d_%d", funcnumstr, b);
							upvalname = luaS_new(glstate, tmpname);
						}
#if LUA_VERSION_NUM == 501
					} else if (op == OP_GETUPVAL) {
#endif
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
					} else if (upval.instack == 0) {
#endif
						// Get name from upvalue name
						if (f->upvalues && b < f->sizeupvalues) {
							// no need to check after FixUpvalNames
							upvalname = UPVAL_NAME(f, b);
						} else {
							sprintf(tmpname, "u_%s_%d", funcnumstr, b);
							upvalname = luaS_new(glstate, tmpname);
						}
					} else {
						sprintf(tmpname, "up_%s_%d", funcnumstr, i);
						upvalname = luaS_new(glstate, tmpname);
					}
					UPVAL_NAME(cf, i) = upvalname;
				}
			}
			/* upvalue determinition end */
			free(tmpname);

			if (func_checking == 1) {
				char* code = NULL;
				char* newfuncnumstr = (char*)calloc(strlen(funcnumstr) + 12, sizeof(char));
				functionnum = c;
				sprintf(newfuncnumstr, "%s_%d", funcnumstr, c);
				code = PrintFunctionOnlyParamsAndUpvalues(cf, F->indent, newfuncnumstr);
				StringBuffer_setBuffer(str, code);
			} else if (!process_sub) {
				StringBuffer_printf(str, "DecompiledFunction_%s_%d", funcnumstr, c);
			} else {
				char* code = NULL;
				char* newfuncnumstr = (char*)calloc(strlen(funcnumstr) + 12, sizeof(char));
				functionnum = c;
				sprintf(newfuncnumstr, "%s_%d", funcnumstr, c);
				code = ProcessCode(cf, F->indent, 0, newfuncnumstr);
				StringBuffer_setBuffer(str, code);
			}
			TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));

#if LUA_VERSION_NUM == 501
			ignoreNext = cf->sizeupvalues;
#endif
			break;
		}
		default:
			StringBuffer_printf(str, "-- unhandled opcode? : 0x%02X", o);
			TRY(AddStatement(F, str));
			break;
		}

		if (debug) {
			TRY(ShowState(F));
		}

		// TODO Check, should not do this
		if ((F->currStmt->type == IF_THEN_STMT || F->currStmt->type == IF_THEN_STMT)
			&& ElseStart(F->currStmt->parent) == GetJmpAddr(F, pc - 1)) {
			AstStatement* ifstmt = F->currStmt->parent;
			F->currStmt = ifstmt->parent;
		}

		TRY(OutputAssignments(F));
	}

	// TODO Check, should not do this
	if ((F->currStmt->type == IF_THEN_STMT || F->currStmt->type == IF_THEN_STMT)
		&& ElseStart(F->currStmt->parent) == GetJmpAddr(F, pc)) {
		AstStatement* ifstmt = F->currStmt->parent;
		F->currStmt = ifstmt->parent;
	}

	TRY(FlushBoolean(F));

	if (SET_SIZE(F->tpend)>0) {
		StringBuffer_set(str, "-- WARNING: undefined locals caused missing assignments!");
		TRY(AddStatement(F, str));
	}

	if (F->jmpdests.size > 0) {
		StringBuffer_printf(str, "-- DECOMPILER ERROR: %d unprocessed JMP targets", F->jmpdests.size);
		TRY(AddStatement(F, str));
		while (F->jmpdests.head) {
			AstStatement* jmpdest = cast(AstStatement*, RemoveFromList(&(F->jmpdests), F->jmpdests.head));
			AddToStatement(F->currStmt, jmpdest);
		}
	}

	if (!IsMain(f)) {
		F->indent--;
	}

	output = PrintFunction(F);
	DeleteFunction(F);
	StringBuffer_delete(str);
	return output;

errorHandler:
	printf("ERRORHANDLER\n");
	{
		AstStatement* stmt;
		StringBuffer_printf(str, "--[[ DECOMPILER ERROR %d: %s ]]", errorCode, error);
		stmt = MakeSimpleStatement(StringBuffer_getBuffer(str));
		stmt->line = F->pc;
		AddToStatement(F->currStmt, stmt);
		F->lastLine = F->pc;
	}
	output = PrintFunction(F);
	DeleteFunction(F);
	error = NULL;
	StringBuffer_delete(str);
	return output;
}

void luaU_decompile(Proto* f, int dflag) {
	char* code;
	debug = dflag;
	functionnum = 0;
	errorStr = StringBuffer_new(NULL);
	code = ProcessCode(f, 0, 0, luadec_strdup("0"));
	StringBuffer_delete(errorStr);
	printf("%s\n", code);
	free(code);
	fflush(stdout);
	fflush(stderr);
}

Proto* findSubFunction(Proto* f, const char* funcnumstr, char* realfuncnumstr) {
	Proto* cf = f;
	const char* startstr = funcnumstr;
	const char* endstr;

	int c = atoi(startstr);
	if (c != 0) {
		return NULL;
	}
	endstr = strchr(startstr, '_');
	startstr = endstr + 1;
	sprintf(realfuncnumstr, "0");
	functionnum = 0;

	while (!(endstr == NULL)) {
		c = atoi(startstr);
		if (c < 0 || c >= cf->sizep) {
			return NULL;
		}
		cf = cf->p[c];
		endstr = strchr(startstr, '_');
		startstr = endstr + 1;
		sprintf(realfuncnumstr + strlen(realfuncnumstr), "_%d", c);
		functionnum = c + 1;
	}
	return cf;
}

char* ProcessSubFunction(Proto* cf, int func_checking, char* funcnumstr) {
	int i;
	int uvn = NUPS(cf);
	char* code;
	StringBuffer* buff = StringBuffer_newBySize(128);
	char* tmpname = (char*)calloc(strlen(funcnumstr) + 12, sizeof(char));

	/* determining upvalues */
	if (!cf->upvalues) {
		// Lua 5.1 only
		cf->sizeupvalues = uvn;
		cf->upvalues = luaM_newvector(glstate, uvn, UPVAL_TYPE);
		for (i = 0; i < uvn; i++) {
			sprintf(tmpname, "upval_%s_%d", funcnumstr, i);
			UPVAL_NAME(cf, i) = luaS_new(glstate, tmpname);
		}
	} else {
		// FixUpvalNames
		for (i = 0; i < uvn; i++) {
			TString* name = UPVAL_NAME(cf, i);
			if (name == NULL || LUA_STRLEN(name) == 0 ||
				strlen(getstr(name)) == 0 || !isIdentifier(getstr(name))) {
				// TODO 5.2 Maybe we should trace up to get _ENV ?
				// Also wen can get the location where upval defined
				sprintf(tmpname, "upval_%s_%d", funcnumstr, i);
				UPVAL_NAME(cf, i) = luaS_new(glstate, tmpname);
			}
		}
	}
	free(tmpname);

	StringBuffer_prune(buff);
	if (!IsMain(cf)) {
		if (NUPS(cf) > 0) {
			StringBuffer_add(buff, "local ");
			listUpvalues(cf, buff);
			StringBuffer_add(buff, "\n");
		}
		StringBuffer_addPrintf(buff, "DecompiledFunction_%s = ", funcnumstr);
	}
	code = ProcessCode(cf, 0, func_checking, funcnumstr);
	StringBuffer_addPrintf(buff, "%s\n", code);
	free(code);
	code = StringBuffer_getBuffer(buff);
	StringBuffer_delete(buff);
	return code;
}

void luaU_decompileSubFunction(Proto* f, int dflag, const char* funcnumstr) {
	char* code;
	char* realfuncnumstr = (char*)calloc(strlen(funcnumstr) + 10, sizeof(char));

	Proto* cf = findSubFunction(f, funcnumstr, realfuncnumstr);
	if (cf == NULL) {
		fprintf(stderr, "No such sub function num : %s , use -pn option to get available num.\n", funcnumstr);
		free(realfuncnumstr);
		return;
	}

	errorStr = StringBuffer_new(NULL);
	code = ProcessSubFunction(cf, 0, realfuncnumstr);
	StringBuffer_delete(errorStr);
	printf("%s\n", code);
	free(code);
	fflush(stdout);
	fflush(stderr);
}
