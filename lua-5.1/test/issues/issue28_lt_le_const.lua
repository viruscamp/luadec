function lt_const(a,b,c)
	b = a>3
	b = 3<a
	b = not (a<=3)
	b = not (3>=a)
end

function lt_if(a,b,c)
	if a>3 then
		b()
	end
	if not (a<=3) then
		c()
	end
end

function eq_const(a,b,c)
	b = a==3
	b = 3==a
end
