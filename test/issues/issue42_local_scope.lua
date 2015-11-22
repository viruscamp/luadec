
do
	local function x()
		return x
	end
	do
		local function y()
			return y
		end
	end
end

do
	local x = 3
	do
		local y = 4
	end
end

local test

if test then
	local function z() return test,z; end
	-- insert jmp for close
end

if test then
	local function z() return test,z; end
	-- insert jmp for close
else -- this jmp is still here, but will be skipped when excuting
	local function z() return test,z; end
	-- insert jmp for close
end

repeat
	local z = 2
until test and z

repeat
	local function z() return test,z; end
until test and z
-- generate 2 close/jmp for 5.1

repeat
	local function z() return z; end
until false
-- generate 2 close/jmp for 5.1

repeat
	local z = 3
until true -- generate nothing

repeat
	local function z() return z; end
until true
-- generate 2 close/jmp for 5.1

while test do
	local function z() return test,z; end
	-- generate close here
end

while true do
	local function z() return z; end
	-- generate close here
end

-- 3 scopes
-- (for generator), (for state), (for control)
-- i
-- z
for i = 1,4 do
	local function z() return i,z; end
	-- generate 2 close here, the first for z, the second for i
end

-- 3 scopes
-- (for generator), (for state), (for control)
-- k,v
-- z
for k,v in ipairs(gt) do
	local function z() return k,z; end
	-- generate 2 close here, the first for z, the second for i
end

return 3