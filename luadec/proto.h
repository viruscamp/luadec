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
#define IS_CONSTANT(r) (ISK(r))
#define opstr(o) ((o)==OP_EQ?"==":(o)==OP_LE?"<=":(o)==OP_LT?"<":(((o)==OP_TEST)||((o)==OP_TESTSET))?NULL:"?") // Lua5.1 specific
#define invopstr(o) ((o)==OP_EQ?"~=":(o)==OP_LE?">":(o)==OP_LT?">=":(((o)==OP_TEST)||((o)==OP_TESTSET))?"not":"?") // Lua5.1 specific
#define IsMain(f) ((f)==glproto)

#define CC(r) (IS_CONSTANT((r)) ? 'K' : 'R')
#define CV(r) (IS_CONSTANT((r)) ? INDEXK(r) : r)
#define MAXCONSTSIZE 1024

extern const char* operators[];

extern const int priorities[];

extern int string_encoding;

int getEncoding(const char* src);

char* DecompileString(const Proto* f, int n);

char* DecompileConstant(const Proto* f, int i);

#endif // #ifndef LUADEC_PROTO_H
