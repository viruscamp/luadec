local a, b, c

function f1()
	print('ddd')
end

function f2(a,b)
	print(a,b)
end

function f3()
	local z=a
	local y=b
	print(z,y)
end


function f4(...)
	print(...)
	local z=a
	local y=b
	return z,y
end

function f5(x,y,...)
	local f6=function()
		print('dfd')
		print('dfds')
	end
	
	local f7=function()
		f6()
	end
	
	local f8=function()
		f6(a,b)
	end
end

