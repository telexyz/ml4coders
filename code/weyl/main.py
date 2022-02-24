from numpy import *
from data import *
from neural_network import *
from minimize import min_weight
from plot import * 
from table import *

# Start minimizing with given initial weights
weights = min_weight(W0) # tương đương với weights = loadtxt("weights2.txt", delimiter=",")

# Process neural network with minimized weights
print(f"New neural network has error: {error(weights)}")

Y = []
Z = []

for x in X:
    Y.append(NN(weights, x))
    Z.append(analytic(x))

NN_plot(Y, Z) # Draw neural network plot
Err_plot(Y, Z) # Draw error plot
createTable(Y, Z)

# Check minimize result by plotting
I = []
F = []

for x in X:
  I.append(integration(x, lambda a: NN(weights, a)))
  F.append(right_eq(x))

I_plot(I, F)