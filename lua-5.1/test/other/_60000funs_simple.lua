--[[
local f = function(self)
	local a,b,c --1
	--local a,b=1,c --1
	--local a=1,b,c --1
	--local a=1,b=1,c --0
	--local d = (a == c and b) --1
	return (a == c and b) --1
end
--]]

local a,b,c --1
--local a,b=1,c --1
--local a=1,b,c --1
--local a=1,b=1,c --0
local d = (a == c and b) --1

