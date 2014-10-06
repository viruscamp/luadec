-- dummy
function test0()
  return
end

-- test1 test2 是发现问题的地方
function test1()
  local f
  f(not (nil and f(nil)))
end

function test2()
  local f
  f = (not (nil and f(nil)))
end

-- test3 test4 字节码相同，可见有逻辑表达式优化， test4 优化到 test3
function test3()
  local f,a,b
  f = (not (a and b))
end

function test4()
  local f,a,b
  f = ((not a) or (not b))
end

-- test5 不能用 if 表示， 在不引入中间变量的情况下，与 test6 逻辑表达式相同
function test5()
  local f,a,b
  f((not a) or b)
end

-- test6 这是最简形式 ， 多一条无法执行到的LOADBOOL， or操作符 执行后一条 LOADBOOL true 
function test6()
  local f,a,b
  f = (not a) or b
end

-- test7 用 if 表示 test6
function test7()
  local f,a,b
  if (a) then
    f = b
  else
    f = true
  end
end

-- test8 另一种最简形式， 多一条无法执行到的LOADBOOL， or操作符 执行后一条 LOADBOOL true 
function test8()
  local f,a,b,c
  f = a > b or c
end

-- test9 用 if 表示 test8 
function test9()
  local f,a,b,c
  if ( a<=b ) then -- 用 (not a>b) 则不一样
    f = c
  else
    f = true
  end
end

-- testand0 无法用 if，逻辑表达式与 testand3 相同
function testand0()
  local f,a,b,c
  f((a<b) and c)
end

-- testand1 对应的 and 表示， 同样是多一条无法执行到的LOADBOOL，and操作符 执行前一条 LOADBOOL false skip
function testand1()
  local f,a,b,c
  f = (not a) and c
end

-- testand2 用 if 表示 testand1
function testand2()
  local f,a,b,c
  if (not a) then
    f = c
  else
    f = false
  end
end

-- testand3 对应的 and 表示， 同样是多一条无法执行到的LOADBOOL，and操作符 执行前一条 LOADBOOL false skip
function testand3()
  local f,a,b,c
  f = (a<b) and c
end

-- testand4 用 if 表示 testand3
function testand4()
  local f,a,b,c
  if (a<b) then
    f = c
  else
    f = false
  end
end
