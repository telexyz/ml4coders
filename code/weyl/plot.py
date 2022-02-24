from matplotlib import pyplot as plt
from equations import *
from constants import *
from data import X
from neural_network import *

def I_plot(I, F):
    plt.subplots()
    plt.plot(X, I, label="Integration_NN", color="r", ls="--", lw=3)
    plt.plot(X, F, label="Right EQ")
    plt.legend()
    plt.savefig("results/IntegrationPlot.png", dpi=1000)
    print("Integration plot has been saved")
    plt.show()

def NN_plot(Y, Z):
    fig, ax = plt.subplots()
    ax.set_xlabel="x"
    ax.set_ylabel="y(x)"
    ax.plot(X, Z, label="Correct function", marker="*", markersize=12)
    ax.scatter(X, Y, label="Neural nerwork", s=120, facecolors='none', edgecolors='r')
    #plt.xticks(X)
    ax.legend()
    plt.savefig("results/NNSolution.png", dpi=1000)
    print("Neural network plot has been saved")
    plt.show()

def Err_plot(Y, Z):
    Y = array(Y)
    Z = array(Z)
    pred_err = list(map(abs, Y-Z))
    fig2, ax2 = plt.subplots()
    ax2.set_xlabel="x"
    ax2.scatter(X, pred_err, s=100, **{"marker": "o", "fc": "brown", "linewidths": 2})
    ax2.plot(X, pred_err,label="Error")
    #plt.xticks(X)
    ax2.legend()
    plt.savefig("results/Error.png", dpi=1000)
    print("Error plot has been saved")
    plt.show()