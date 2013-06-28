#ifndef DISASSEMBLE_H
#define DISASSEMBLE_H

#include "lua.h"
#include "lobject.h"

void luaU_disassemble(Proto* fwork, int dflag, int functions, char* name);

#endif