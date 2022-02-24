from numpy import savetxt
from  scipy.optimize import fmin_bfgs
from neural_network import error
from equations import NUMBER

MIN_ERR = 1e-09

def log(xk):
    print(f"Current error value: {error(xk)}")    


def min_weight(W0):
    result = fmin_bfgs(error, W0, gtol=MIN_ERR, 
        callback = lambda xk: print(f"Current error value: {error(xk)}") )

    savetxt(f"../weights{NUMBER}.txt", result, delimiter=",")

    print(f"Save weight{NUMBER} successfully!")

    return result