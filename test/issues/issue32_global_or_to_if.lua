function a0 (b)
  c = c or {}
  return b
end

function a1 (b)
  if not c then
    c = {}
  end
  return b
end