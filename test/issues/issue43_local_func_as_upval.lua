do
	local z=function() return 1 end
end

do
	local function z() return 1 end
end

do
	local z=function() return z end
end

do
	local function z() return z end
end
