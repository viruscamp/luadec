local a=true
local b="a"
local c= b and 0 or 3
local d= (b and a) or ((not c) and ( a or not b))
--print(b)
