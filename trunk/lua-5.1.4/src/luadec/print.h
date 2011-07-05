#ifndef PRINT_H
#define PRINT_H

#include "structs.h"

typedef struct BoolOp_ BoolOp;

struct BoolOp_ {
   ListItem super;
   char *op1;
   char *op2;
   OpCode op;
   int neg;
   int pc;
   int dest;
};

typedef struct Endif_ Endif;

struct Endif_ {
   int addr;
   Endif* next;
};

typedef struct Statement_ Statement;

struct Statement_ {
   ListItem super;
   char *code;
   int line;
   int indent;
   int backpatch;
};

typedef struct Function_ Function;

struct Function_ {
   /* program counter during symbolic interpretation */
   int pc;
   /* These act as the VM registers */
   char *R[MAXARG_A];
   /* These store the priority for the operation that stored the value in each
      register */
   int Rprio[MAXARG_A];
   /* Boolean values indicating if register holds a table */
   int Rtabl[MAXARG_A];
   /* Registers standing for local variables. */
   int Rvar[MAXARG_A];
   /* Registers used in call returns. */
   int Rcall[MAXARG_A];
   /* This is the Lua proto for the function */
   const Proto *f;
   /* This is a stack for creation of tables */
   List tables;
   /* 'a' of last CALL instruction -- used with 0-param CALLs */
   int lastCall;
   /* Pending code to be flushed */
   /* FIXME: Needs a better data structure */
   char* vpendVal[MAXARG_A];
   int internal[MAXARG_A];
   int Rpend[MAXARG_A];
   /* State variables for the TEST instruction. */
   int testpending;
   int elsePending;
   int elseStart;
   /* Pending variable-registers */
   VarStack* vpend;
   /* Pending temp-registers */
   IntSet* tpend;
   /* Line number of detected constructs. */
   IntSet* whiles;
   IntSet* repeats;
   IntSet* untils;
   /* Control of do/end blocks. */
   IntSet* do_opens;
   IntSet* do_closes;
   int released_local;
   /* Skip for-variables on do-end check */
   int ignore_for_variables;
   int freeLocal;
   /* boolean operations */
   BoolOp* bools[MAXARG_A];
   int nextBool;
   Endif* nextEndif;

   List statements;
   int firstLine;
   int lastLine;
   /* holds the printed function */
   StringBuffer* decompiledCode;
   /* indent */
   int indent;
   int elseWritten;
   int testjump;

	 /* internal variable stack */
	 int intspos;
	 int intbegin[100];
	 int intend[100];
};

typedef struct DecTableItem_ DecTableItem;

struct DecTableItem_ {
   ListItem super;
   char *value;
   int numeric;
   char *key;
};

typedef struct DecTable_ DecTable;

struct DecTable_ {
   ListItem super;
   int reg;
   int topNumeric;
   List numeric;
   List keyed;
   int keyedSize;
   int arraySize;
   int used;
   Function *F;
};

typedef struct Variable_ Variable;

struct Variable_ {
   ListItem super;
   char *name;
   int reg;
};

void SetR(Function * F, int r, StringBuffer * str, int prio);
char *GetR(Function * F, int r);

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

StringBuffer* PrintLogicItem(StringBuffer* str, LogicExp* exp, int inv, int rev);
StringBuffer* PrintLogicExp(StringBuffer* str, int dest, LogicExp* exp, int inv_, int rev_);
void AddStatement(Function * F, StringBuffer * str);
void ShowState(Function * F);

#endif
