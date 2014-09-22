local i, cBits, cPos = 0, 0, 1
--local i, cBits, cPos
while i < 30 do
	while cBits < 8 do
		cPos = cPos + 1
	end
	while cBits >= 8 do
		i = i + 1
	end
end
return v
