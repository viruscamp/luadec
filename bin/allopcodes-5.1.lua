-- allopcodes-5.1.lua
local u1,u2,u3
function f1(a1,a2,...)
	local l0 = a1; -- move
	local l1 = 1 -- loadk
	local l2 = true -- loadbool
	local l3 = nil -- loadnil
	local l4 = u1[g1] -- gettupval, getglobal, gettable
	g1 = l1 -- setglobal
	u2 = l2 -- setupval
	l3[l2] = l1 -- settable
	local l5 = { -- newtable
		l1, l2; -- move, setlist
		x = l2 -- settable
	}
	local l6 = l5:x() -- self, call
	local l7 = -((l0+l1-l2)*l3/l4%l5)^l6 -- add, sub, mul, div, mod, pow, unm
	local l8 = #(not l7) -- not, len
	local l9 = l7..l8 -- concat
	if l1==l2 and l2<l3 or l3<=l4 then -- eq, lt, le, jmp
		for i = 1, 10, 2 do -- forprep
			l0 = l0 and l2 -- test
		end -- forloop
	else -- jmp
		for k,v in ipairs(l5) do
			l4 = l5 or l6 -- testset
		end -- tforloop
	end
	do
		local l21, l22 = ... -- vararg
		local function f2() -- closure
			return l21, l22
		end
		f2(k,v) -- call
	end --close
	return f1() -- return, tailcall
end
