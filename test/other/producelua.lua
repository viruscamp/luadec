local out = 'local dummy'
local i,j
for i = string.byte('a'),string.byte('a')+21 do
	for j = 0,8 do
		out = out..' ,'..string.char(i)..j
	end
end
print(out)

out = 'dummy = {"pre"'
for j = 0,100 do
	out = out..' ,'..j
end
out = out..'}'
print(out)
