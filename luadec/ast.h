#ifndef LUADEC_AST_H
#define LUADEC_AST_H

// Abstract syntax tree

#include "StringBuffer.h"
#include "structs.h"

typedef enum StatementType_ StatementType;
enum StatementType_ {
	SIMPLE_STMT,
	FUNCTION_STMT,
	BLOCK_STMT,
	WHILE_STMT,
	REPEAT_STMT,
	FORLOOP_STMT,
	TFORLOOP_STMT,
	IF_STMT,
	IF_THEN_STMT,
	IF_ELSE_STMT,
	JMP_DEST_STMT // virtual statement, mark for JMP destination, some of the statements will be printed as label in 5.2
};

const char* const stmttype[];

typedef struct AstStatement_ AstStatement;
struct AstStatement_ {
	ListItem super;
	AstStatement* parent;
	StatementType type;
	char* code;
	List* sub;
	int line;
	int sub_print_count;
};

AstStatement* MakeSimpleStatement(char* code);
AstStatement* MakeBlockStatement(StatementType type, char* code);
AstStatement* MakeIfStatement(char* test);

#define ThenStmt(ifstmt) cast(AstStatement*, (ifstmt)->sub->head)
#define ElseStmt(ifstmt) cast(AstStatement*, (ifstmt)->sub->tail)
#define ThenStart(ifstmt) (cast(AstStatement*, (ifstmt)->sub->head)->line)
#define ElseStart(ifstmt) (cast(AstStatement*, (ifstmt)->sub->tail)->line)

void ClearAstStatement(AstStatement* stmt, void* dummy);
void DeleteAstStatement(AstStatement* stmt);

void PrintIndent(StringBuffer* buff, int indent);
void PrintAstStatement(AstStatement* stmt, StringBuffer* buff, int indent);
void PrintAstSub(AstStatement* blockstmt, StringBuffer* buff, int indent);

void AddToStatement(AstStatement* stmt, AstStatement* sub);

#endif // #ifndef LUADEC_AST_H
