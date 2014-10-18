local a,b,c
local p1,p2,p3,p4

--1010, error
if a then
	if b then
		p1()
	end
else
	if c then
		p3()
	end
end

--1001,error
if a then
	if b then
		p1()
	end
else
	p3()
end

--1011,error
if a then
	if b then
		p1()
	end
else
	if c then
		p3()
	else
		p4()
	end
end