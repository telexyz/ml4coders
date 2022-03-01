import pandas as pd
from numpy import *
from data import X
def createTable(Y, Z):
    table = transpose(array([X, Z, Y, list(map(abs, array(Y)-array(Z)))]))
    headers = ["X", "Analytical", "ANN", "Error"]
    dataFrame = pd.DataFrame(table, columns=headers, dtype=float64)
    dataFrame.to_excel("output.xlsx")
    print("Xlsx file has been saved")