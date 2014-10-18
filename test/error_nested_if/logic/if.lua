local a,b,c
local p1,p2,p3,p4

--1001,error
if a then
	if b then
		p1()
	end
else
	p3()
end

--[[
-- Decompiled using luadec 2.2 GBK R5bf00c7

local a, b, c, p1, p2, p3, p4 = nil
if a and b then
  p1()
end

-- DECOMPILER ERROR: 2 unprocessed JMP targets
--]]
