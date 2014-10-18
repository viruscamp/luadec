function f1()
	local a,f
	while a do
		f()
	end
--[[
    0 [-]: TEST      R0 0         ; if R0 then PC := 2 else PC := 5
    1 [-]: JMP       5            ; PC := 5
    2 [-]: MOVE      R2 R1        ; R2 := R1
    3 [-]: CALL      R2 1 1       ; R2()
    4 [-]: JMP       0            ; PC := 0
    5 [-]: RETURN    R0 1         ; return
--]]
end

function f2()
	local a,f
	while 1 do
		if a then
		else
			break
		end
		f()
	end
--[[
4--> 3 
8--> 7
    0 [-]: TEST      R0 0         ; if R0 then PC := 2 else PC := 7
    1 [-]: JMP       7            ; PC := 7
    2 [-]: JMP       4            ; PC := 4
    3 [-]: JMP       7            ; PC := 7
    4 [-]: MOVE      R2 R1        ; R2 := R1
    5 [-]: CALL      R2 1 1       ; R2()
    6 [-]: JMP       0            ; PC := 0
    7 [-]: RETURN    R0 1         ; return
--]]
end

function f3()
	local a,f
	while 1 do
		if a then
			f()
		else
			break
		end
	end
--[[
    0 [-]: TEST      R0 0         ; if R0 then PC := 2 else PC := 7
    1 [-]: JMP       7            ; PC := 7
    2 [-]: MOVE      R2 R1        ; R2 := R1
    3 [-]: CALL      R2 1 1       ; R2()
    4 [-]: JMP       0            ; PC := 0
    5 [-]: JMP       7            ; PC := 7
    6 [-]: JMP       0            ; PC := 0
    7 [-]: RETURN    R0 1         ; return
--]]
end

function f4()
	local a,b,c,d,e,f,g
	while a do
		g()
		if b then
			f()
		end
	end
end