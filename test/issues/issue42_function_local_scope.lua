local a,b,c

do
	local x = 3
end

do
	local x
	x = a(b) + c
end

do
	local x = a(b) + c
end

do
	local x
	x = a(b) + c
	function z()
		return x
	end
end

function z(a1,a2)
	local a3
	a3 = 4 + 5
end

function z2(a1,a2)
	local a3 = 3
end

function z3(a1,a2)
	local a3 = 3
	return a3
end

function z4(a1,a2)
	local a3
	do
		local a4
	end
	return a1
end

function z5(a1,a2)
	local a3
	do
		local a4
		a3 = a4
	end
	return a1
end