local up

local function a()
	up = {2,3,4}
	local x = 3
	local z = function()
		return up, x
	end
	return z
end

local function b()
end