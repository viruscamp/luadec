--  OP_SETTABLE MakeIndex( DOT )
-- DECOMPILER ERROR: Confused about usage of registers!
(1+a).f3 = x
-- DECOMPILER ERROR: Confused about usage of registers!
;({2,3,4}+5)[6] =x
-- DECOMPILER ERROR: Overwrote pending register.
;({0,1}).a = x
local y =4 -- need to output last statement with error
-- local y = {0, 1; a = x}
