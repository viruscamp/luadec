local function x()
	if a then
	else
		if b then
			c=0
		end
	end
	print(a)
end

--[[
-- Decompiled using luadec 2.2 GBK R5bf00c7

local x = function()
if a then
  do return end
end
if b then
  c = 0
end
print(a)
end
]]--