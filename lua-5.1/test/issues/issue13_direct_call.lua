(
function()
	print("abc")
end
)()
;-- must output this
(
function(a)
	print(type(a))
end
)(function()
	print("abe")
end)


-- may not decompile
local a = (function() print(1) end)+1

((function() print(1) end)+(function() print(2) end))()
;
(1+(function() print(1) end)+2)()
;

local b=f;
((function() print(1) end)+(function() print(2) end))()
