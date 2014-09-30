-- OP_GETTABLE MakeIndex( DOT )
local x = (1+a).f4
x = ({0,1}).a
x = ({2,3,4}+5)[6]

--  OP_SETTABLE MakeIndex( DOT )
;(1+a).f3 = x
--;({0,1}).a = x
;({2,3,4}+5)[6] = x

-- OP_CALL
_a22_2_a()
a()
a.f3()
;(1+a)(s)
;(function(f) print(type(f)) end)(3)

--OP_SELF MakeIndex( SELF )
a:f()
a:f3()
;(2+a):f3()
