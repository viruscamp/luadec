-- $Id: sort.lua,v 1.30 2014/12/26 17:20:53 roberto Exp $

print "testing (parts of) table library"

print "testing unpack"

local unpack = table.unpack


local function checkerror (msg, f, ...)
  local s, err = pcall(f, ...)
  assert(not s and string.find(err, msg))
end


checkerror("wrong number of arguments", table.insert, {}, 2, 3, 4)

local x,y,z,a,n
a = {}; lim = _soft and 200 or 2000
for i=1, lim do a[i]=i end
assert(select(lim, unpack(a)) == lim and select('#', unpack(a)) == lim)
x = unpack(a)
assert(x == 1)
x = {unpack(a)}
assert(#x == lim and x[1] == 1 and x[lim] == lim)
x = {unpack(a, lim-2)}
assert(#x == 3 and x[1] == lim-2 and x[3] == lim)
x = {unpack(a, 10, 6)}
assert(next(x) == nil)   -- no elements
x = {unpack(a, 11, 10)}
assert(next(x) == nil)   -- no elements
x,y = unpack(a, 10, 10)
assert(x == 10 and y == nil)
x,y,z = unpack(a, 10, 11)
assert(x == 10 and y == 11 and z == nil)
a,x = unpack{1}
assert(a==1 and x==nil)
a,x = unpack({1,2}, 1, 1)
assert(a==1 and x==nil)

do
  local maxI = math.maxinteger
  local minI = math.mininteger
  local maxi = (1 << 31) - 1          -- maximum value for an int (usually)
  local mini = -(1 << 31)             -- minimum value for an int (usually)
  checkerror("too many results", unpack, {}, 0, maxi)
  checkerror("too many results", unpack, {}, 1, maxi)
  checkerror("too many results", unpack, {}, 0, maxI)
  checkerror("too many results", unpack, {}, 1, maxI)
  checkerror("too many results", unpack, {}, mini, maxi)
  checkerror("too many results", unpack, {}, -maxi, maxi)
  checkerror("too many results", unpack, {}, minI, maxI)
  unpack({}, maxi, 0)
  unpack({}, maxi, 1)
  unpack({}, maxI, minI)
  pcall(unpack, {}, 1, maxi + 1)
  local a, b = unpack({[maxi] = 20}, maxi, maxi)
  assert(a == 20 and b == nil)
  a, b = unpack({[maxi] = 20}, maxi - 1, maxi)
  assert(a == nil and b == 20)
  local t = {[maxI - 1] = 12, [maxI] = 23}
  a, b = unpack(t, maxI - 1, maxI); assert(a == 12 and b == 23)
  a, b = unpack(t, maxI, maxI); assert(a == 23 and b == nil)
  a, b = unpack(t, maxI, maxI - 1); assert(a == nil and b == nil)
  t = {[minI] = 12.3, [minI + 1] = 23.5}
  a, b = unpack(t, minI, minI + 1); assert(a == 12.3 and b == 23.5)
  a, b = unpack(t, minI, minI); assert(a == 12.3 and b == nil)
  a, b = unpack(t, minI + 1, minI); assert(a == nil and b == nil)
end

do   -- length is not an integer
  local t = setmetatable({}, {__len = function () return 'abc' end})
  assert(#t == 'abc')
  checkerror("object length is not an integer", table.insert, t, 1)
end

print "testing pack"

a = table.pack()
assert(a[1] == nil and a.n == 0) 

a = table.pack(table)
assert(a[1] == table and a.n == 1)

a = table.pack(nil, nil, nil, nil)
assert(a[1] == nil and a.n == 4)


-- testing move
do
  local function eqT (a, b)
    for k, v in pairs(a) do assert(b[k] == v) end 
    for k, v in pairs(b) do assert(a[k] == v) end 
  end

  local a = table.move({10,20,30}, 1, 3, 2)  -- move forward
  eqT(a, {10,10,20,30})

  a = table.move({10,20,30}, 2, 3, 1)   -- move backward
  eqT(a, {20,30,30})

  a = table.move({10,20,30}, 1, 3, 1, {})   -- move
  eqT(a, {10,20,30})

  a = table.move({10,20,30}, 1, 0, 3)   -- do not move
  eqT(a, {10,20,30})

  local max = math.maxinteger
  a = table.move({[max - 2] = 1, [max - 1] = 2, [max] = 3},
        max - 2, max, -10, {})
  eqT(a, {[-10] = 1, [-9] = 2, [-8] = 3})

  a = setmetatable({}, {
        __index = function (_,k) return k * 10 end,
        __newindex = error})
  local b = table.move(a, 1, 10, 3, {})
  eqT(a, {})
  eqT(b, {nil,nil,10,20,30,40,50,60,70,80,90,100})

  b = setmetatable({""}, {
        __index = error,
        __newindex = function (t,k,v)
          t[1] = string.format("%s(%d,%d)", t[1], k, v)
      end})
  table.move(a, 10, 13, 3, b)
  assert(b[1] == "(3,100)(4,110)(5,120)(6,130)")
  local stat, msg = pcall(table.move, b, 10, 13, 3, b)
  assert(not stat and msg == b)
end

checkerror("must be positive", table.move, {}, -1, 1, 1)

print"testing sort"


-- test checks for invalid order functions
local function check (t)
  local function f(a, b) assert(a and b); return true end
  checkerror("invalid order function", table.sort, t, f)
end

check{1,2,3,4}
check{1,2,3,4,5}
check{1,2,3,4,5,6}


function check (a, f)
  f = f or function (x,y) return x<y end;
  for n = #a, 2, -1 do
    assert(not f(a[n], a[n-1]))
  end
end

a = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
     "Oct", "Nov", "Dec"}

table.sort(a)
check(a)

function perm (s, n)
  n = n or #s
  if n == 1 then
    local t = {unpack(s)}
    table.sort(t)
    check(t)
  else
    for i = 1, n do
      s[i], s[n] = s[n], s[i]
      perm(s, n - 1)
      s[i], s[n] = s[n], s[i]
    end
  end
end

perm{}
perm{1}
perm{1,2}
perm{1,2,3}
perm{1,2,3,4}
perm{2,2,3,4}
perm{1,2,3,4,5}
perm{1,2,3,3,5}
perm{1,2,3,4,5,6}
perm{2,2,3,3,5,6}

limit = 30000
if _soft then limit = 5000 end

a = {}
for i=1,limit do
  a[i] = math.random()
end

local x = os.clock()
table.sort(a)
print(string.format("Sorting %d elements in %.2f sec.", limit, os.clock()-x))
check(a)

x = os.clock()
table.sort(a)
print(string.format("Re-sorting %d elements in %.2f sec.", limit, os.clock()-x))
check(a)

a = {}
for i=1,limit do
  a[i] = math.random()
end

x = os.clock(); i=0
table.sort(a, function(x,y) i=i+1; return y<x end)
print(string.format("Invert-sorting other %d elements in %.2f sec., with %i comparisons",
      limit, os.clock()-x, i))
check(a, function(x,y) return y<x end)


table.sort{}  -- empty array

for i=1,limit do a[i] = false end
x = os.clock();
table.sort(a, function(x,y) return nil end)
print(string.format("Sorting %d equal elements in %.2f sec.", limit, os.clock()-x))
check(a, function(x,y) return nil end)
for i,v in pairs(a) do assert(not v or i=='n' and v==limit) end

A = {"álo", "\0first :-)", "alo", "then this one", "45", "and a new"}
table.sort(A)
check(A)

table.sort(A, function (x, y)
          load(string.format("A[%q] = ''", x))()
          collectgarbage()
          return x<y
        end)


tt = {__lt = function (a,b) return a.val < b.val end}
a = {}
for i=1,10 do  a[i] = {val=math.random(100)}; setmetatable(a[i], tt); end
table.sort(a)
check(a, tt.__lt)
check(a)

print"OK"
