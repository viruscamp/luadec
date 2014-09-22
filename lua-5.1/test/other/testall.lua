--is_vararg = 2
--main function is always is_vararg = 2, and can't use arg, arg will be treat as a globol table.
local a,b,n = arg[1],arg[2],arg.n
local c,d = ...
local x = 3

--is_vararg = 0
local function a()
	local x=3
	return x
end

--is_vararg = 3, if ... is used in function
local function b(...)
	local a,b,n = arg[1],arg[2],arg.n
	local c,d = ...
end

--is_vararg = 3
local function c(...)
	local c,d = ...
end

--is_vararg = 7, if ... is not used in function
local function d(...)
	local a,b,n = arg[1],arg[2],arg.n
end

--is_vararg = 7
local function e(...)
	local x=3
	return x
end

local function f(...)
	local x={...}
	return x
end

--table

