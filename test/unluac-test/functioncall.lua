local a, b, c
a = f(1, 2, 3)
a = f(x, y, z)
a, b = f(1, 2, 3)
a, b, c = 1, f(1, 2, 3)
a, b, c = f(1, 2, 3), 1, 2
a = f(g())
