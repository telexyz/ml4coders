# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

def viz(A, B, x, y, title):

    F = lambda x : B * x  + A # Fx = βx + α

    plt.title(rf"Linear Regression (F = $\beta x + \alpha $ = {A:.3f}x + {B:.3f}) for '{title}'")
    plt.axis([min(x), max(x), min(y), max(y)])
    plt.xlabel("X-axis")
    plt.ylabel("Y-axis")
    plt.grid(True)
    plt.plot(x, y, "o")
    plt.plot(x, F(x))
    plt.get_current_fig_manager().full_screen_toggle()
    plt.show()

    return

def LinearRegression(x, y):

    #  Fx = βx + α

    #  Fx = βx                                # suppose α = 0 for simplicity

    #  J  = ∑(F𝗑ᵢ - yᵢ)² = ∑((α + β*xᵢ) - yᵢ)²   # the function J called the cost/lost function

    #  J  = ∑(F𝗑ᵢ - yᵢ)² = ∑(βxᵢ - yᵢ)² = ∑(β²xᵢ² - 2βxᵢyᵢ - y²)

    #  J' = ∑(2βxᵢ² - 2xᵢyᵢ) = ∑2βxᵢ² - ∑2xᵢyᵢ    # derivatives J to find the slope

    # ½J' = ∑βxᵢ² - ∑xᵢyᵢ

    # ½J' = 0 <=> ∑βxᵢ² - ∑xᵢyᵢ = 0             # finding the slope of J

    # β   = ∑xᵢyᵢ ÷ ∑xᵢ²

    # α   = Fxᵢ - βxᵢ (xᵢ & yᵢ here are mean of x & y)

    num = min(np.size(x), np.size(y)) # pairs of data

    mean_x, mean_y = np.mean(x), np.mean(y)

    total_xy = total_xx = 0.

    for i in range(0, num):
        total_xy += (x[i] - mean_x) * (y[i] - mean_y)  # ∑xᵢyᵢ
        total_xx += (x[i] - mean_x) * (x[i] - mean_x)  # ∑xᵢ²

    B = total_xy / total_xx   # β = ∑xᵢyᵢ ÷ ∑xᵢ²
    A = mean_y - B * mean_x   # α = Fxᵢ - βxᵢ (xᵢ & yᵢ here are mean of x & y)

    return (A, B)   # α & β

def main():

    test = "test-1"
    data = np.loadtxt(rf"data\{test}.csv", delimiter=",", skiprows=1)
    x, y = list(data.T)
    A, B = LinearRegression(x, y) # calculate coefficients α & β
    viz(A, B, x, y, test)

    test = "test-2"
    data = np.loadtxt(rf"data\{test}.csv", delimiter=",", skiprows=1)
    x, y = list(data.T)
    A, B = LinearRegression(x, y) # calculate coefficients α & β
    viz(A, B, x, y, test)

    return

if __name__ == "__main__": main()