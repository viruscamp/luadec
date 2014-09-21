#ifndef LUADEC_DISASSEMBLE_H
#define LUADEC_DISASSEMBLE_H

#include "lua.h"
#include "lobject.h"

void luaU_disassemble(Proto* fwork, int dflag, int functions, char* name);

#endif // #ifndef LUADEC_DISASSEMBLE_H
