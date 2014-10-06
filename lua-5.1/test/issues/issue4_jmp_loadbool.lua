-- or操作符， 不能用 if 表示， 需要中间变量
function debug_or()
  local f,a,b
  fg = ((not a) or b)
  -- if (a) then x = b else x = true end; fg = x
end

-- or操作符, 两个判断都跳到 loadbool true（连续loadbool的后句）
function debug_or2()
  local f,a,b,x,y
  fg = ((not a) or x<y or b)
end

-- and操作符，不能用 if 表示， 需要中间变量
function debug_and_call()
  local f,a,b,c
  fg = ((a<b) and c)
  -- if (a<b) then x = c else x = false end; fg = x
end

-- and操作符，可以用 if 表示，已反编译成 if，与原先比少一条 loadbool
function debug_and_set()
  local f,a,b,c
  f = ((a<b) and c)
  -- if (a<b) then f = c else f = false end;
end

-- 混合 or and ，连续 loadbool 的 false true 都有使用
function debug_or_and()
  local f,a,b,x,y
  fg=(not a) or x<y and d==e and x
end
