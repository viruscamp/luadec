local tb1={
["1"]=2,
[1]=4,
a=6,
[{1}]=8,
["23\n"]="23\n",
['\97lo\10\04923"']=function() end,
}

print(tb1["1"])
print(tb1[1])
print(tb1.a)
print(tb1["23\n"])
