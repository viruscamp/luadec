local function formatmem (m)
  if m < 1024 then
	return m
  else
    m = m/1024 - m/1024%1
    if m < 1024 then
		return m.."K"
    else
      m = m/1024 - m/1024%1
      return m.."M"
    end
  end
end

