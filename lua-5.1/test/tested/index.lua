local a="dfs"..a.."das"
local b={["dfs"..a.."das"]=3}
print(b["dfs"..a.."das"])
b["dfs"..a.."das"]=4

local a="dfs"
local b={["dfs"]=3}
print(b["dfs"])
b["dfs"]=4
b:dfs()