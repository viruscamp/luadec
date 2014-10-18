local a, b
if a then
  print(a)
end
if a == b then
  local c = a + b
  print(c ^ 2)
end
if a and b and x and y then
  print(a + x, b + y)
end
if a or b or x or y then
  print(a * x, b * y)
end
if (a or b) and (x or y) then
  print(a * x, b - y)
end
