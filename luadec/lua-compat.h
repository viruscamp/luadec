// should be included after lua*.h
#ifndef LUADEC_LUA_COMPAT_H
#define LUADEC_LUA_COMPAT_H

#if LUA_VERSION_NUM == 501
	#define NUPS(f) (f->nups)
	#define UPVAL_NAME(f, r) (f->upvalues[r])
	#define luadec_newupvalues(L, n) luaM_newvector(L, n, TString*)
	#define luadec_freearray(L, b, n, t) luaM_freearray(L, b, n, t)
#endif
#if LUA_VERSION_NUM == 502
	#define lua_open()	luaL_newstate()
	#define NUPS(f) (f->sizeupvalues)
	#define UPVAL_NAME(f, r) (f->upvalues[r].name)
	#define luadec_newupvalues(L, n) luaM_newvector(L, n, Upvaldesc)
	#define luadec_freearray(L, b, n, t) luaM_freearray(L, b, n)
#endif

// should be removed
#if LUA_VERSION_NUM == 502
	#define OP_GETGLOBAL OP_GETTABUP
	#define OP_SETGLOBAL OP_SETTABUP
	#define OP_CLOSE -1
#endif

#endif // #ifndef LUADEC_LUA_COMPAT_H
