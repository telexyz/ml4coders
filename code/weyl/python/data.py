from numpy import *
from constants import *

#Generate array of data
random.seed(10)
LIMITS = (0.1, 1, 10)

X = linspace(LIMITS[0], LIMITS[1], LIMITS[2])
print(f"Examples are using X in range ({LIMITS[0]},{LIMITS[1]}) with {LIMITS[2]} values")

W0 = random.rand((LAYERS)*(HIDDEN_NODES), )
print(f"Initial weights are create with {(LAYERS)*(HIDDEN_NODES)} values")