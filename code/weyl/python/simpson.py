import numpy as np

def simpson(I, a, b, n):
    h = (b - a) / (n - 1)
    x = np.linspace(a, b, n)
    f = []
    for i in x:
        f.append(I(i))
    I_simp = (h/3) * (f[0] + 2*sum(f[:n-2:2]) \
                + 4*sum(f[1:n-1:2]) + f[n-1])
    return I_simp
