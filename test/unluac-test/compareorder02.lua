-- In the case of two constants:
-- comparison order is impossible to reproduce from bytecode
-- this case seems unlikely to occur in production code though
-- perhaps guess by the index of the constants?
-- (that could work if both constants are fresh)
if 1 < 2 then
  print("1 < 2")
end
if 2 > 1 then
  print("2 > 1")
end
