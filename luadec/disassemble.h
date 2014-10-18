#ifndef LUADEC_DISASSEMBLE_H
#define LUADEC_DISASSEMBLE_H

#include "lua.h"
#include "lobject.h"

void luadec_disassemble(Proto* fwork, int dflag, const char* name);

void luadec_disassembleSubFunction(Proto* f, int dflag, const char* funcnumstr);

#endif // #ifndef LUADEC_DISASSEMBLE_H
