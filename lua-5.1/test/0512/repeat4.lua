local function a1()
	local a,b,c
	repeat
		repeat
			print(a)
		until c > 0
		afunc()
	until false
end

local function a2()
	local a,b,c
	repeat
		print(a)
		if c > 0 then
			afunc()
		end
	until false
end


local function a3()
	local a,b,c
	repeat
		repeat
			print(a)
		until c > 0
		afunc()
	until a > 0
end

local function a4()
	local a,b,c
	repeat
		print(a)
		if c > 0 then
			afunc()
		end
	until a > 0
end