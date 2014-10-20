// should be included after lua*.h
#ifndef LUADEC_LUA_COMPAT_H
#define LUADEC_LUA_COMPAT_H

#include "lua.h"

#if LUA_VERSION_NUM == 501
	#define luadec_freearray(L, b, n, t) luaM_freearray(L, b, n, t)

	#define UPVAL_TYPE TString*
	#define NUPS(f) (f->nups)
	#define UPVAL_NAME(f, r) (f->upvalues[r])

#define LUADEC_TFORLOOP OP_TFORLOOP
#endif
#if LUA_VERSION_NUM == 502
	#define lua_open()	luaL_newstate()
	#define luadec_freearray(L, b, n, t) luaM_freearray(L, b, n)

	#define UPVAL_TYPE Upvaldesc
	#define NUPS(f) (f->sizeupvalues)
	#define UPVAL_NAME(f, r) (f->upvalues[r].name)
#define LUADEC_TFORLOOP OP_TFORCALL
#endif

#endif // #ifndef LUADEC_LUA_COMPAT_H
