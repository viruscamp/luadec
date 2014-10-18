local a,b,c,d,e

if a then
 if not b or c then
  e=102
 end
else
 if d then
  e=102
 end
end

--[[
-- Decompiled using luadec 2.2 GBK R5bf00c7

local a, b, c, d, e = nil
if a and (not b or c) then
  e = 102
end

-- DECOMPILER ERROR: 2 unprocessed JMP targets
]]--
