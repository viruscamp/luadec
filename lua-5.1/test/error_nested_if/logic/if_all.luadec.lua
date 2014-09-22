-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: logic\if_all.lua 

 -- DECOMPILER ERROR: Confused at declaration of local variable

local , a, b, c, p1, p2, p3, p4 = 

if a then
  p1()
end

if a and b then
  p1()
end

if a then
  if b then
    p1()
  else
    p2()
  end
end

if a and b then
  p1()
  do return end
  if c then
    p3()
  end
end

if a then
  p1()
elseif c then
  p3()
end

if a and b then
  p1()
  do return end
  p3()
end

if a then
  p1()
else
  p3()
end

if a then
  if b then
    p1()
  else
    p2()
  end
elseif c then
  p3()
end

if a then
  if b then
    p1()
  else
    p2()
  end
else
  p3()
end

if a and b then
  p1()
  do return end
  if c then
    p3()
  else
    p4()
  end
end

if a then
  p1()
elseif c then
  p3()
else
  p4()
end

if a then
  if b then
    p1()
  else
    p2()
  end
elseif c then
  p3()
else
  p4()
end

