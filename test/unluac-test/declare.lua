local a, b, c
a = 1
b = 2
local d
d = 3
f()
summon = function(bid, count)
  if type(bid) == "string" then
    bid = beings[bid].nid
  end
  local last_being
  for i = 1, count or 1 do
    last_being = Level.drop_being(bid, Level.empty_coord())
  end
  return last_being
end
f()
--a, b = a and b, a or b
f()

--[[while a < c do
  if(a == b) then
    a = c
  else
    break
  end
end]] --TODO

--[[while a < c do
  if a==b then
    c = 3
    if c == b then
      d = 6
    end
  end
end]] --FIXED!

--[[if a==b then
  if c==d then
    a = 4
    if a == c then
      a, b = 2, 3
    end
  end
else
  c = 6
end]] --FIXED!

--[[while a == b do
  if c == d then
    c = 6
  end
  break
end]] --OKAY because compiles as
--[[while a == b and c == d do
      c = 6
      break
    end]]

a, b, c, d = b, c, d, a
return f()