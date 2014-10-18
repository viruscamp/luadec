local a,b,c;
while 1 do 
	if(a) then 
		b=3 
	else 
		--b=4
		break;
	end 
	b=b+3
end

-- 0 [-]: TEST      R0 0         ; if R0 then PC := 2 else PC := 6
-- 1 [-]: JMP       6            ; PC := 6
-- 2 [-]: LOADK     R1 K0        ; R1 := 3
-- 3 [-]: JMP       0            ; PC := 0
-- 4 [-]: JMP       6            ; PC := 6
-- 5 [-]: JMP       0            ; PC := 0
-- 6 [-]: RETURN    R0 1         ; return
