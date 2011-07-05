#ifndef PROTO_H
#define PROTO_H

#ifndef LUA_OPNAMES
#define LUA_OPNAMES
#endif

#include "ldebug.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lundump.h"

char *DecompileString(const Proto * f, int n);

char *DecompileConstant(const Proto * f, int i);

#endif
