--json = (loadfile "jfjson.lua")()
--json = require("sbjson")
--json = require("json")
json = require("dkjson")
socket = require("socket")
socket.http = require("socket.http")

local rname=arg[1];

local jsonfile = io.open("mop/"..rname..".json","r");
local jsonstr = jsonfile:read("*a");
jsonfile:close();

local recipes = json.decode(jsonstr);

function sleep(n)
	if n > 0 then os.execute("ping -n " .. tonumber(n + 1) .. " localhost > NUL") end
end

local success = io.open("mop/"..rname.."/success.txt","w")
local fail = io.open("mop/"..rname.."/fail.txt","w")

for k,v in ipairs(recipes) do

	local sn = math.random(3,10)
	
	sleep(sn)

	local name = v.name
	local itemno = v.id
	print("getting id="..itemno.." name="..name)
	local b, c, h = socket.http.request("http://www.wowhead.com/spell="..itemno)
	
	if b == nil then
		print(" fail")
		fail:write(itemno, name, "\n")
	else	
		local itemfile,msg = io.open("mop/"..rname.."/spell-"..itemno..".html","w")
		itemfile:write(b)
		itemfile:close()
		print(" success")
		success:write(itemno, name, "\n")
	end
end

success:close()
fail:close()