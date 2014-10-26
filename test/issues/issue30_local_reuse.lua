for i = 1, 10 do
	local a,b,c,d = i,i+1,i+2;
	print(a);
end
local c=...
local b,a=3,4;
print(a)

for i = 1, 10 do
	local x,y,z
	f[i] = function() x=x+1; print(y); z=i; end
end

do
	local a1 = 0
	print(a1)
end
local b1 = 1

local t = {a,b,c}
