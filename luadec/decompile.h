#ifndef LUADEC_DECOMPILE_H
#define LUADEC_DECOMPILE_H

#include "structs.h"
#include "StringBuffer.h"
#include "ast.h"

typedef struct BoolOp_ BoolOp;
struct BoolOp_ {
	ListItem super;
	char* op1;
	char* op2;
	OpCode op;
	int neg;
	int pc;
	int dest;
};

typedef enum LoopType_ LoopType;
enum LoopType_ {
	FUNC_ROOT,
	WHILE,
	WHILE1,
	REPEAT,
	FORLOOP,
	TFORLOOP
};

typedef struct LoopItem_ LoopItem;
struct LoopItem_ {
	LoopItem* parent;
	LoopItem* child;
	LoopItem* prev;
	LoopItem* next;

	LoopType type;
	int prep;
	int start;
	int body;
	int end;
	int out;

	int indent;
};

typedef struct Function_ Function;
struct Function_ {
	/* This is the Lua proto for the function */
	const Proto* f;
	/* program counter during symbolic interpretation */
	int pc;
	/* These act as the VM registers */
	char* R[MAXARG_A];
	/* These store the priority for the operation that stored the value in each
	register */
	int Rprio[MAXARG_A];
	/* Boolean values indicating if register holds a table */
	int Rtabl[MAXARG_A];
	/* Registers standing for local variables. */
	int Rvar[MAXARG_A];
	/* Pending code to be flushed */
	int Rpend[MAXARG_A];
	/* Registers for internal use */
	int Rinternal[MAXARG_A];
	/* Registers used in call returns */
	int Rcall[MAXARG_A];
	/* 'a' of last CALL instruction -- used with 0-param CALLs */
	int lastCall;
	/* This is a list for creation of tables */
	List tables;
	/* State variables for the TEST instruction. */
	int testpending;
	int testjump;
	/* Pending variable-registers */
	List vpend;
	/* Pending temp-registers */
	IntSet* tpend;
	/* Loop Tree Structure */
	LoopItem* loop_tree;
	/* Pointer to Current Loop */
	LoopItem* loop_ptr;
	/* List for 'break' */
	List breaks;
	/* List for 'continue' */
	List continues;
	/* List of destination pc of JMP */
	List jmpdests;
	/* Control of do/end blocks. */
	IntSet* do_opens;
	IntSet* do_closes;
	int released_local;
	/* Skip for-variables on do-end check */
	int ignore_for_variables;
	int freeLocal;
	/* boolean operations */
	List bools;

	AstStatement* funcBlock;
	AstStatement* currStmt;
	int firstLine;
	int lastLine;
	/* holds the printed function */
	StringBuffer* decompiledCode;
	/* indent */
	int indent;

	/* internal variable stack */
	int intspos;
	int intbegin[100];
	int intend[100];

	char* funcnumstr;
};

typedef struct DecTableItem_ DecTableItem;
struct DecTableItem_ {
	ListItem super;
	char* value;
	int index;
	char* key;
};

typedef struct DecTable_ DecTable;
struct DecTable_ {
	ListItem super;
	int reg;
	List array;
	int arraySize;
	List keyed;
	int keyedSize;
	int pc;
};

typedef struct Variable_ Variable;
struct Variable_ {
	ListItem super;
	char* name;
	int reg;
};

typedef struct IntListItem_ IntListItem;
struct IntListItem_ {
	ListItem super;
	int value;
};

void SetR(Function* F, int r, StringBuffer* str, int prio);
const char* GetR(Function* F, int r);

typedef struct LogicExp_ LogicExp;
struct LogicExp_ {
	LogicExp* parent;
	LogicExp* next;
	LogicExp* prev;
	LogicExp* subexp;
	int is_chain;
	char* op1;
	char* op2;
	OpCode op;
	int dest;
	int neg;
};

LogicExp* MakeExpNode(BoolOp* boolOp);
LogicExp* MakeExpChain(int dest);
LogicExp* FindLogicExpTreeRoot(LogicExp* exp);
void DeleteLogicExpSubTree(LogicExp* exp);
void DeleteLogicExpTree(LogicExp* exp);
void PrintLogicItem(StringBuffer* str, LogicExp* exp, int inv, int rev);
void PrintLogicExp(StringBuffer* str, int dest, LogicExp* exp, int inv_, int rev_);

void AddStatement(Function* F, StringBuffer* str);
void ShowState(Function* F);

typedef enum IndexType_ IndexType;
enum IndexType_ {
	DOT=0,
	SELF=1,
	TABLE=2,
	SQUARE_BRACKET=3
};
IndexType MakeIndex(Function* F, StringBuffer* str, char* rstr, IndexType type);
int isIdentifier(const char* src);

void luaU_decompile(Proto* f, int lflag);
void luaU_decompileSubFunction(Proto* f, int dflag, const char* funcnumstr);

BoolOp* NewBoolOp();
BoolOp* MakeBoolOp(char* op1, char* op2, OpCode op, int neg, int pc, int dest);
void ClearBoolOp(BoolOp* ptr, void* dummy);
void DeleteBoolOp(BoolOp* ptr);

void listParams(const Proto* f, StringBuffer* str);
void listUpvalues(const Proto* f, StringBuffer* str);

char* ProcessCode(Proto* f, int indent, int func_checking, char* funcnumstr);
char* ProcessSubFunction(Proto* cf, int func_checking, char* funcnumstr);

int FunctionCheck(Proto* f, const char* funcnumstr, StringBuffer* str);
int CompareProto(const Proto* f1, const Proto* f2, StringBuffer* str);

int printFileNames(FILE* out);

#endif // #ifndef LUADEC_DECOMPILE_H
