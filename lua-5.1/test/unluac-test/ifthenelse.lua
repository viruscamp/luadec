if a then
  f()
else
  g()
end
if b then
  f()
  if a then
    g()
  end
else
  h()
end
if a then
  if b then
    f()
  else
    h()
  end
  g()
end
