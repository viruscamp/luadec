function a()
	local a,b,c
	repeat
		a = 3
	until b and f()
end

function b()
	local a,b,c
	repeat
		repeat
			a = 3
		until b
	until f()
end