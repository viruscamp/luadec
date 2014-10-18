local a,b,c
local p1,p2,p3,p4

-- 0100
if a then
	p1()
end

-- 1000
if a then
	if b then
		p1()
	end
end

--1100
if a then
	if b then
		p1()
	else
		p2()
	end
end

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

--0110
if a then
	p1()
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

--0101
if a then
	p1()
else
	p3()
end

--1110
if a then
	if b then
		p1()
	else
		p2()
	end
else
	if c then
		p3()
	end
end

--1101
if a then
	if b then
		p1()
	else
		p2()
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

--0111
if a then
	p1()
else
	if c then
		p3()
	else
		p4()
	end
end

--1111
if a then
	if b then
		p1()
	else
		p2()
	end
else
	if c then
		p3()
	else
		p4()
	end
end