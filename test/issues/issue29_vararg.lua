-- 5.1 main always is_vararg=2
-- 5.2 main always is_vararg=1
local a;

(function()
-- 5.2 don't has arg
	for k,v in ipairs(_G.arg) do
		print(v)
	end
end)()

for k,v in ipairs({...}) do
	print(v)
end

-- 5.2 don't has arg
for k,v in ipairs(arg) do
	print(v)
end

-- is_vararg=0
function f0()
	local x=arg
end

-- 5.1 is_vararg=7
-- 5.2 is_vararg=1
function f1(...)
	local x=arg
end

-- 5.1 is_vararg=3, not use arg, but put arg as param
-- 5.2 is_vararg=1
function f2(...)
	local x=...
end

-- 5.1 is_vararg=3
-- 5.2 is_vararg=1
function f3(...)
	local x=arg
	local y=...
end

-- 5.1 is_vararg=3
-- 5.2 is_vararg=1
function f4(x, ...)
	local x=arg
	local y=...
end
