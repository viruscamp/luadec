local a,b,c

while 1 do
	while a do
		print(a)
	end
	print(c)
end

--[[
while 1 do
	if a then
		print(a)
		continue
	end
	print(c)
end
--]]

--[[
while a do
	xxx
end

while 1 do
	if a then
		donothing
	else
		break;
	end
	xxx
end
--]]