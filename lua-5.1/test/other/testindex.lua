local a,b,c,d,e,f

local t={
	a=1,[" a"]=2,["not"]=3,[a]=4,
	f=function(self)
		print(self.a);
	end
}

t.a=5
t[" a"]=6
t["not"]=7
t[a]=8

b=t.a
c=t[" a"]
d=t["not"]
e=t[a]

t:f()
