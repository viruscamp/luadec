

local b
local function a()

	local c = 0
	local function get()
		c=c+1
		return c
	end
	return get
end