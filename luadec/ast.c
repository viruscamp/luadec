#include "common.h"

#include <stdlib.h>

#include "ast.h"

extern int debug;

const char* const stmttype[] = {
	"SIMPLE_STMT",
	"FUNCTION_STMT",
	"BLOCK_STMT",
	"WHILE_STMT",
	"REPEAT_STMT",
	"FORLOOP_STMT",
	"TFORLOOP_STMT",
	"IF_STMT",
	"IF_THEN_STMT",
	"IF_ELSE_STMT",
	"JMP_DEST_STMT"
};

void PrintIndent(StringBuffer* buff, int indent) {
	int i = 0;
	for (i = 0; i < indent; i++) {
		StringBuffer_add(buff, "  ");
	}
}

void PrintAstSub(AstStatement* blockstmt, StringBuffer* buff, int indent) {
	List* sub = blockstmt->sub;
	ListItem* walk;
	if (sub == NULL) {
		return;
	}
	walk = sub->head;
	while (walk) {
		PrintAstStatement(cast(AstStatement*, walk), buff, indent);
		blockstmt->sub_print_count ++;
		walk = walk->next;
	}
}

AstStatement* MakeSimpleStatement(char* code) {
	AstStatement* stmt = (AstStatement*)calloc(1, sizeof(AstStatement));
	stmt->type = SIMPLE_STMT;
	stmt->code = code;
	stmt->sub = NULL;
	return stmt;
}

AstStatement* MakeBlockStatement(StatementType type, char* code) {
	AstStatement* stmt = (AstStatement*)calloc(1, sizeof(AstStatement));
	stmt->type = type;
	stmt->code = code;
	stmt->sub = NewList();
	stmt->sub_print_count = 0;
	return stmt;
}

AstStatement* MakeIfStatement(char* test) {
	AstStatement* ifstmt = MakeBlockStatement(IF_STMT, test);
	AddToStatement(ifstmt, MakeBlockStatement(IF_THEN_STMT, NULL));
	AddToStatement(ifstmt, MakeBlockStatement(IF_ELSE_STMT, NULL));
	return ifstmt;
}

void ClearAstStatement(AstStatement* stmt, void* dummy) {
	if (stmt == NULL) {
		return;
	}
	stmt->type = SIMPLE_STMT;
	stmt->line = 0;
	if (stmt->code) {
		free(stmt->code);
		stmt->code = NULL;
	}
	if (stmt->sub) {
		ClearList(stmt->sub, (ListItemFn)ClearAstStatement);
		free(stmt->sub);
		stmt->sub = NULL;
	}
	stmt->sub_print_count = 0;
}

void DeleteAstStatement(AstStatement* stmt) {
	ClearAstStatement(stmt, NULL);
	free(stmt);
}

void PrintSimpleStatement(AstStatement* stmt, StringBuffer* buff, int indent) {
	// not the first statement of the block , and start with '('
	if (stmt->parent->sub_print_count > 0 && stmt->code[0] == '(') {
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, ";\n");
	}
	PrintIndent(buff, indent);
	StringBuffer_addPrintf(buff, "%s\n", stmt->code);
	if (strncmp("--", stmt->code, 2) == 0) {
		stmt->parent->sub_print_count--;
	}
}

void PrintBlockStatement(AstStatement* stmt, StringBuffer* buff, int indent) {
	StringBuffer* startCode = StringBuffer_new(NULL);
	StringBuffer* endCode = StringBuffer_new(NULL);
	switch (stmt->type) {
	case BLOCK_STMT:
		StringBuffer_printf(startCode, "do");
		StringBuffer_printf(endCode, "end");
		break;
	case FUNCTION_STMT:
		StringBuffer_printf(startCode, "function(%s)", stmt->code);
		StringBuffer_printf(endCode, "end");
		break;
	case WHILE_STMT:
		StringBuffer_printf(startCode, "while %s do", stmt->code);
		StringBuffer_printf(endCode, "end");
		break;
	case REPEAT_STMT:
		StringBuffer_printf(startCode, "repeat");
		StringBuffer_printf(endCode, "until %s", stmt->code);
		break;
	case FORLOOP_STMT:
		StringBuffer_printf(startCode, "for %s do", stmt->code);
		StringBuffer_printf(endCode, "end");
		break;
	case TFORLOOP_STMT:
		StringBuffer_printf(startCode, "for %s do", stmt->code);
		StringBuffer_printf(endCode, "end");
		break;
	default:
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "--  DECOMPILER ERROR: unexpected statement %s , should be one of LOOP_STMT\n", stmttype[stmt->type]);
		goto PrintLoopStatement_ERROR_HANDLER;
	}
	PrintIndent(buff, indent);
	StringBuffer_addPrintf(buff, "%s\n", StringBuffer_getRef(startCode));
	PrintAstSub(stmt, buff, indent + 1);
	PrintIndent(buff, indent);
	StringBuffer_addPrintf(buff, "%s\n", StringBuffer_getRef(endCode));
PrintLoopStatement_ERROR_HANDLER:
	StringBuffer_delete(startCode);
	StringBuffer_delete(endCode);
}

void PrintIfStatement(AstStatement* stmt, StringBuffer* buff, int indent, int elseif) {
	AstStatement* thenstmt = cast(AstStatement*, stmt->sub->head);
	List* thensub = thenstmt->sub;
	AstStatement* elsestmt = cast(AstStatement*, stmt->sub->tail);
	List* elsesub = elsestmt->sub;
	int elsesize = elsesub->size;
	AstStatement* elsefirst = cast(AstStatement*, elsesub->head);
	if (elseif) {
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "elseif %s then\n", stmt->code);
	} else {
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "if %s then\n", stmt->code);
	}
	if (debug) {
		PrintIndent(buff, indent + 1);
		StringBuffer_addPrintf(buff, "-- AstStatement type=IF_THEN_STMT line=%d size=%d\n",
			thenstmt->line, thensub->size);
	}
	PrintAstSub(thenstmt, buff, indent + 1);
	if (elsesize == 0) {
		PrintIndent(buff, indent);
		StringBuffer_add(buff, "end\n");
	} else if (elsesize == 1 && elsefirst->type == IF_STMT) {
		PrintIfStatement(elsefirst, buff, indent, 1);
	} else {
		PrintIndent(buff, indent);
		StringBuffer_add(buff, "else\n");
		if (debug) {
			PrintIndent(buff, indent + 1);
			StringBuffer_addPrintf(buff, "-- AstStatement type=IF_ELSE_STMT line=%d size=%d\n",
				elsestmt->line, elsesize);
		}
		PrintAstSub(elsestmt, buff, indent + 1);
		PrintIndent(buff, indent);
		StringBuffer_add(buff, "end\n");
	}
}

void PrintJmpDestStatement(AstStatement* stmt, StringBuffer* buff, int indent) {
	if (debug) {
		ListItem* jmpitem = NULL;
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "-- JMP destination in line %d, jump from line", stmt->line);
		jmpitem = stmt->sub->head;
		while (jmpitem) {
			AstStatement* jmpstmt = cast(AstStatement*, jmpitem);
			StringBuffer_addPrintf(buff, " %d", jmpstmt->line);
			jmpitem = jmpitem->next;
		}
		StringBuffer_add(buff, "\n");
	}
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
	if (stmt->code != NULL) {
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "::pc_%d::\n", stmt->line);
	}
#endif
}

void PrintAstStatement(AstStatement* stmt, StringBuffer* buff, int indent) {
	switch (stmt->type) {
	case SIMPLE_STMT:
		PrintSimpleStatement(stmt, buff, indent);
		break;
	case BLOCK_STMT:
	case FUNCTION_STMT:
	case WHILE_STMT:
	case REPEAT_STMT:
	case FORLOOP_STMT:
	case TFORLOOP_STMT:
		PrintBlockStatement(stmt, buff, indent);
		break;
	case IF_STMT:
		PrintIfStatement(stmt, buff, indent, 0);
		break;
	case IF_THEN_STMT:
	case IF_ELSE_STMT:
		PrintIndent(buff, indent);
		StringBuffer_addPrintf(buff, "--  DECOMPILER ERROR: unexpected statement %s\n", stmttype[stmt->type]);
		break;
	case JMP_DEST_STMT:
		PrintJmpDestStatement(stmt, buff, indent);
		break;
	}
}

void AddToStatement(AstStatement* stmt, AstStatement* sub) {
	if (stmt && sub) {
		sub->parent = stmt;
		AddToList(stmt->sub, (ListItem*)sub);
	}
}
