-- allopcodes-5.3.lua
-- loadkx extraarg lacks
local u1,u2,u3
function f1(a1,a2,...)
	local l0 = a1; -- move
	local l1 = 1 -- loadk
	local l2 = true -- loadbool
	local l3 = nil -- loadnil
	local l4 = u1[l3] -- gettabup
	u1[l3] = l4 -- settabup
	l1 = g1 -- gettabup l1 = _ENV["g1"]
	g1 = l1 -- settabup _ENV["g1"] = l1
	l2 = u2 -- getupval
	u2 = l2 -- setupval
	l1 = l3[l2] -- gettable
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
	local l23 = (l8 // l4) & (~l3) | (l5 << l2) ~ (l6 >> l1) -- idiv band bor bxor shl shr bnot
	local l24 = 22136 -- numint 0x5678
	local l25 = 370.5 -- numflt
	local l26 = "".."abc" -- shrstr
	local l27 = [[
	12345678901234567890123456789012345678901234567890
	12345678901234567890123456789012345678901234567890
	12345678901234567890123456789012345678901234567890
	12345678901234567890123456789012345678901234567890
	12345678901234567890123456789012345678901234567890
	12345678901234567890123456789012345678901234567890
	]]-- lngstr >=255
	return f1() -- return, tailcall
end
