if T==nil then
  (Message or print)('\a\n >>> testC not active: skipping API tests <<<\n\a')
  return
end

-----------

do
  local map = {}
  local t = {__eq = function (a,b) return map[a] == map[b] end}
  local function f(x)
    local u = T.newuserdata(0)
    debug.setmetatable(u, t)
    map[u] = x
    return u
  end
  assert(f(10) == f(10))
  assert(f(10) ~= f(11))
  assert(T.testC("equal 2 3; return 1", f(10), f(10)))
  assert(not T.testC("equal 2 3; return 1", f(10), f(20)))
  t.__eq = nil
  assert(f(10) ~= f(10))
end

--------------

if not a and not string.find(b, "memory") then   -- `real' error?
  T.totalmem(1000000000)  -- restore high limit
  error(b, 0)
end

--------------

testamem("dump/undump", function ()
  local a = loadstring(testprog)
  local b = a and string.dump(a)
  a = b and loadstring(b)
  return a and a()
end)

----------------

if not trylocale("collate")  then
  print("locale not supported")
else
  assert("alo" < "o" and "o" < "amo")
end

-----------------

local f = function(x,y)
	return nil
end