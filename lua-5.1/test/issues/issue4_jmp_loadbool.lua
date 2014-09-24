-- or操作符， 不能用 if 表示， 需要中间变量
function debug_or()
  local f,a,b
  fg = ((not a) or b)
  -- if (a) then x = b else x = true end; fg = x
end

-- and操作符，不能用 if 表示， 需要中间变量
function debug_and_call()
  local f,a,b,c
  fg = ((a<b) and c)
  -- if (a<b) then x = c else x = false end; fg = x
end

-- and操作符，可以用 if 表示，已反编译成 if，正常无视了一条 LOADBOOL
function debug_and_set()
  local f,a,b,c
  f = ((a<b) and c)
  -- if (a<b) then f = c else f = false end;
end
