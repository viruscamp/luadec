local function a1()
	local a,b,c
	while 1 do
		repeat
			print(a)
		until c > 0
		do break end
	end
end

local function a2()
	local a,b,c
	while 1 do
		print(a)
		if c > 0 then
			break
		end
	end
end

local function a3()
	local a,b,c
	repeat
		print(a)
	until c > 0
end