import scipy.integrate as integrate
from equations import *
from simpson import simpson
from numpy import *
import numpy as np

# Define constants that are used in project
# Neural network configuration paramaters
HIDDEN_NODES = 12
ALPHA = 15/16
LAYERS = 3

# Tan-sigmoid function
def tansig(x):
  x = (x)
  eq = longfloat(2/(1+e**(-2*(x)))-1)
  return eq

def sin(x):
  return sin(x)

# Linear function
def purelin(x):
    return x

# Leaky RELU
def lRelu(x):
  if x<0:
    return x/10
  else:
    return x

def integration(x, Phi):
  sum = 0
  for k in range(1, 30):
    sum += simpson(lambda t: Phi(x-t)*np.cos(k*t-(pi*ALPHA)/2,)/k**ALPHA, 0, 2*pi, 351)
  return sum/pi #+ simpson(lambda t: (x*t)*Phi(t), 0, pi, 101)
