from numpy import *
from constants import *
from data import X, W0
from equations import *

def NN(W, x):
    b1 = W[0:12]
    w1 = W[12:24]
    w2 = W[24:36]
    z1 = []

    for i in range (0, 12):
        temp = x * w1[i] + b1[i]
        z1.append(sin(temp))

    a2 = 0
    for i in range(0, 12):
        a2 += z1[i] * w2[i]

    N = purelin(a2)
    return N


def error(W):
    sum = 0
    for x in X:
        part = (integration(x, lambda t: NN(W, t)) - right_eq(x))**2
        sum += part
    return sum / len(X)
