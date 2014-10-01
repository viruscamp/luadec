local a,b,c,f

function ok1()
	local a,b,c,f
	--ok
	if b==1 then
		c = 11
	elseif b==2 then
		c = 12
	else
		c = 13
	end
	print(f)
	if b==4 then
		c = 14
	end
end

function error1()
	local a,b,c,f
	--ok
	if b==1 then
		c = 11
	elseif b==2 then
		c = 12
	else
		c = 13
	end
	--print(f)
	if b==4 then
		c = 14
	end
end
