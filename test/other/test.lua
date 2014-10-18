local chunk = loadfile("f.lua")

if chunk then
	local b=chunk()
	local out = assert(io.open(arg[1], "wb"))
	local cb=string.dump(b)
	out:write(cb)
	out:close()
	b()
	local fb=loadstring(cb)
	fb()
	fb()
	b()
	fb()
end
