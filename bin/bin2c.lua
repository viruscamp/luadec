local ipairs = ipairs
local string_byte = string.byte
local string_format = string.format
local table_concat = table.concat

local filename, varname = ...

local f = assert(io.open(filename, "rb"))

print("unsigned char "..varname.."[] = {")

local len = 0
local fline = f:read(16)
while fline do
	local fline_len = #fline
	len = len + fline_len
	local t = { string_byte(fline, 1, fline_len) }
	for k, v in ipairs(t) do
		t[k] = string_format("0x%02x", v)
	end
	fline = f:read(16)
	if fline then
		print("    "..table_concat(t, ", ")..",")
	else
		print("    "..table_concat(t, ", ").."")
	end
end

print("};")
print(string_format("unsigned int %s_len = %d;", varname, len))

f:close()
