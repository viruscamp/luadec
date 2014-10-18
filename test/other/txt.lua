S=[[]]
T={}
C=coroutine.create(function() end)
print(type(S),type(T),type(C))
print(S<C) -- error message is wrong
print(S<T)
print(T<T)

