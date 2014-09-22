--[[
function f1()
	local a,b;
	--ok
	while a and b do
	  f()
	end
	--[1] test       0       0    ; if R0 then to [3]
	--[2] jmp        5            ; to [8]
	--[3] test       1       0    ; if R1 then to [5]
	--[4] jmp        3            ; to [8]
	--[5] getglobal  2   0        ; R2 := f
	--[6] call       2   1   1    ; R2()
	--[7] jmp        -7           ; to [1]
	--[8] return     0   1        ; return
end
--]]

function f2()
	local a,b;
	--error
	while a do
	  if b then
		f()
	  end
	end
	--[1] test       0       0    ; if R0 then to [3]
	--[2] jmp        5            ; to [8]
	--[3] test       1       0    ; if R1 then to [5]
	--[4] jmp        -4           ; to [1]
	--[5] getglobal  2   0        ; R2 := f
	--[6] call       2   1   1    ; R2()
	--[7] jmp        -7           ; to [1]
	--[8] return     0   1        ; return
end

--[[
function f3()
	local a,b;
	--error
	while a do
	  while b do
		f()
	  end
	end
	--[1] test       0       0    ; if R0 then to [3]
	--[2] jmp        6            ; to [9]
	--[3] test       1       0    ; if R1 then to [5]
	--[4] jmp        -4           ; to [1]
	--[5] getglobal  2   0        ; R2 := f
	--[6] call       2   1   1    ; R2()
	--[7] jmp        -5           ; to [3]
	--[8] jmp        -8           ; to [1]
	--[9] return     0   1        ; return
end
--]]