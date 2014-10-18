local fn=func
local f=fn

local c = ...
local c,d = ...

local c = f()
local c,d = f()

local a={...}
local x={fn()}

local i={1,fn()}
local a={2,...}

local i={fn(),1}
local a={...,2}

local a={1,...,2}
local x={1,fn(),2}

f(f())
f(...)

f(1,f())
f(1,...)

f(f(),1)
f(...,1)

f(1,f(),1)
f(1,...,1)

return ...