from numpy import *
import scipy.integrate as integrate
#Define equations of the examples in the project file

NUMBER = 2 # No. of examples in project

#Right-side equation
def right_eq(x):
    # eq = sin(x-pi/4)
    # eq = 2*sin(x+pi/4)
    # eq = sin(2*x-pi/4)/sqrt(2)
    #eq = sin(x-pi/4)+1
    eq = sin(x + pi/32) #- 2*x
    return eq

#Analytical solution
def analytic(x):
    # eq = sin(x)+0.782767418
    # eq = 2*cos(x)
    # eq = sin(2*x)
    #eq = sin(x)
    eq = cos(x)
    return eq
