/* luadec, based on luac */
#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#define DEBUG_PRINT

#include "lua.h"
#include "lauxlib.h"
#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"
#include "lstring.h"

#include "StringBuffer.h"
#include "structs.h"
#include "proto.h"
#include "decompile.h"

#define stddebug stdout

extern int locals;
extern int localdeclare[255][255];
extern int functionnum;
extern int disnested;			/* don't decompile nested functions? */
extern int func_check;           /* compile decompiled function and compare */
extern int guess_locals;
extern lua_State* glstate;

char* error_nil = "ERROR_nil";
char* nilstr = "nil";
char* upvalue = "upvalue_inexistent_Rxxxx";
StringBuffer *errorStr;

/*
* -------------------------------------------------------------------------
*/

const char* getupval(Function * F, int r) {
	if (F->f->upvalues && r < F->f->sizeupvalues) {
		return (char*)getstr(F->f->upvalues[r]);
	} else {
		sprintf(upvalue,"upvalue_inexistent_R%d",r);
		return upvalue;
	}
}

char* luadec_strdup(const char * src){
	return src?strdup(src):NULL;
}

#define UPVALUE(r) ( getupval(F,r) )
#define REGISTER(r) F->R[r]
#define PRIORITY(r) (r>=MAXSTACK ? 0 : F->Rprio[r])
#define LOCAL(r) (F->f->locvars ? ((char*)getstr(F->f->locvars[r].varname)) : error_nil)
#define LOCAL_STARTPC(r) F->f->locvars[r].startpc
#define PENDING(r) F->Rpend[r]
#define CALL(r) F->Rcall[r]
#define IS_TABLE(r) F->Rtabl[r]
#define IS_VARIABLE(r) F->Rvar[r]

#define SET_CTR(s) s->ctr
#define SET(s,y) s->values[y]
#define SET_IS_EMPTY(s) (s->ctr == 0)

#define fb2int(x)	(luaO_fb2int(x))
#define int2fb(x)	(luaO_int2fb(x))
#define MAX(a,b) (((a)>(b))?(a):(b))

#define SET_ERROR(F,e) { StringBuffer_printf(errorStr," -- DECOMPILER ERROR: %s\n", (e)); RawAddStatement((F),errorStr); }
/*  error = e; errorCode = __LINE__; */ /*if (debug) { printf("DECOMPILER ERROR: %s\n", e);  }*/

static int debug;

static char* error;
static int errorCode;

int GetJmpAddr(Function* F, int addr){
	int real_end = addr;
	if(real_end >= F->f->sizecode){
		real_end = F->f->sizecode ;
		return real_end;
	}
	if(real_end < 0){
		real_end = -1;
		return real_end;
	}
	while(GET_OPCODE(F->f->code[real_end]) == OP_JMP){
		real_end = GETARG_sBx(F->f->code[real_end]) + real_end + 1;
	}
	return real_end;
}

void RawAddStatement(Function * F, StringBuffer * str);
void DeclareLocal(Function * F, int ixx, const char* value);

Statement *NewStatement(char *code, int line, int indent) {
	Statement *self;
	self = (Statement*)calloc(1, sizeof(Statement));
	cast(ListItem*, self)->next = NULL;
	self->code = code;
	self->line = line;
	self->indent = indent;
	return self;
}

void DeleteStatement(Statement * self, void* dummy) {
	free(self->code);
	free(self);
}

void PrintStatement(Statement * self, void* F_) {
	int i;
	Function* F = cast(Function*, F_);

	for (i = 0; i < self->indent; i++) {
		StringBuffer_add(F->decompiledCode, "  ");
	}
	StringBuffer_addPrintf(F->decompiledCode, "%s\n", self->code);
}

LoopItem *NewLoopItem(LoopType type, int prep, int start, int body, int end, int next_code){
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
	self->next_code = next_code;

	return self;
}

int MatchLoopItem(LoopItem* item, LoopItem* match){
	return ((item->type == match->type)||(match->type == INT_MIN))
		&& ((item->prep == match->prep)||(match->prep == INT_MIN))
		&& ((item->start == match->start)||(match->start == INT_MIN))
		&& ((item->body == match->body)||(match->body == INT_MIN))
		&& ((item->end == match->end)||(match->end == INT_MIN))
		&& ((item->next_code == match->next_code)||(match->next_code == INT_MIN));
}

int AddToLoopTree(Function* F, LoopItem* item){
	while (F->loop_ptr){
		if ( item->body >= F->loop_ptr->body && item->end < F->loop_ptr->end){
			//find parent , then insert as the first child
			item->parent = F->loop_ptr;
			item->next = F->loop_ptr->child;
			item->prev = NULL;
			item->child = NULL;

			if ( F->loop_ptr->child){
				F->loop_ptr->child->prev = item;
			}
			F->loop_ptr->child = item;
			F->loop_ptr = item;
			return 1;
		}else{
			F->loop_ptr = F->loop_ptr->parent;
		}
	}
	return 0;
}

void DeleteLoopTree(LoopItem* item){
	LoopItem* next = item;
	while (item){
		if (item->child){
			next = item->child;
			item->child = NULL;
		}else{
			if (item->next){
				next = item->next;
				item->next = NULL;
			}else{
				next = item->parent;
			}
			free(item);
		}
		item = next;
	}
}

void DeleteLoopTree2(LoopItem* item){
	if (item == NULL) return;
	DeleteLoopTree2(item->child);
	DeleteLoopTree2(item->next);
	free(item);
}

IntListItem *NewIntListItem(int v){
	IntListItem* self = (IntListItem*)calloc(1, sizeof(IntListItem));
	((ListItem *) self)->next = NULL;
	self->value = v;
	return self;
}

int MatchIntListItem(IntListItem* item, int* match_value){
	return (item->value == *match_value);
}

void DeleteIntListItem(IntListItem* item, void * dummy){
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

LogicExp* FindLogicExpTreeRoot(LogicExp* exp){
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
		if(exp->op1)
			free(exp->op1);
		if(exp->op2)
			free(exp->op2);
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
		char *op;
		int cond = exp->neg;
		if (inv) cond = !cond;
		if (rev) cond = !cond;
		if (cond) {
			op = invopstr(exp->op);
		}else{
			op = opstr(exp->op);
		}
		if ((exp->op != OP_TEST) && (exp->op != OP_TESTSET)) {
			StringBuffer_addPrintf(str, "%s %s %s", exp->op1, op, exp->op2);
		} else if (op) {
			StringBuffer_addPrintf(str, "%s %s", op, exp->op2);
		}else {
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
	if (previous)
		previous->next = NULL;
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

LogicExp* MakeBoolean(Function * F, int* endif, int* thenaddr)
{
	int i;
	int firstaddr, elseaddr, last, realLast;
	LogicExp *curr=NULL, *first=NULL;
	int dest;

	if (endif)
		*endif = 0;

	if (F->nextBool == 0) {
		SET_ERROR(F,"Attempted to build a boolean expression without a pending context");
		return NULL;
	}

	realLast = F->nextBool - 1;
	last = realLast;
	firstaddr = F->bools[0]->pc + 2;
	*thenaddr = F->bools[last]->pc + 2;
	elseaddr = F->bools[last]->dest;

	for (i = realLast; i >= 0; i--) {
		int dest = F->bools[i]->dest;
		if ((elseaddr > *thenaddr) &&
			( ((F->bools[i]->op == OP_TEST) || (F->bools[i]->op == OP_TESTSET)) ? (dest > elseaddr+1) :
			(dest > elseaddr))) {
				last = i;
				*thenaddr = F->bools[i]->pc + 2;
				elseaddr = dest;
		}
	}

	{
		int tmpLast = last;
		for (i = 0; i < tmpLast; i++) {
			int dest = F->bools[i]->dest;
			if (elseaddr > firstaddr) {
				if (dest < firstaddr) {
					last = i;
					*thenaddr = F->bools[i]->pc + 2;
					elseaddr = dest;
				}
			} else {
				if (dest == firstaddr) {
					last = i;
					*thenaddr = F->bools[i]->pc + 2;
					elseaddr = dest;
				} else {
					break;
				}
			}
		}
	}

	dest = F->bools[0]->dest;
	curr = MakeExpNode(F->bools[0]);

	if (dest > firstaddr && dest <= *thenaddr) {
		first = MakeExpChain(dest);
		TieAsSubExp(first, curr);
	} else {
		first = curr;
		if (endif)
			*endif = dest;
	}

	if (debug) {
		printf("\n");
		for (i = 0; i <= last; i++) {
			BoolOp* op = F->bools[i];
			if (debug) {
				printf("Exps(%d): at %d\tdest %d\tneg %d\t(%s %s %s) cpd %d \n", i,
					op->pc, op->dest, op->neg, op->op1, opstr(op->op), op->op2, curr->parent ? curr->parent->dest : -1);
			}
		}
		printf("\n");
	}

	for (i = 1; i <= last; i++) {
		BoolOp* op = F->bools[i];
		int at = op->pc;
		int dest = op->dest;

		LogicExp* exp = MakeExpNode(op);
		if (dest < firstaddr) {
			/* jump to loop in a while */
			TieAsNext(curr, exp);
			curr = exp;
			if (endif)
				*endif = dest;
		} else if (dest > *thenaddr) {
			/* jump to "else" */
			TieAsNext(curr, exp);
			curr = exp;
			if (endif) {
				if ((op->op != OP_TEST) && (op->op != OP_TESTSET)) {
					if (*endif != 0 && *endif != dest) {
						SET_ERROR(F,"unhandled construct in 'if'");
						//return NULL;
					}
				}
				*endif = dest;
			}
		} else if (dest == curr->dest) {
			/* within current chain */
			TieAsNext(curr, exp);
			curr = exp;
		} else if (dest > curr->dest) {
			if (curr->parent == NULL || dest < curr->parent->dest) {
				/* creating a new level */
				LogicExp* subexp = MakeExpChain(dest);
				LogicExp* savecurr;
				TieAsNext(curr, exp);
				curr = exp;
				savecurr = curr;
				if (curr->parent == NULL) {
					TieAsSubExp(subexp, first);
					first = subexp;
				}
			} else if (dest > curr->parent->dest) {
				/* start a new chain */
				LogicExp* prevParent;
				LogicExp* chain;
				TieAsNext(curr, exp);
				curr = curr->parent;
				if (!curr->is_chain) {
					SET_ERROR(F,"unhandled construct in 'if'");
					return NULL;
				};
				prevParent = curr->parent;
				chain = MakeExpChain(dest);
				Untie(curr, thenaddr);
				if (prevParent)
					if (prevParent->is_chain)
						prevParent = prevParent->subexp;
				TieAsSubExp(chain, curr);

				//curr->parent = prevParent;
				if (prevParent == NULL) {
					first = chain;
				} else {
					// todo
					TieAsNext(prevParent, chain);
				}
			}
		} else if (dest > firstaddr && dest < curr->dest) {
			/* start a new chain */
			LogicExp* subexp = MakeExpChain(dest);
			TieAsSubExp(subexp, exp);
			TieAsNext(curr, subexp);
			curr = exp;
		} else {
			SET_ERROR(F,"unhandled construct in 'if'");
			return NULL;
		}

		if (curr->parent && at+3 > curr->parent->dest) {
			curr->parent->dest = curr->dest;
			if (i < last) {
				LogicExp* chain = MakeExpChain(curr->dest);
				TieAsSubExp(chain, first);
				first = chain;
			}
			curr = curr->parent;
		}
	}
	if (first->is_chain){
		first = first->subexp;
	}
	for (i = last+1; i < F->nextBool; i++){
		if( i-last-1 != i){
			DeleteBoolOp(F->bools[i-last-1]);
			F->bools[i-last-1] = F->bools[i];
			F->bools[i] = NewBoolOp();
		}
	}
	if (F->bools[0] == NULL){
		F->bools[0] = NewBoolOp();
	}
	F->nextBool -= last + 1;
	if (endif && *endif == 0) {
		*endif = *thenaddr;
	}
	return first;
}

char* WriteBoolean(LogicExp* exp, int* thenaddr, int* endif, int test) {
	char* result = NULL;
	StringBuffer* str = StringBuffer_new(NULL);

	if (exp) {
		PrintLogicExp(str, *thenaddr, exp, 0, test);
		if (test && endif && *endif == 0) {
			//SET_ERROR(F,"Unhandled construct in boolean test");
			result = (char*)calloc(30, sizeof(char));
			sprintf(result," --UNHANDLEDCONTRUCT-- ");
			goto WriteBoolean_CLEAR_HANDLER1;
		}
	} else {
		result = (char*)calloc(30, sizeof(char));
		sprintf(result,"error_maybe_false");
		goto WriteBoolean_CLEAR_HANDLER1;
	}
	result = StringBuffer_getBuffer(str);

WriteBoolean_CLEAR_HANDLER1:
	StringBuffer_delete(str);

	return result;
}

void FlushElse(Function* F);

char* OutputBoolean(Function* F, int* endif, int test) {
	int thenaddr;
	char* result = NULL;
	LogicExp* exp = NULL;

	FlushElse(F);
	if (error) goto OutputBoolean_CLEAR_HANDLER1;
	exp = MakeBoolean(F, endif, &thenaddr);
	if (error) goto OutputBoolean_CLEAR_HANDLER1;
	result = WriteBoolean(exp, &thenaddr, endif, test);	
	if (error) goto OutputBoolean_CLEAR_HANDLER1;

OutputBoolean_CLEAR_HANDLER1:
	if (exp) DeleteLogicExpTree(exp);
	//if (error) { free(result); return NULL; }

	return result;
}

void StoreEndifAddr(Function * F, int addr) {
	Endif* at = F->nextEndif;
	Endif* prev = NULL;
	Endif* newEndif = (Endif*)calloc(1, sizeof(Endif));
	newEndif->addr = addr;
	while (at && at->addr < addr) {
		prev = at;
		at = at->next;
	}
	if (!prev) {
		newEndif->next = F->nextEndif;
		F->nextEndif = newEndif;
	} else {
		newEndif->next = at;
		prev->next = newEndif;
	}
	if (debug) {
		printf("Stored at endif list: ");
		for (at = F->nextEndif; at != NULL; at = at->next) {
			if (at == newEndif)
				printf("<%d> ", at->addr);
			else
				printf("%d ", at->addr);
		}
		printf("\n");
	}
}

int PeekEndifAddr(Function* F, int addr) {
	Endif* at = F->nextEndif;
	while (at) {
		if (at->addr == addr)
			return 1;
		else if (at->addr > addr)
			break;
		at = at->next;
	}
	return 0;
}


int GetEndifAddr(Function* F, int addr) {
	Endif* at = F->nextEndif;
	Endif* prev = NULL;

	addr = GetJmpAddr(F,addr - 1) + 1;
	while (at) {
		if (at->addr == addr) {
			if (prev)
				prev->next = at->next;
			else
				F->nextEndif = at->next;
			free(at);
			return 1;
		} else if (at->addr > addr)
			break;
		prev = at;
		at = at->next;
	}
	return 0;
}

void RawAddStatement(Function * F, StringBuffer * str)
{
	char *copy;
	Statement* stmt;
	copy = StringBuffer_getCopy(str);
	if (F->released_local) {
		int i = 0;
		int lpc = F->released_local;
		char* scopeclose[] = {
			"end", "else", "elseif", "while", "until", NULL
		};
		F->released_local = 0;
		for (i = 0; scopeclose[i]; i++)
			if (strstr(copy, scopeclose[i]) == copy)
				break;
		if (!scopeclose[i]) {
			int added = 0;
			Statement* stmt = cast(Statement*, F->statements.head);
			Statement* prev = NULL;
			Statement* newst;
			while (stmt) {
				if (!added) {
					if (stmt->line >= lpc) {
						Statement *newst = NewStatement(strdup("do"), lpc, stmt->indent);
						if (prev) {
							prev->super.next = cast(ListItem*, newst);
							newst->super.next = cast(ListItem*, stmt);
						} else {
							F->statements.head = cast(ListItem*, newst);
							newst->super.next = cast(ListItem*, stmt);
						}
						added = 1;
						stmt->indent++;
					}
				} else {
					stmt->indent++;
				}
				prev = stmt;
				stmt = cast(Statement*, stmt->super.next);
			}
			newst = NewStatement(strdup("end"), F->pc, F->indent);
			AddToList(&(F->statements), cast(ListItem*, newst));
		}
	}
	stmt = NewStatement(copy, F->pc, F->indent);
	AddToList(&(F->statements), cast(ListItem*, stmt));
	F->lastLine = F->pc;
}

void FlushBoolean(Function * F) {
	FlushElse(F);
	while (F->nextBool > 0) {
		int endif, thenaddr;
		char* test = NULL;
		StringBuffer* str = StringBuffer_new(NULL);
		LogicExp* exp = MakeBoolean(F, &endif, &thenaddr);
		LoopItem* walk = F->loop_ptr;
		if (error) goto FlushBoolean_CLEAR_HANDLER1;
		//TODO find another method to determine while loop body to output while do
		//search parent
		while (walk){
			if(walk->type == WHILE && walk->body == thenaddr -1 && walk->next_code == endif -1 ){
				break;
			}
			walk = walk->parent;
		}
		test = WriteBoolean(exp, &thenaddr, &endif, 0);
		if (error) goto FlushBoolean_CLEAR_HANDLER1;
		if (walk){
			StringBuffer_addPrintf(str, "while %s do", test);
			RawAddStatement(F, str);
			F->indent++;
		} else {
			StoreEndifAddr(F, endif);
			StringBuffer_addPrintf(str, "if %s then", test);
			F->elseWritten = 0;
			RawAddStatement(F, str);
			F->indent++;
		}

FlushBoolean_CLEAR_HANDLER1:
		if (exp) DeleteLogicExpTree(exp);
		if (test) free(test);
		StringBuffer_delete(str);
		if (error) return;
	}
	F->testpending = 0;
}

void AddStatement(Function * F, StringBuffer * str)
{
	FlushBoolean(F);
	if (error) return;
	RawAddStatement(F, str);
}

void MarkBackpatch(Function* F) {
	Statement* stmt = (Statement*) LastItem(&(F->statements));
	stmt->backpatch = 1;
}

void FlushElse(Function* F) {
	if (F->elsePending > 0) {
		int fpc = F->bools[0]->pc;
		/* Should elseStart be a stack? */
		if (F->nextBool > 0 && (fpc == F->elseStart || fpc-1 == F->elseStart)) {
			int endif, thenaddr;
			char* test = NULL;
			StringBuffer* str = StringBuffer_new(NULL);
			LogicExp* exp = NULL;
			exp = MakeBoolean(F, &endif, &thenaddr);
			if (error) goto FlushElse_CLEAR_HANDLER1;
			test = WriteBoolean(exp, &thenaddr, &endif, 0);
			if (error) goto FlushElse_CLEAR_HANDLER1;
			StoreEndifAddr(F, endif);
			StringBuffer_addPrintf(str, "elseif %s then", test);
			F->elseWritten = 0;
			RawAddStatement(F, str);
			F->indent++;

FlushElse_CLEAR_HANDLER1:
			if (exp) DeleteLogicExpTree(exp);
			if (test) free(test);
			StringBuffer_delete(str);
			if (error) return;
		} else {
			StringBuffer* str = StringBuffer_new(NULL);
			StringBuffer_printf(str, "else");
			RawAddStatement(F, str);
			/* this test circumvents jump-to-jump optimization at
			the end of if blocks */
			if (!PeekEndifAddr(F, F->pc + 3))
				StoreEndifAddr(F, F->elsePending);
			F->indent++;
			F->elseWritten = 1;
			StringBuffer_delete(str);
		}
		F->elsePending = 0;
		F->elseStart = 0;
	}
}

/*
* -------------------------------------------------------------------------
*/

void DeclarePendingLocals(Function * F);

void AssignGlobalOrUpvalue(Function * F, const char* dest, const char* src)
{
	F->testjump = 0;
	AddToVarStack(F->vpend, luadec_strdup(dest), luadec_strdup(src), -1);
}

void AssignReg(Function * F, int reg, const char* src, int prio, int mayTest)
{
	char* dest = REGISTER(reg);
	char* nsrc = NULL;

	if (PENDING(reg)) {
		if (guess_locals) {
			SET_ERROR(F,"Overwrote pending register.");
		} else {
			SET_ERROR(F,"Overwrote pending register. Missing locals? Creating them");
			DeclareLocal(F,reg,dest);
		}
		return;
	}

	PENDING(reg) = 1;
	CALL(reg) = 0;
	F->Rprio[reg] = prio;

	if (debug) { printf("SET_CTR(Tpend) = %d \n", SET_CTR(F->tpend)); }

	nsrc = luadec_strdup(src);
	if (F->testpending == reg+1 && mayTest && F->testjump == F->pc+2) {
		int endif;
		char* test = OutputBoolean(F, &endif, 1);
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
		AddToVarStack(F->vpend, luadec_strdup(dest), nsrc, reg);
	}
}

/*
* Table Functions
*/

DecTableItem *NewTableItem(const char *value, int num, const char *key) {
	DecTableItem *self = (DecTableItem*)calloc(1, sizeof(DecTableItem));
	((ListItem *) self)->next = NULL;
	self->key = luadec_strdup(key);
	self->value = luadec_strdup(value);
	self->numeric = num;
	return self;
}

void DeleteTableItem(DecTableItem* item,void* dummy) {
	if (item) {
		if (item->key) {
			free(item->key);
		}
		if (item->value) {
			free(item->value);
		}
		free(item);
	}
}

int MatchTable(DecTable * tbl, int *name)
{
	return tbl->reg == *name;
}

void DeleteTable(DecTable * tbl)
{
	LoopList(&(tbl->keyed),(ListItemFn)DeleteTableItem,NULL);
	LoopList(&(tbl->numeric),(ListItemFn)DeleteTableItem,NULL);
	free(tbl);
}

void CloseTable(Function * F, int r)
{
	DecTable *tbl = (DecTable *) RemoveFindInList(&(F->tables), (ListItemCmpFn) MatchTable,&r);
	if (tbl->reg != r) {
		SET_ERROR(F,"Unhandled construct in table");
		return;
	}
	DeleteTable(tbl);
	F->Rtabl[r] = 0;
}

char *PrintTable(Function * F, int r, int returnCopy)
{
	char *result = NULL;
	int numerics = 0;
	DecTableItem *item;
	StringBuffer *str = StringBuffer_new("{");
	DecTable *tbl = (DecTable *) FindInList(&(F->tables), (ListItemCmpFn) MatchTable,&r);
	if (tbl == NULL) {
		F->Rtabl[r] = 0;
		return F->R[r];
	}
	item = (DecTableItem *) tbl->numeric.head;
	if (item) {
		if (item->value[strlen(item->value)-1] == '}')
			StringBuffer_add(str, "\n");
		StringBuffer_add(str, item->value);
		item = (DecTableItem *) item->super.next;
		numerics = 1;
		while (item) {
			StringBuffer_add(str, ", ");
			if (item->value[strlen(item->value)-1] == '}')
				StringBuffer_add(str, "\n");
			StringBuffer_add(str, item->value);
			item = (DecTableItem *) item->super.next;
		}
	}
	item = (DecTableItem *) tbl->keyed.head;
	if (item) {
		int first;
		if (numerics)
			StringBuffer_add(str, "; ");
		first = 1;
		while (item) {
			if (first)
				first = 0;
			else
				StringBuffer_add(str, ", ");
			if (item->value[strlen(item->value)-1] == '}')
				StringBuffer_add(str, "\n");
			MakeIndex(F,str,item->key,TABLE);
			StringBuffer_addPrintf(str, " = %s", item->value);
			item = (DecTableItem *) item->super.next;
		}
	}
	StringBuffer_addChar(str, '}');
	PENDING(r) = 0;
	AssignReg(F, r, StringBuffer_getRef(str), 0, 0);
	if (error) {
		result = NULL;
	}else if (returnCopy){
		result = StringBuffer_getCopy(str);
	}
	StringBuffer_delete(str);
	CloseTable(F, r);
	return result;
}

DecTable *NewTable(int r, Function * F, int b, int c, int pc) // Lua5.1 specific
{
	DecTable *self = (DecTable*)calloc(1, sizeof(DecTable));
	((ListItem *) self)->next = NULL;
	InitList(&(self->numeric));
	InitList(&(self->keyed));
	self->reg = r;
	self->topNumeric = 0;
	self->F = F;
	self->arraySize = fb2int(b);
	self->keyedSize = fb2int(c); //1<<c;
	self->pc = pc;
	PENDING(r) = 1;
	return self;
}

void AddToTable(Function* F, DecTable * tbl, const char *value, const char *key)
{
	DecTableItem *item;
	List *type;
	int index;
	if (key == NULL) {
		type = &(tbl->numeric);
		index = tbl->topNumeric;
		tbl->topNumeric++;
	} else {
		type = &(tbl->keyed);
		tbl->used++;
		index = 0;
	}
	item = NewTableItem(value, index, key);
	AddToList(type, (ListItem *) item);
}

void StartTable(Function * F, int r, int b, int c, int pc)
{
	DecTable *tbl = NewTable(r, F, b, c, pc);
	AddToListHead(&(F->tables), (ListItem *) tbl);
	F->Rtabl[r] = 1;
}

void SetList(Function * F, int a, int b, int c)
{
	int i;
	DecTable *tbl = (DecTable *) FindInList(&(F->tables), (ListItemCmpFn) MatchTable,&a);
	if (tbl == NULL) {
		SET_ERROR(F,"Unhandled construct in list (SETLIST)");
		return;
	}
	if (b == 0) {
		const char *rstr;
		i = 1;
		do{
			rstr = GetR(F, a + i);
			if (error)
				return;
			if (strcmp(rstr,".end") == 0)
				break;
			AddToTable(F, tbl, rstr, NULL); // Lua5.1 specific TODO: it's not really this :(
			i++;
		} while (1);
	} //should be {...} or func(func()) ,when b == 0, that will use all avaliable reg from R(a)

	for (i = 1; i <= b; i++) {
		const char* rstr = GetR(F, a + i);
		if (error)
			return;
		AddToTable(F, tbl, rstr, NULL); // Lua5.1 specific TODO: it's not really this :(
	}
}

void UnsetPending(Function * F, int r)
{
	if (!IS_VARIABLE(r)) {
		if (!PENDING(r) && !CALL(r)) {
			if (guess_locals) {
				SET_ERROR(F,"Confused about usage of registers!");
			} else {
				char *s;
				SET_ERROR(F,"Confused about usage of registers, missing locals? Creating them");
				s = luadec_strdup(REGISTER(r));
				DeclareLocal(F,r,s);
			}
			return;
		}
		PENDING(r) = 0;
		RemoveFromSet(F->tpend, r);
	}
}

int SetTable(Function * F, int a, char *bstr, char *cstr)
{
	DecTable *tbl = (DecTable *) FindInList(&(F->tables), (ListItemCmpFn) MatchTable,&a);
	if (tbl==NULL) {
		UnsetPending(F, a);
		return 0;
	}
	AddToTable(F, tbl, cstr, bstr);
	return 1;
}

/*
*	Boolop Functions
*/

BoolOp* NewBoolOp(){
	BoolOp* value = (BoolOp*)calloc(1, sizeof(BoolOp));
	value->op1 = NULL;
	value->op2 = NULL;
	((ListItem*)value)->next = NULL;
	return value;
}

void DeleteBoolOp(BoolOp* ptr){
	if(ptr){
		if(ptr->op1){
			free(ptr->op1);
		}
		if(ptr->op2){
			free(ptr->op2);
		}
		free(ptr);
	}
}

void ClearBoolOp(BoolOp* ptr) {
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

/*
* -------------------------------------------------------------------------
*/

Function *NewFunction(const Proto * f)
{
	int i;
	Function *self;

	/*
	* calloc, to ensure all parameters are 0/NULL
	*/
	self = (Function*)calloc(1, sizeof(Function));
	InitList(&(self->statements));
	self->f = f;
	self->vpend = (VarStack*)calloc(1, sizeof(VarStack));
	self->vpend->ctr = 0;
	self->tpend = (IntSet*)calloc(1, sizeof(IntSet));
	self->tpend->ctr = 0;

	self->loop_tree = NewLoopItem(FUNC_ROOT,-1,-1,0,f->sizecode-1,f->sizecode);
	self->loop_ptr = self->loop_tree;

	//self->repeats = calloc(1, sizeof(IntSet));
	//self->repeats->mayRepeat = 1;
	//self->untils = calloc(1, sizeof(IntSet));
	InitList(&(self->breaks));
	InitList(&(self->continues));
	self->do_opens = (IntSet*)calloc(1, sizeof(IntSet));
	self->do_closes = (IntSet*)calloc(1, sizeof(IntSet));
	self->decompiledCode = StringBuffer_new(NULL);

	for(i=0; i< MAXARG_A; i++){
		self->bools[i] = NULL;
	}
	self->bools[0] = NewBoolOp();
	
	self->intspos = 0;
	return self;
}

void DeleteFunction(Function * self)
{
	int i;
	LoopList(&(self->statements), (ListItemFn) DeleteStatement, NULL);
	/*
	* clean up registers
	*/
	for (i = 0; i < MAXARG_A; i++) {
		if (self->R[i]){
			free(self->R[i]);
		}
		DeleteBoolOp(self->bools[i]);
		self->bools[i] = NULL;
	}
	StringBuffer_delete(self->decompiledCode);
	ClearVarStatck(self->vpend);
	free(self->vpend);
	free(self->tpend);
	//free(self->repeats);
	//free(self->untils);
	DeleteLoopTree(self->loop_tree);
	free(self->do_opens);
	free(self->do_closes);
	free(self);
}

void DeclareVariable(Function * F, const char *name, int reg);

const char *GetR(Function * F, int r)
{
	if (IS_TABLE(r)) {
		PrintTable(F, r, 0);
		if (error) return NULL;
	}
	UnsetPending(F, r);
	if (error) return NULL;

	if (F->R[r] == NULL) {
		StringBuffer* sb=StringBuffer_new("R%rrrrr%_PC%pcccccccc%");
		StringBuffer_printf(sb,"R%d_PC%d",r,F->pc);
		DeclareVariable(F,(const char *)(sb->buffer),r);
		//return sb->buffer;
		StringBuffer_delete(sb);
	}//dirty hack , some numeric FOR loops may cause error
	return F->R[r];
}

void DeclareVariable(Function * F, const char *name, int reg)
{
	F->Rvar[reg] = 1;
	if (F->R[reg])
		free(F->R[reg]);
	F->R[reg] = luadec_strdup(name);
	F->Rprio[reg] = 0;
	UnsetPending(F, reg);
	if (error) return;
}

void OutputAssignments(Function * F)
{
	int i, srcs, size;
	StringBuffer *vars = StringBuffer_new(NULL);
	StringBuffer *exps = StringBuffer_new(NULL);
	if (!SET_IS_EMPTY(F->tpend))
		goto OutputAssignments_ERROR_HANDLER;
	size = SET_CTR(F->vpend);
	srcs = 0;
	for (i = 0; i < size; i++) {
		int r = F->vpend->regs[i];
		if (!(r == -1 || PENDING(r))) {
			SET_ERROR(F,"Attempted to generate an assignment, but got confused about usage of registers");
			goto OutputAssignments_ERROR_HANDLER;
		}

		if (i > 0)
			StringBuffer_prepend(vars, ", ");
		StringBuffer_prepend(vars, F->vpend->dests[i]);

		if (F->vpend->srcs[i] && (srcs > 0 || (srcs == 0 && strcmp(F->vpend->srcs[i], "nil") != 0) || i == size-1)) {
			if (srcs > 0)
				StringBuffer_prepend(exps, ", ");
			StringBuffer_prepend(exps, F->vpend->srcs[i]);
			srcs++;
		}

	}

	for (i = 0; i < size; i++) {
		int r = F->vpend->regs[i];
		if (r != -1)
			PENDING(r) = 0;
		if (F->vpend->dests[i]){
			free(F->vpend->dests[i]);
			F->vpend->dests[i] = NULL;
		}
		if (F->vpend->srcs[i]){
			free(F->vpend->srcs[i]);
			F->vpend->srcs[i] = NULL;
		}
	}
	F->vpend->ctr = 0;

	if (i > 0) {
		StringBuffer_add(vars, " = ");
		StringBuffer_add(vars, StringBuffer_getRef(exps));
		AddStatement(F, vars);
		if (error)
			goto OutputAssignments_ERROR_HANDLER;
	}
OutputAssignments_ERROR_HANDLER:
	StringBuffer_delete(vars);
	StringBuffer_delete(exps);
}

void ReleaseLocals(Function * F) {
	int i;
	for (i = F->f->sizelocvars-1; i >=0 ; i--) {
		if (F->f->locvars[i].endpc == F->pc) {
			int r;
			F->freeLocal--;
			r = F->freeLocal;
			//fprintf(stderr,"%d %d %d\n",i,r, F->pc);
			if (!IS_VARIABLE(r)) {
				// fprintf(stderr,"--- %d %d\n",i,r);
				SET_ERROR(F,"Confused about usage of registers for local variables.");
				return;
			}
			F->Rvar[r] = 0;
			F->Rprio[r] = 0;
			if (!F->ignore_for_variables && !F->released_local)
				F->released_local = F->f->locvars[i].startpc;
		}
	}
	F->ignore_for_variables = 0;
}

void DeclareLocals(Function * F)
{
	int i;
	int locals;
	int internalLocals = 0;
	//int loopstart;
	//int loopvars;
	int loopconvert;
	StringBuffer *str;
	StringBuffer *rhs;
	char *names[MAXARG_A];
	int startparams = 0;
	/*
	* Those are declaration of parameters.
	*/
	if (F->pc == 0) {
		startparams = F->f->numparams;
		if ((F->f->is_vararg&1) && (F->f->is_vararg&2)) {
			startparams++;
		}
	}
	str = StringBuffer_new("local ");
	rhs = StringBuffer_new(" = ");
	locals = 0;
	if (F->pc != 0) {
		for (i=startparams; i < F->f->maxstacksize; i++) {
			if (functionnum >=0 && functionnum < 255 && localdeclare[functionnum][i]==F->pc) {
				char* name;
				int r = i;
				name = (char*)calloc(10, sizeof(char));
				sprintf(name,"l_%d_%d",functionnum,i);
				if (F->internal[r]) {
					names[r] = name;
					F->internal[r] = 0;
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
				if (GET_OPCODE(n2) == OP_TFORLOOP) {
					F->f->locvars[i].startpc = F->pc+1;
					continue;
				}
			}
			if ((F->internal[r])) {
				names[r] = LOCAL(i);
				PENDING(r) = 0;
				IS_VARIABLE(r) = 1;
				F->internal[r] = 0;
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
				if (locals > 0){
					StringBuffer_add(str, ", ");
				}
				StringBuffer_add(str, LOCAL(i));
			}
			CALL(r) = 0;
			IS_VARIABLE(r) = 1;
			names[r] = LOCAL(i);
			locals++;
		}
	}
	if (locals > 0) {
		StringBuffer_add(str, StringBuffer_getRef(rhs));
		if (strcmp(StringBuffer_getRef(rhs)," = ") == 0){
			StringBuffer_add(str,"nil");
		}
		AddStatement(F, str);
		if (error) return;
	}
	StringBuffer_delete(rhs);
	StringBuffer_delete(str);
	for (i = 0; i < locals + internalLocals; i++) {
		int r = F->freeLocal + i;
		DeclareVariable(F, names[r], r);
		if (error) return;
	}
	F->freeLocal += locals + internalLocals;
}

void PrintFunctionCheck(Function * F){
	if (F->nextEndif){
		// if you come here, something must be wrong
		// F->nextEndif should be cleared in function int GetEndifAddr(Function* F, int addr)
		// you may get -- WARNING: missing end command somewhere! Added here
		StringBuffer* str = StringBuffer_new("-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = ");
		Statement* stmt = NULL;
		Endif* ptr = F->nextEndif;
		while(ptr){			
			StringBuffer_addPrintf(str, "%d ", ptr->addr);
			F->nextEndif = ptr->next;
			free(ptr);
			ptr = F->nextEndif;
		}
		stmt = NewStatement(StringBuffer_getBuffer(str), F->pc, F->indent);
		AddToList(&(F->statements), cast(ListItem*, stmt));
		StringBuffer_delete(str);
	}
}

char* PrintFunction(Function * F)
{
	char* result;
	PrintFunctionCheck(F);
	StringBuffer_prune(F->decompiledCode);
	LoopList(&(F->statements), (ListItemFn) PrintStatement, F);
	result = StringBuffer_getBuffer(F->decompiledCode);
	return result;
}

/*
* -------------------------------------------------------------------------
*/

char *RegisterOrConstant(Function * F, int r)
{
	if (IS_CONSTANT(r)) {
		return DecompileConstant(F->f, INDEXK(r));
	} else {
		char *copy;
		const char *reg = GetR(F, r);
		if (error)
			return NULL;
		copy = luadec_strdup(reg);
		return copy;
	}
}

// isalpha in stdlib is undefined when ch>=256 , may throw a assertion error.
int luadec_isalpha(int ch) {
	return ( ch>='A' && ch<='Z' ) || ( ch>='a' && ch<='z' );
}
int luadec_isdigit(int ch) {
	return ( ch>='0' && ch<='9' );
}
int luadec_isalnum(int ch) {
	return ( ch>='0' && ch<='9' ) || ( ch>='a' && ch<='z' ) || ( ch>='A' && ch<='Z' );
}

const int numofkeywords = 21;
const char* keywords[] = {
	"and", "break", "do", "else", "elseif",
	"end", "false", "for", "function", "if",
	"in", "local", "nil", "not", "or",
	"repeat", "return", "then", "true", "until",
	"while", "continue"
};

/* type: DOT=0,SELF=1,TABLE=2
 * input and output
 * rstr  "a"  " a"    "not"    a
 * SELF  :a   ERROR   ERROR    ERROR
 * DOT   .a   [" a"]  ["not"]  [a]
 * TABLE  a   [" a"}  ["not"]  [a]
 */
void MakeIndex(Function* F, StringBuffer * str, char* rstr, IndexType type)
{
	int len, dot, i;
	char lastchar;
	char* rawrstr;
	StringBuffer* rawrstrbuff;

	len = strlen(rstr);
	lastchar = rstr[len - 1];
	rstr[len - 1] = '\0';
	rawrstrbuff = StringBuffer_new((rstr + 1));
	rawrstr = StringBuffer_getRef(rawrstrbuff);
	rstr[len - 1] = lastchar;

	dot = 0;
	/*
	* see if index can be expressed without quotes
	*/
	if (rstr[0] == '\"') {
		if (luadec_isalpha(rstr[1]) || rstr[1] == '_') {
			char *at;
			dot = 1;
			for (at = rstr + 1; at < rstr + len - 1; at++) {
				if (!luadec_isalnum(*at) && *at != '_') {
					dot = 0;
					break;
				}
			}
			for (i = 0; i < numofkeywords; i++){
				if(strcmp(keywords[i],rawrstr) == 0){
					dot = 0;
					break;
				}
			}
		}
	}
	if (dot == 1) {
		switch (type) {
			// type value DOT=0;SELF=1;TABLE=2;
			case SELF:
				StringBuffer_addPrintf(str, ":%s", rawrstr);
				break;
			case DOT:
				StringBuffer_addPrintf(str, ".%s", rawrstr);
				break;
			case TABLE:
				StringBuffer_addPrintf(str, "%s", rawrstr);
				break;
		}
	} else{
		StringBuffer_addPrintf(str, "[%s]", rstr);
		if (type == SELF){
			StringBuffer_printf(rawrstrbuff,"[%s] should be a SELF Operator",rstr);
			SET_ERROR(F,StringBuffer_getRef(rawrstrbuff));
		}
	}

	StringBuffer_delete(rawrstrbuff);
}

void FunctionHeader(Function * F) {
	int saveIndent = F->indent;
	const Proto* f = F->f;
	StringBuffer* str = StringBuffer_new(NULL);
	F->indent = 0;
	if (f->numparams > 0) {
		int i;
		StringBuffer_addPrintf(str, "(");
		for (i = 0; i < f->numparams - 1; i++){
			StringBuffer_addPrintf(str, "%s, ", LOCAL(i));
			//StringBuffer_addPrintf(str, "l_%d_%d, ", functionnum, i);
		}
		StringBuffer_addPrintf(str, "%s", LOCAL(i));
		//StringBuffer_addPrintf(str, "l_%d_%d", functionnum, i);
		if (f->is_vararg)
			StringBuffer_add(str, ", ...");
		StringBuffer_addPrintf(str, ")");
		AddStatement(F, str);
		if (error)
			return;
		StringBuffer_prune(str);
	} else if (!IsMain(f)) {
		if (f->is_vararg)
			StringBuffer_add(str, "(...)");
		else
			StringBuffer_add(str, "()");
		AddStatement(F, str);
		if (error)
			return;
		StringBuffer_prune(str);
	}
	F->indent = saveIndent;
	if (!IsMain(f))
		F->indent++;
	StringBuffer_delete(str);
}

void ShowState(Function * F)
{
	int i;
	fprintf(stddebug, "\n");
	fprintf(stddebug, "next bool: %d\n", F->nextBool);
	fprintf(stddebug, "locals(%d): ", F->freeLocal);
	for (i = 0; i < F->freeLocal; i++) {
		fprintf(stddebug, "%d{%s} ", i, REGISTER(i));
	}
	fprintf(stddebug, "\n");
	fprintf(stddebug, "vpend(%d): ", SET_CTR(F->vpend));
	for (i = 0; i < SET_CTR(F->vpend); i++) {
		int r = F->vpend->regs[i];
		if (r != -1 && !PENDING(r)) {
			SET_ERROR(F,"Confused about usage of registers for variables");
			return;
		}
		fprintf(stddebug, "%d{%s=%s} ", r, F->vpend->dests[i], F->vpend->srcs[i]);
	}
	fprintf(stddebug, "\n");
	fprintf(stddebug, "tpend(%d): ", SET_CTR(F->tpend));
	for (i = 0; i < SET_CTR(F->tpend); i++) {
		int r = SET(F->tpend, i);
		fprintf(stddebug, "%d{%s} ", r, REGISTER(r));
		if (!PENDING(r)) {
			SET_ERROR(F,"Confused about usage of registers for temporaries");
			return;
		}
	}
	fprintf(stddebug, "\n");
}

#define TRY(x)  x; if (error) goto errorHandler

void DeclareLocal(Function * F, int ixx, const char* value) {
	if (!IS_VARIABLE(ixx)) {
		char x[10];
		StringBuffer *str = StringBuffer_new(NULL);

		sprintf(x,"l_%d_%d",functionnum, ixx);
		DeclareVariable(F, x, ixx);
		IS_VARIABLE(ixx) = 1;
		StringBuffer_printf(str,"local %s = %s",x,value);
		RawAddStatement(F, str);
		F->freeLocal++;
		StringBuffer_delete(str);
	}
}

void DeclarePendingLocals(Function * F) {
	int i;
	int maxnum = 0;
	int nums[201];
	StringBuffer *str = StringBuffer_new(NULL);
	if (SET_CTR(F->tpend)>0) {
		if (guess_locals) {
			StringBuffer_set(str,"-- WARNING: pending registers.");
		} else {
			StringBuffer_set(str,"-- WARNING: pending registers. Declaring locals.");
			AddStatement(F,str);
			for (i= 0; i < SET_CTR(F->tpend); i++) {
				nums[maxnum] = SET(F->tpend, i);
				maxnum ++;
			}
			for (i = 0; i< maxnum; i++) {
				char* s = luadec_strdup(REGISTER(nums[i]));
				GetR(F,nums[i]);
				DeclareLocal(F,nums[i],s);
			}
		}
	}
	StringBuffer_delete(str);
}

Proto* combine(lua_State* L, int n);
char* ProcessCode(const Proto * f, int indent, int func_checking);

int FunctionCheck(const Proto * f, int indent, StringBuffer *str){
    lua_State* L;
    Proto* fnew;
    int check_result;
    char* decompiled = ProcessCode(f, indent, 1);
    L=lua_open();
    if (luaL_loadstring(L, decompiled)!=0){
        //TODO check fail compile fail
        StringBuffer_set(str, "--check fail : cannot compile");
        check_result = -1;
    }else{
        fnew = combine(L, 1);
        if( !IsMain(f)){
            fnew = fnew->p[0];
        }
        check_result = CompareProto(f, fnew, str);
    }
    lua_close(L);
    free(decompiled);
    if(check_result == 0){
        StringBuffer_set(str, "-- check ok");
    }
    return check_result;
}

int CompareProto(const Proto* f1, const Proto* f2, StringBuffer *str){
    int diff = 0;
	StringBuffer_set(str, "-- check fail :");
    if(f1->numparams != f2->numparams){
        diff = 1;
        StringBuffer_add(str, " different params size;");
    }
    if(f1->sizeupvalues != f2->sizeupvalues){
		diff = 1;
        StringBuffer_add(str, " different upvalues size;");
    }
    if(f1->sizecode != f2->sizecode){
		diff = 1;
        StringBuffer_add(str, " different code size;");
    }
    return diff;
}

char* PrintFunctionOnlyParamsAndUpvalues(const Proto * f, int indent)
{
	int i = 0;
	int baseIndent = indent;
    char* output = NULL;
	StringBuffer *str = StringBuffer_new(NULL);
	Function *F = NewFunction(f);
	F->indent = indent;
	error = NULL;

	/*
	* Function parameters are stored in registers from 0 on.
	*/
	for (i = 0; i < f->numparams; i++) {
		char* x = (char*)calloc(MAX(10,strlen(LOCAL(i))+1), sizeof(char));
		sprintf(x,"%s",LOCAL(i));
		//sprintf(x,"l_%d_%d",functionnum, i);
		TRY(DeclareVariable(F, x, i));
		IS_VARIABLE(i) = 1;
	}
	F->freeLocal = f->numparams;

    TRY(FunctionHeader(F));

	if ( f->sizeupvalues > 0){
        StringBuffer_set(str, "_function_use_upvalues_as_params_(");
        listUpvalues(F, str);
        StringBuffer_add(str, ")");
        TRY(RawAddStatement(F, str));
	}

errorHandler:
	output = PrintFunction(F);
	DeleteFunction(F);
	StringBuffer_delete(str);
	return output;
}

int listUpvalues(Function *F, StringBuffer *str){
    int i = 0;
    for (i = 0; i < F->f->sizeupvalues - 1; i++) {
        StringBuffer_add(str,UPVALUE(i));
        StringBuffer_add(str," , ");
    }
    i = F->f->sizeupvalues - 1;
    StringBuffer_add(str,UPVALUE(i));
    return F->f->sizeupvalues;
}

int isTestOpCode(OpCode op){
	return ( op == OP_EQ || op == OP_LE || op == OP_LT || op == OP_TEST || op == OP_TESTSET );
}

char* ProcessCode(const Proto * f, int indent, int func_checking)
{
	int i = 0;

	int ignoreNext = 0;

	/*
	* State variables for the boolean operations.
	*/
	int boolpending = 0;

	Function *F;
	StringBuffer *str = StringBuffer_new(NULL);

	const Instruction *code = f->code;
	int pc, n = f->sizecode;
	int baseIndent = indent;

	char* output;

	LoopItem* next_child;

	List processed_jmps;
	InitList(&processed_jmps);

	F = NewFunction(f);
	F->indent = indent;
	F->pc = 0;
	error = NULL;

	/*
	* Function parameters are stored in registers from 0 on.
	*/
	for (i = 0; i < f->numparams; i++) {
		char* x = (char*)calloc(MAX(10,strlen(LOCAL(i))+1), sizeof(char));
		sprintf(x,"%s",LOCAL(i));
		//sprintf(x,"l_%d_%d",functionnum, i);
		TRY(DeclareVariable(F, x, i));
		IS_VARIABLE(i) = 1;
		free(x);
	}
	F->freeLocal = f->numparams;

	if ( f->sizeupvalues > 0){
        if ( func_checking == 1){
            StringBuffer_set(str, "local ");
        }else{
            StringBuffer_set(str, "-- upvalues: ");
        }
        listUpvalues(F, str);
	}

	if( !IsMain(f)){
        if ( func_checking == 1){
            if ( f->sizeupvalues > 0){
                TRY(RawAddStatement(F, str));
            }
            StringBuffer_set(str, "function _function_to_compare_");
            TRY(RawAddStatement(F, str));
            TRY(FunctionHeader(F));
        }else{
            TRY(FunctionHeader(F));
            if ( f->sizeupvalues > 0){
                TRY(RawAddStatement(F, str));
            }
        }
	}
    StringBuffer_prune(str);

	if( func_check == 1 && func_checking == 0){
        int func_check_result = FunctionCheck(f, indent, str);
        TRY(RawAddStatement(F, str));
    }

	if ((f->is_vararg&1) && (f->is_vararg&2)) {
		TRY(DeclareVariable(F, "arg", F->freeLocal));
		F->freeLocal++;
	}

	if (locals) {
		for (i=F->freeLocal; i<f->maxstacksize; i++) {
			DeclareLocal(F,i,"nil");
		}
	}

	for( pc = n - 1; pc >= 0; pc-- ){
		Instruction i = code[pc];
		OpCode o = GET_OPCODE(i);
		int sbc = GETARG_sBx(i);
		int dest = sbc + pc + 1;
		int real_end = GetJmpAddr(F,pc + 1);

		if( o == OP_CLOSE ){
			int a = GETARG_A(i);
			AddToSet(F->do_opens, f->locvars[a].startpc);
			AddToSet(F->do_closes, f->locvars[a].endpc);
		}else if( o == OP_FORLOOP ){
			LoopItem* item = NewLoopItem(FORLOOP, dest-1, dest, dest, pc, real_end);
			AddToLoopTree(F, item);
		}else if( o == OP_JMP ){
			OpCode pc_1 = GET_OPCODE(code[pc-1]);
			if( dest == F->loop_ptr->start && !isTestOpCode(pc_1)){
				//continues
				IntListItem *intItem = NewIntListItem(pc);
				AddToList(&(F->continues), cast(ListItem*,intItem));
			}else if( dest == F->loop_ptr->next_code ){
				if (!isTestOpCode(pc_1)){
					//breaks
					IntListItem *intItem = NewIntListItem(pc);
					AddToList(&(F->breaks), cast(ListItem*,intItem));
				}
			}else if( F->loop_ptr->body <= dest && dest < pc ){
				if(pc_1 == OP_TFORLOOP){
					// TFORLOOP jump back
					LoopItem* item = NewLoopItem(TFORLOOP, dest-1, dest, dest, pc, real_end);
					AddToLoopTree(F, item);
				}else if ( isTestOpCode(pc_1) ){
					// REPEAT jump back
					/***
						* if the out loop(loop_ptr) is while1 and body=loop_ptr.start,
						* jump back may be 'until' or 'if', they are the same,
						* but 'if' is more clear, so we skip making a loop to choose 'if'.
						* see the lua code:
					local a,b,c,f

					while 1 do
						repeat
						f(b)
						until c
						f(a)
					end

					while 1 do
						f(b)
						if c then
						f(a)
						end
					end
						*/
					if ( !((F->loop_ptr->type == WHILE1 ) && (dest == F->loop_ptr->start))){
						LoopItem* item = NewLoopItem(REPEAT, dest, dest, dest, pc, real_end);
						AddToLoopTree(F, item);
					}
				}else{
					// WHILE jump back
					int found = 0;
					int x;
					for(x = pc - 1; x > dest; x--){
						Instruction xi = code[x];
						OpCode xo = GET_OPCODE(xi);
						int x_dest = GETARG_sBx(xi) + x + 1;
						if(xo == OP_JMP && x_dest == real_end){
							OpCode x_1 = GET_OPCODE(code[x-1]);
							if( isTestOpCode(x_1) ){
								if( found == 0 ){
									// cannot determine loop body
									LoopItem* item = NewLoopItem(WHILE, dest, dest, dest, pc, real_end);
									AddToLoopTree(F, item);
									found = 1;
									break;
								}
							}
						}
					}
					if( found != 1 ){
						LoopItem* item = NewLoopItem(WHILE1, dest, dest, dest, pc, real_end);
						AddToLoopTree(F, item);
					}
				}
			}
		}
	}
	DeleteList(&processed_jmps);

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

		if(pc > F->loop_ptr->end){
			next_child = F->loop_ptr->next;
			F->loop_ptr = F->loop_ptr->parent;
		}

		while (next_child && pc >= next_child->body){
			F->loop_ptr = next_child;
			next_child = F->loop_ptr->child;
		}

		// nil optimization of Lua 5.1
		if (pc == 0) {
			if ((o == OP_SETGLOBAL) || (o == OP_SETUPVAL)){
				int ixx;
				for (ixx = F->freeLocal; ixx <= a; ixx++) {
					TRY(AssignReg(F, ixx, "nil", 0, 1));
					PENDING(ixx)=1;
				}
			} else if (o != OP_JMP) {
				int ixx;
				for (ixx = F->freeLocal; ixx <= a-1; ixx++) {
					TRY(AssignReg(F, ixx, "nil", 0, 1));
					PENDING(ixx)=1;
				}
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
			StringBuffer_set(str, "do");
			TRY(AddStatement(F, str));
			StringBuffer_prune(str);
			F->indent++;
		}

		while (RemoveFromSet(F->do_closes, pc)) {
			StringBuffer_set(str, "end");
			F->indent--;
			TRY(AddStatement(F, str));
			StringBuffer_prune(str);
		}

		while (GetEndifAddr(F, pc + 1)) {
			StringBuffer_set(str, "end");
			F->elseWritten = 0;
			F->elsePending = 0;
			F->indent--;
			TRY(AddStatement(F, str));
			StringBuffer_prune(str);
		}

		if ((F->loop_ptr->body == pc) && (F->loop_ptr->type == REPEAT || F->loop_ptr->type == WHILE1)) {
			LoopItem *walk = F->loop_ptr;

			while (walk->parent && (walk->parent->body == pc ) &&(walk->parent->type == REPEAT || walk->parent->type == WHILE1)) {
				walk = walk->parent;
			};

			while (1) {
				if (walk->type == WHILE1){
					StringBuffer_set(str, "while 1 do");
				}else if (walk->type == REPEAT){
					StringBuffer_set(str, "repeat");
				}
				TRY(AddStatement(F,str));
				StringBuffer_prune(str);
				F->indent++;

				if ( walk == F->loop_ptr ){
					break;
				}
				walk = walk->child;
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
	  case OP_LOADBOOL:
		  {
			  if ((F->nextBool == 0) || (c==0)) {
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
				  char *test = NULL;
				  TRY(test = OutputBoolean(F, NULL, 1));
				  StringBuffer_printf(str, "%s", test);
				  if (test) free(test);
				  TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			  }
			  if (c)
				  ignoreNext = 1;
			  break;
		  }
	  case OP_LOADNIL:
		  {
			  int i;
			  /*
			  * Read nil into register.
			  */
			  for(i = a; i <= b; i++) {
				  TRY(AssignReg(F, i, "nil", 0, 1));
			  }
			  break;
		  }
	  case OP_VARARG: // Lua5.1 specific.
		  {
			  int i;
			  /*
			  * Read ... into register.
			  */
			  if (b==0) {
				  TRY(AssignReg(F, a, "...", 0, 1));
				  TRY(AssignReg(F, a+1, ".end", 0, 1));
			  } else {
				  for(i = 0; i < b-1; i++) {
					  TRY(AssignReg(F, a+i, "...", 0, 1));
				  }
			  }
			  break;
		  }
	  case OP_GETUPVAL:
		  {
			  TRY(AssignReg(F, a, UPVALUE(b), 0, 1));
			  break;
		  }
	  case OP_GETGLOBAL:
		  {
			  /*
			  * Read global into register.
			  */
			  TRY(AssignReg(F, a, GLOBAL(bc), 0, 1));
			  break;
		  }
	  case OP_GETTABLE:
		  {
			  /*
			  * Read table entry into register.
			  */
			  const char *bstr;
			  char* cstr;
			  TRY(cstr = RegisterOrConstant(F, c));
			  TRY(bstr = GetR(F, b));
			  if (bstr[0] == '{') {
				  StringBuffer_printf(str, "(%s)", bstr);
			  } else {
				  StringBuffer_set(str, bstr);
			  }
			  MakeIndex(F, str, cstr, DOT);
			  TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			  free(cstr);
			  break;
		  }
	  case OP_SETGLOBAL:
		  {
			  /*
			  * Global Assignment statement.
			  */
			  const char *var = GLOBAL(bc);
			  const char *astr;
			  TRY(astr = GetR(F, a));
			  TRY(AssignGlobalOrUpvalue(F, var, astr));
			  break;
		  }
	  case OP_SETUPVAL:
		  {
			  /*
			  * Global Assignment statement.
			  */
			  const char *var = UPVALUE(b);// UP(b) is correct
			  const char *astr;
			  TRY(astr = GetR(F, a));
			  TRY(AssignGlobalOrUpvalue(F, var, astr));
			  break;
		  }
	  case OP_SETTABLE:
		  {
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
				  StringBuffer_set(str, REGISTER(a));
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

			  StringBuffer_set(str, bstr);
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
		  {
			  char *bstr, *cstr;
			  char *oper = operators[o];
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
			  int dest = sbc + pc + 2;
			  Instruction idest = code[dest - 1];
			  IntListItem* foundInt = (IntListItem*)RemoveFindInList(&(F->breaks), (ListItemCmpFn)MatchIntListItem, &pc);
			  if (boolpending) {
				  boolpending = 0;
				  F->bools[F->nextBool]->dest = dest;
				  F->nextBool++;
				  if(F->bools[F->nextBool]){
					  ClearBoolOp(F->bools[F->nextBool]);
				  }else{
					  F->bools[F->nextBool] = NewBoolOp();
				  }
				  if (F->testpending) {
					  F->testjump = dest;
				  }
				  if (( F->loop_ptr->type == REPEAT) && (F->loop_ptr->end == F->pc )) {//RemoveFromSet(F->untils, F->pc
					  int endif, thenaddr;
					  char* test = NULL;
					  LogicExp* exp = NULL;
					  TRY(exp = MakeBoolean(F, &endif, &thenaddr));
					  TRY(test = WriteBoolean(exp, &thenaddr, &endif, 0));
					  StringBuffer_printf(str, "until %s", test);
					  F->indent--;
					  RawAddStatement(F, str);
					  if (test) free(test);
					  if (exp) DeleteLogicExpTree(exp);
				  }
			  /*}else if (RemoveFromSet(F->untils, F->pc)) { // never executed , we use 'while 1' instead of 'until false'
				  StringBuffer_printf(str, "until false");
				  F->indent--;
				  RawAddStatement(F, str);*/
			  }else if (foundInt != NULL){ // break
				  free(foundInt);
				  StringBuffer_printf(str, "do break end");
				  TRY(AddStatement(F, str));
			  }else if (F->loop_ptr && F->loop_ptr->end == pc ){ // until jmp has been processed, tforloop has ignored the jmp, forloop does not have a jmp
				  F->indent--;
				  StringBuffer_printf(str, "end");
				  TRY(AddStatement(F, str));
			  }else if (GetEndifAddr(F, pc + 2)) {
				  if (F->elseWritten) {
					  F->indent--;
					  StringBuffer_printf(str, "end");
					  TRY(AddStatement(F, str));
				  }
				  F->indent--;
				  F->elsePending = dest;
				  F->elseStart = pc + 2;
			  }else if (GET_OPCODE(idest) == OP_TFORLOOP) {
				  /*
				  * generic 'for'
				  */
				  int i;
				  //int step;
				  const char *generator, *control, *state;
				  //char *variables[20];
				  char* vname[40];
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
								  if (GET_OPCODE(F->f->code[f->locvars[i2].endpc-2]) == OP_TFORLOOP) {
									  f->locvars[i2].endpc -= 2;
								  }
								  if (GET_OPCODE(F->f->code[f->locvars[i2].endpc-1]) == OP_TFORLOOP) {
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
					  F->internal[a+2+i] = 1;
				  }

				  DeclarePendingLocals(F);

				  StringBuffer_printf(str,"for %s",vname[0]);
				  for (i=2; i<=c; i++) {
					  StringBuffer_addPrintf(str, ",%s",vname[i-1]);
				  }
				  StringBuffer_addPrintf(str," in ");
				  StringBuffer_addPrintf(str,"%s do",generator);

				  F->internal[a] = 1;
				  F->internal[a + 1] = 1;
				  F->internal[a + 2] = 1;

				  F->intbegin[F->intspos] = a;
				  F->intend[F->intspos] = a+2+c;
				  TRY(AddStatement(F, str));
				  F->indent++;
				  break;
			  } else if (sbc == 2 && GET_OPCODE(code[pc+2]) == OP_LOADBOOL) {
				  int boola = GETARG_A(code[pc+1]);
				  char* test = NULL;
				  /* skip */
				  char* ra = luadec_strdup(REGISTER(boola));
				  char* rb = luadec_strdup(ra);
				  F->bools[F->nextBool]->op1 = ra;
				  F->bools[F->nextBool]->op2 = rb;
				  F->bools[F->nextBool]->op = OP_TESTSET;
				  F->bools[F->nextBool]->neg = c;
				  F->bools[F->nextBool]->pc = pc + 3;
				  F->testpending = a+1;
				  F->bools[F->nextBool]->dest = dest;
				  F->nextBool++;
				  if(F->bools[F->nextBool]){
					  ClearBoolOp(F->bools[F->nextBool]);
				  }else{
					  F->bools[F->nextBool] = NewBoolOp();
				  }
				  F->testjump = dest;
				  TRY(test = OutputBoolean(F, NULL, 1));
				  StringBuffer_printf(str, "%s", test);
				  if (test) free(test);
				  TRY(UnsetPending(F, boola));
				  TRY(AssignReg(F, boola, StringBuffer_getRef(str), 0, 0));
				  ignoreNext = 2;
			  } else if (GET_OPCODE(idest) == OP_LOADBOOL) {
				  /*
				  * constant boolean value
				  */
				  pc = dest - 2;
			  } else if (sbc == 0) {
				  /* dummy jump -- ignore it */
				  break;
			  } else {
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
			  break;
		  }
	  case OP_EQ:
	  case OP_LT:
	  case OP_LE:
		  {
			  if (IS_CONSTANT(b)) {
				  int swap = b;
				  b = c;
				  c = swap;
				  a = !a;
				  if (o == OP_LT) o = OP_LE;
				  else if (o == OP_LE) o = OP_LT;
			  }
			  ClearBoolOp(F->bools[F->nextBool]);
			  TRY(F->bools[F->nextBool]->op1 = RegisterOrConstant(F, b));
			  TRY(F->bools[F->nextBool]->op2 = RegisterOrConstant(F, c));
			  F->bools[F->nextBool]->op = o;
			  F->bools[F->nextBool]->neg = a;
			  F->bools[F->nextBool]->pc = pc + 1;
			  boolpending = 1;
			  break;
		  }
	  case OP_TESTSET: // Lua5.1 specific TODO: correct it
	  case OP_TEST:
		  {
			  int cmpa, cmpb, cmpc;
			  const char *ra, *rb, *rc;

			  if (o==OP_TESTSET) {
				  cmpa = a;
				  cmpb = b;
				  cmpc = c;
			  } else {
				  cmpa = a;
				  cmpb = a;
				  cmpc = c;
				  // StringBuffer_add(str, "  -- Lua5.1 code: CHECK");
				  // TRY(AddStatement(F, str));
			  }

			  if (!IS_VARIABLE(cmpa)) {
				  ra = REGISTER(cmpa);
				  TRY(rb = GetR(F, cmpb));
				  PENDING(cmpa) = 0;
			  } else {
				  TRY(ra = GetR(F, cmpa));
				  if (cmpa != cmpb) {
					  TRY(rb = GetR(F, cmpb));
				  } else {
					  rb = ra;
				  }
			  }
			  ClearBoolOp(F->bools[F->nextBool]);
			  F->bools[F->nextBool]->op1 = luadec_strdup(ra);
			  F->bools[F->nextBool]->op2 = luadec_strdup(rb);
			  F->bools[F->nextBool]->op = o;
			  F->bools[F->nextBool]->neg = cmpc;
			  F->bools[F->nextBool]->pc = pc + 1;
			  // Within an IF, a and b are the same, avoiding side-effects
			  if (cmpa != cmpb || !IS_VARIABLE(cmpa)) {
				  F->testpending = cmpa+1;
			  }
			  boolpending = 1;
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
			  } else
				  limit = a + b;
			  if (o == OP_TAILCALL) {
				  StringBuffer_set(str, "return ");
				  ignoreNext = 1;
			  }
			  TRY(astr = GetR(F, a));
			  StringBuffer_addPrintf(str, "%s(", astr);

			  {
				  const char* at = astr + strlen(astr) - 1;
				  while (at > astr && (luadec_isalpha(*at) || *at == '_')) {
					  at--;
				  }
				  if (*at == ':')
					  self = 1;
			  }

			  for (i = a + 1; i < limit; i++) {
				  const char *ireg = NULL;
				  TRY(ireg = GetR(F, i));
				  if(strcmp(ireg,".end") == 0)
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
			  if (o == OP_TAILCALL || c == 1 ) {
				  TRY(AddStatement(F, str));
			  } else {
				  TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
				  if (c == 0) TRY(AssignReg(F, a+1, ".end", 0, 1));
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

			  for (i=F->intbegin[F->intspos]; i<=F->intend[F->intspos]; i++)
			  {
				  //fprintf(stderr,"X %d\n",i);
				  IS_VARIABLE(i)=0;
				  F->internal[i] = 0;
			  }
			  F->intspos--;
			  F->indent--;
			  F->ignore_for_variables = 0;

			  StringBuffer_set(str, "end");
			  TRY(AddStatement(F, str));
			  break;
		  }
	  case OP_TFORLOOP: //Lua5.1 specific. TODO: CHECK
		  {
			  int i;
			  for (i=F->intbegin[F->intspos]; i<=F->intend[F->intspos]; i++)
			  {
				  IS_VARIABLE(i)=0;
				  F->internal[i] = 0;
			  }
			  F->intspos--;

			  F->indent--;
			  F->ignore_for_variables = 0;
			  StringBuffer_set(str, "end");
			  TRY(AddStatement(F, str));
			  ignoreNext = 1;
			  break;
		  }
	  case OP_FORPREP: //Lua5.1 specific. TODO: CHECK
		  {
			  /*
			  * numeric 'for'
			  */
			  int i;
			  int step;
			  char *idxname;
			  const char *initial, *a1str, *endstr;
			  int stepLen;
			  F->intspos++;
			  TRY(initial = GetR(F, a));
			  TRY(endstr = GetR(F, a+2));
			  TRY(a1str = GetR(F, a+1));

			  if (!IS_VARIABLE(a+3)) {
				  int loopvars = 0;
				  idxname = NULL;
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
				  StringBuffer_printf(str, "for %s = %s, %s do",
					  idxname, initial, a1str);
			  } else {
				  StringBuffer_printf(str, "for %s = %s, %s, %s do",
					  idxname, initial, a1str, REGISTER(a + 2));
			  }

			  /*
			  * Every numeric 'for' declares 4 variables.
			  */
			  F->internal[a] = 1;
			  F->internal[a + 1] = 1;
			  F->internal[a + 2] = 1;
			  F->internal[a + 3] = 1;
			  F->intbegin[F->intspos] = a;
			  F->intend[F->intspos] = a+3;
			  TRY(AddStatement(F, str));
			  F->indent++;
			  break;
		  }
	  case OP_SETLIST:
		  {
			  TRY(SetList(F, a, b, c));
			  break;
		  }
	  case OP_CLOSE:
		  /*
		  * Handled in do_opens/do_closes variables.
		  */
		  break;
	  case OP_CLOSURE:
		  {
			  /*
			  * Function.
			  */
			  int i;
			  int uvn;
			  int cfnum = functionnum;

			  uvn = f->p[c]->nups;

			  /* determining upvalues */

			  // upvalue names = next n opcodes after CLOSURE

			  if (!f->p[c]->upvalues) {
				  f->p[c]->sizeupvalues = uvn;
				  f->p[c]->upvalues = luaM_newvector(glstate,uvn,TString*);

				  for (i=0; i<uvn; i++) {
					  if (GET_OPCODE(code[pc+i+1]) == OP_MOVE) {
						  char names[10];
						  sprintf(names,"l_%d_%d",functionnum,GETARG_B(code[pc+i+1]));
						  f->p[c]->upvalues[i] = luaS_new(glstate, names);
					  } else if (GET_OPCODE(code[pc+i+1]) == OP_GETUPVAL) {
						  f->p[c]->upvalues[i] = f->upvalues[GETARG_B(code[pc+i+1])];
					  } else {
						  char names[20];
						  sprintf(names,"upval_%d_%d",functionnum,i);
						  f->p[c]->upvalues[i] = luaS_new(glstate, names);
					  }
				  }
			  }

			  /* upvalue determinition end */
			  if ( func_checking == 1){
                  StringBuffer_set(str, "function");
				  functionnum = c+1;
				  StringBuffer_add(str, PrintFunctionOnlyParamsAndUpvalues(f->p[c], F->indent));
				  functionnum = cfnum;
				  for (i = 0; i < F->indent; i++) {
					  StringBuffer_add(str, "  ");
				  }
				  StringBuffer_add(str, "end");
				  if (F->indent == 0)
					  StringBuffer_add(str, "\n");
			  }else if (disnested){
				  StringBuffer_printf(str, "_decompied_function_%d_",c+1);
			  }else{
				  char* code = NULL;
				  StringBuffer_set(str, "function");
				  functionnum = c+1;
				  code = ProcessCode(f->p[c], F->indent, 0);
				  StringBuffer_add(str, code);
				  free(code);
				  functionnum = cfnum;
				  for (i = 0; i < F->indent; i++) {
					  StringBuffer_add(str, "  ");
				  }
				  StringBuffer_add(str, "end");
				  if (F->indent == 0)
					  StringBuffer_add(str, "\n");
			  }
			  TRY(AssignReg(F, a, StringBuffer_getRef(str), 0, 0));
			  /* need to add upvalue handling */

			  ignoreNext = f->p[c]->sizeupvalues;

			  break;
		  }
	  default:
		  StringBuffer_printf(str, "-- unhandled opcode? : %-9s\t\n", luaP_opnames[o]);
		  TRY(AddStatement(F, str));
		  break;
		}

		if (debug) {
			TRY(ShowState(F));
			{
				char* f = PrintFunction(F);
				fprintf(stddebug, "%s\n", f);
				free(f);
			}
		}

		if (GetEndifAddr(F, pc)) {
			StringBuffer_set(str, "end");
			F->elseWritten = 0;
			F->indent--;
			TRY(AddStatement(F, str));
			StringBuffer_prune(str);
		}

		TRY(OutputAssignments(F));

	}

	if (GetEndifAddr(F, pc+1)) {
		StringBuffer_set(str, "end");
		F->indent--;
		TRY(AddStatement(F, str));
		StringBuffer_prune(str);
	}

	TRY(FlushBoolean(F));

	if (SET_CTR(F->tpend)>0) {
		StringBuffer_set(str," -- WARNING: undefined locals caused missing assignments!");
		TRY(AddStatement(F,str));
	}

	while (F->indent>indent+1) {
		StringBuffer_set(str," -- WARNING: missing end command somewhere! Added here");
		TRY(AddStatement(F, str));
		F->indent--;
		StringBuffer_set(str, "end");
		TRY(AddStatement(F, str));
	}

	if( !IsMain(f) && func_checking){
		StringBuffer_set(str, "end");
		TRY(AddStatement(F, str));
	}

	output = PrintFunction(F);
	DeleteFunction(F);
	StringBuffer_delete(str);
	return output;

errorHandler:
	printf("ERRORHANDLER\n");
	{
		char *copy;
		Statement *stmt;
		StringBuffer_printf(str, "--[[ DECOMPILER ERROR %d: %s ]]", errorCode, error);
		copy = StringBuffer_getCopy(str);
		stmt = NewStatement(copy, F->pc, F->indent);
		AddToList(&(F->statements), (ListItem *) stmt);
		F->lastLine = F->pc;
	}
	output = PrintFunction(F);
	DeleteFunction(F);
	error = NULL;
	StringBuffer_delete(str);
	return output;
}

void luaU_decompile(Proto * f, int dflag)
{
	char* code;
	debug = dflag;
	functionnum = 0;
	errorStr = StringBuffer_new(NULL);
	code = ProcessCode(f, 0, 0);
	StringBuffer_delete(errorStr);
	printf("%s\n", code);
	free(code);
	fflush(stdout);
	fflush(stderr);
}

void luaU_decompileNestedFunctions(Proto* f, int dflag, char* funcnumstr)
{
	int i,c=f->sizep;
	char* code;

	int uvn;
	//int cfnum = functionnum;

	Proto* cf = f;
	char* startstr = funcnumstr;
	char* endstr;

	functionnum = 0;

	c = atoi(startstr);
	if ( c < 0 || c > cf->sizep ){
		fprintf(stderr,"No such nested function num : %s , use -pn option to get available num.\n", funcnumstr);
		return;
	}
	if ( c > 0 && c <= cf->sizep ){
		cf = cf->p[c-1];
		functionnum = c;
	}
	endstr = strchr(startstr,'_');
	startstr=endstr+1;

	while( !(endstr == NULL) ){
		c = atoi(startstr);
		if ( c < 1 || c > cf->sizep  ){
			fprintf(stderr,"No such nested function num : %s , use -pn option to get available num.\n",funcnumstr);
			return;
		}
		cf = cf->p[c-1];
		endstr = strchr(startstr,'_');
		startstr=endstr+1;
	}

	uvn = cf->nups;

	/* determining upvalues */

	// upvalue names = next n opcodes after CLOSURE

	if (!cf->upvalues) {
		cf->sizeupvalues = uvn;
		cf->upvalues = luaM_newvector(glstate,uvn,TString*);

		for (i=0; i<uvn; i++) {
			char names[10];
			sprintf(names,"l_%d_%d",0,i);
			cf->upvalues[i] = luaS_new(glstate, names);
			printf("local l_%d_%d = nil\n",0,i);
		}
	}

	debug = dflag;


	printf("DecompiledFunction_%s = function",funcnumstr);
	errorStr = StringBuffer_new(NULL);
	code = ProcessCode(cf, 0, 0);
	StringBuffer_delete(errorStr);
	printf("%send\n", code);
	free(code);
	fflush(stdout);
	fflush(stderr);
}

void luaU_decompileFunctions(Proto* f, int dflag, int functions)
{
	int i,c=f->sizep;
	char* code;

	int uvn;
	//int cfnum = functionnum;

	if ( functions > f->sizep ){
		fprintf(stderr,"No such function num, function num is from %d to %d.\n",0,f->sizep);
		return;
	}

	c = functions-1;
	uvn = f->p[c]->nups;

	/* determining upvalues */

	// upvalue names = next n opcodes after CLOSURE

	if (!f->p[c]->upvalues) {
		f->p[c]->sizeupvalues = uvn;
		f->p[c]->upvalues = luaM_newvector(glstate,uvn,TString*);

		for (i=0; i<uvn; i++) {
			char names[10];
			sprintf(names,"l_%d_%d",0,i);
			f->p[c]->upvalues[i] = luaS_new(glstate, names);
			printf("local l_%d_%d = nil\n",0,i);
		}
	}

	i = functions-1;
	debug = dflag;


	printf("DecompiledFunction_%d = function",functions);
	functionnum = i+1;
	errorStr = StringBuffer_new(NULL);
	code = ProcessCode(f->p[i], 0, 0);
	StringBuffer_delete(errorStr);
	printf("%send\n", code);
	free(code);
	fflush(stdout);
	fflush(stderr);
}
