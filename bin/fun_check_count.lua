local string_find = string.find

local files, passed, failed, uncompilable = 0, 0, 0, 0

local filename = ...
local f = filename and assert(io.open(filename, "r")) or io.stdin
for line in f:lines() do
	if string_find(line, '^%s*-- function check pass') then
		passed = passed + 1
	elseif string_find(line, '^%s*-- function check fail') then
		failed = failed + 1
		if string_find(line, '^%s*-- function check fail [%d_]+ : cannot compile') then
			uncompilable = uncompilable + 1
		end
	elseif string_find(line, '^%s*-- function check Command line') then
		files = files + 1
	end
end
f:close()

local fmt = "files: %d, functions: %d, passed: %d, failed: %d, uncompilable: %d, pass rate: %.2f%%"
print(fmt:format(files, passed + failed, passed, failed, uncompilable, 100*passed/(passed + failed)))
