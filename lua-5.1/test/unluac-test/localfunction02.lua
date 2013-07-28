local factorial = function(n)
  if n == 0 then
    return 1
  else
    return factorial(n - 1) * n
  end
end
print(factorial(10))
