local a
a=234
local function b()
	local print = print
	print(a)
	if not a then
		a=1
	else
		a=a+1
	end
	print(a)
end

return b