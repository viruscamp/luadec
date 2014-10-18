local a,b,c,d,e,f,g
local w,x,y,z

--w = c or a == b --0

--x = a == b and c --0

y = a > b or c --2
--[[
z = a < b and c and d --2

w = a == b and c and d and e --2

x = a == b and c and d or e --0
--]]
