#ifndef LUADEC_DISASSEMBLE_H
#define LUADEC_DISASSEMBLE_H

#include "lua.h"
#include "lobject.h"

#define CC(r) (ISK((r)) ? 'K' : 'R')
#define CV(r) (ISK((r)) ? INDEXK(r) : r)

#define RK(r) (RegOrConst(f, r))

#define MAXCONSTSIZE 1024

void luadec_disassemble(Proto* fwork, int dflag, const char* name);

void luadec_disassembleSubFunction(Proto* f, int dflag, const char* funcnumstr);

char* RegOrConst(const Proto* f, int r);

#endif // #ifndef LUADEC_DISASSEMBLE_H
