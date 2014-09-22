local b,c,f

--error
if f(b)==3 then
	c = 4
elseif f(b)==4 then
	c = 5
else
	c = 6
end

--ok
if b==3 then
	c = 4
elseif b==4 then
	c = 5
else
	c = 6
end