#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "lopcodes.h"

#include "lua-compat.h"
#include "structs.h"
#include "StringBuffer.h"

#include "expression.h"

Expression* MakeExpression(ExpressionType type, int reg, int pc, int idx, OpCode op) {
	Expression* exp = calloc(1, sizeof(Expression));
	exp->type = type;
	exp->reg = reg;
	exp->pc = pc;
	exp->idx = idx;
	exp->op = op;
	exp->left = NULL;
	exp->right = NULL;
	exp->args = NULL;
	return exp;
}

Expression* MakeConstValExpression(int reg, int pc, int idx, OpCode op) {
	Expression* exp = MakeExpression(CONST_VAL, reg, pc, idx, op);
	return exp;
}

Expression* MakeLocalVarExpression(int reg, int pc, int idx) {
	Expression* exp = MakeExpression(LOCAL_VAR, reg, pc, idx, -1);
	return exp;
}

Expression* MakeGlobalVarExpression(int reg, int pc, int idx, OpCode op) {
	Expression* exp = MakeExpression(GLOBAL_VAR, reg, pc, idx, op);
	return exp;
}

Expression* MakeUpvalVarExpression(int reg, int pc, int idx, OpCode op) {
	Expression* exp = MakeExpression(UPVAL_VAR, reg, pc, idx, op);
	return exp;
}

Expression* MakeVarargVarExpression(int reg, int pc) {
	Expression* exp = MakeExpression(VARARG_VAR, reg, pc, -1, OP_VARARG);
	return exp;
}

Expression* MakeFuncDefExpression(int reg, int pc, int idx) {
	Expression* exp = MakeExpression(FUNC_DEF, reg, pc, idx, OP_CLOSURE);
	return exp;
}

Expression* MakeTableDefExpression(int reg, int pc) {
	Expression* exp = MakeExpression(TABLE_DEF, reg, pc, -1, OP_NEWTABLE);
	return exp;
}

Expression* MakeTableRefExpression(int reg, int pc, int idx, OpCode op) {
	Expression* exp = MakeExpression(TABLE_REF, reg, pc, idx, op);
	return exp;
}

Expression* MakeFuncCallExpression(int reg, int pc, OpCode op, Expression* func) {
	Expression* exp = MakeExpression(FUNC_CALL, reg, pc, -1, op);
	exp->left = func;
	exp->args = NewList();
	return exp;
}

Expression* MakeUnaryExpression(int reg, int pc, OpCode op, Expression* sub) {
	Expression* exp = MakeExpression(UNARY_EXP, reg, pc, -1, op);
	exp->left = sub;
	return exp;
}

Expression* MakeBinaryExpression(int reg, int pc, OpCode op, Expression* left, Expression* right) {
	Expression* exp = MakeExpression(BINARY_EXP, reg, pc, -1, op);
	exp->left = left;
	exp->right = right;
	return exp;
}

void PrintExpression(Expression* exp, StringBuffer* buff, int indent) {
}

void ClearExpression(Expression* exp, void* dummy) {
	Expression* left = exp->left;
	Expression* right = exp->right;
	List* args = exp->args;
	exp->left = NULL;
	exp->right = NULL;
	exp->args = NULL;
	if (left) {
		DeleteExpression(left);
	}
	if (right) {
		DeleteExpression(right);
	}
	if (args) {
		ClearList(args, (ListItemFn)ClearExpression);
		free(args);
	}
}

void DeleteExpression(Expression* exp) {
	ClearExpression(exp, NULL);
	free(exp);
}
