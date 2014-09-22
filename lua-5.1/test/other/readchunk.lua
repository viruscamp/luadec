local chunk = assert(loadfile(arg[1]))

if chunk then
	local out = assert(io.open(arg[2], "wb"))
	out:write(string.dump(chunk))
	out:close()
end
