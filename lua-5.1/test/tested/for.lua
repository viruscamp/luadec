function f()
	local k,v
	for k,v in pairs(t) do
		local i=v
		i:abc()
	end
	k(v)
end

function g(...)
	local k,v
	for k,v in pairs(t) do
		local i=v
		i:abc()
	end
	k(v)
end
