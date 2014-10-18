--local a=true
--local b="a"
--local c= b and 0 or 3
local d= (b and a) or ((not c) and ( a or not b))
--print(b)

--[[
-- Decompiled using luadec 2.2 GBK R5bf00c7

local a = true
local b = "a"
local c = b and 0 or 3
-- DECOMPILER ERROR: unhandled construct in 'MakeBoolean'

-- DECOMPILER ERROR: unhandled construct in 'MakeBoolean'

do
  local d = (not b or not a) and c
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end
--]]