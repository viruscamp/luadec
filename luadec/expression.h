#ifndef LUADEC_EXPRESSION_H
#define LUADEC_EXPRESSION_H

#include "lopcodes.h"

#include "lua-compat.h"
#include "structs.h"
#include "StringBuffer.h"

typedef enum ExpressionType_ ExpressionType;
enum ExpressionType_ {
	CONST_VAL,

	LOCAL_VAR,
	GLOBAL_VAR,
	UPVAL_VAR,
	VARARG_VAR,

	FUNC_DEF,
	TABLE_DEF,

	TABLE_REF,

	FUNC_CALL,

	UNARY_EXP,
	BINARY_EXP
};

typedef struct Expression_ Expression;
struct Expression_ {
	ExpressionType type;
	OpCode op;
	int reg;
	int pc;
	int idx;
	Expression* left;
	Expression* right;
	List* args;
};

Expression* MakeConstValExpression(int reg, int pc, int idx, OpCode op);

Expression* MakeLocalVarExpression(int reg, int pc, int idx);
Expression* MakeGlobalVarExpression(int reg, int pc, int idx, OpCode op);
Expression* MakeUpvalVarExpression(int reg, int pc, int idx, OpCode op);
Expression* MakeVarargVarExpression(int reg, int pc);

Expression* MakeFuncDefExpression(int reg, int pc, int idx);
Expression* MakeTableDefExpression(int reg, int pc);

Expression* MakeTableRefExpression(int reg, int pc, int idx, OpCode op);

Expression* MakeFuncCallExpression(int reg, int pc, OpCode op, Expression* func);

Expression* MakeUnaryExpression(int reg, int pc, OpCode op, Expression* sub);
Expression* MakeBinaryExpression(int reg, int pc, OpCode op, Expression* left, Expression* right);


void PrintExpression(Expression* exp, StringBuffer* buff, int indent);

void ClearExpression(Expression* exp, void* dummy);
void DeleteExpression(Expression* exp);

#endif // #ifndef LUADEC_EXPRESSION_H