-- setlist c=0 when top>=25550
-- when top==2^18-1, lua51 cannot compile, but lua52 53 generate code without loadkx
-- loadkx and extraarg when top>=2^18

print("local x={")

local top = arg[1] or 2^18+1
local count = 0
for i = 0, top do
	io.stdout:write(i,",")
	count = count + 1
	if count == 20 then
		io.stdout:write("\n")
		count = 0
	end
end
if count ~= 0 then
	io.stdout:write("\n")
end
print("}")
