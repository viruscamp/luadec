#ifndef LUADEC_PROTO_H
#define LUADEC_PROTO_H

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"

#define ASCII 437
#define GB2312 20936
#define GBK 936
#define GB18030 54936
#define BIG5 950
#define UTF8 65001

#define ENCODINGS "ASCII GB2312 GBK GB18030 BIG5 UTF8"

#define GLOBAL(r) ((char*)svalue(&f->k[r]))
#define opstr(o) ((o)==OP_EQ?"==":(o)==OP_LE?"<=":(o)==OP_LT?"<":(((o)==OP_TEST)||((o)==OP_TESTSET))?NULL:"?") // Lua5.1 specific
#define invopstr(o) ((o)==OP_EQ?"~=":(o)==OP_LE?">":(o)==OP_LT?">=":(((o)==OP_TEST)||((o)==OP_TESTSET))?"not":"?") // Lua5.1 specific
#define IsMain(f) ((f)==glproto)

extern const char* operators[];

extern int priorities[];

extern int string_encoding;

typedef struct Inst_ Inst;
struct Inst_ {
	OpCode op;
	int a;
	int b;
	int c;
	int bx;
	int sbx;
#if LUA_VERSION_NUM == 502 || LUA_VERSION_NUM == 503
	int ax;
#endif
};

Inst extractInstruction(Instruction i);
Instruction assembleInstruction(Inst inst);

void InitOperators();

int getEncoding(const char* src);

char* DecompileString(const TValue* o);

char* DecompileConstant(const Proto* f, int i);

#endif // #ifndef LUADEC_PROTO_H
