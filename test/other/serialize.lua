function serialize(t)
	local mark={}
	local assign={}
	
	local function ser_table(tbl,parent)
		mark[tbl]=parent
		local tmp={}
		for k,v in pairs(tbl) do
			local key= type(k)=="number" and "["..k.."]" or k
			if type(v)=="table" then
				local dotkey= parent..(type(k)=="number" and key or "."..key)
				if mark[v] then
					table.insert(assign,dotkey.."="..mark[v])
				else
					table.insert(tmp, key.."="..ser_table(v,dotkey))
				end
			else
				table.insert(tmp, key.."="..v)
			end
		end
		return "{\n"..table.concat(tmp,",").."}\n"
	end
 
	return "do local ret="..ser_table(t,"ret")..table.concat(assign," ").." return ret end"
end

BFQuest={}
loadfile("todo\\data.luac")()
print(serialize(BFQuest))
