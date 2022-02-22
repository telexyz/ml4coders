// Tuộc Net :D

const std = @import("std");
const Matrix = @import("matrix");

const Activation = enum { LINEAR, LOGISTIC, RELU, LRELU, SOFTMAX };

const Layer = struct {
    in: Matrix = undefined, // Saved input to a layer
    w: Matrix = undefined, // Current weights for a layer
    dw: Matrix = undefined, // Current weight updates
    v: Matrix = undefined, // Past weight updates (for use with momentum)
    out: Matrix = undefined, // Saved output from the layer
    activation: Activation = undefined, // Activation the layer uses
};

// typedef struct{
//     matrix X;
//     matrix y;
// } data;

// typedef struct {
//     layer *layers;
//     int n;
// } model;

// Run an activation function on each element in a matrix,
// modifies the matrix in place
fn activateMatrix(m: Matrix, a: Activation) void {
    var i: usize = 0;
    while (i < m.rows) : (i += 1) {
        var sum: f32 = 0;
        var j: usize = 0;
        while (j < m.cols) : (j += 1) {
            // var x: f32 = m.get(i, j);
            switch (a) {
                .LOGISTIC => {
                    //
                },
                .RELU => {
                    //
                },
                .LRELU => {
                    //
                },
                .SOFTMAX => {
                    //
                },
                else => {},
            }
            sum += m.get(i, j);
        }
        if (a == .SOFTMAX) {
            // TODO: have to normalize by sum if we are using SOFTMAX
        }
    }
}

// Calculates the gradient of an activation function and multiplies it into
// the delta for a layer
fn gradientMatrix(m: Matrix, a: Activation, d: Matrix) void {
    _ = a;
    _ = d;
    var i: usize = 0;
    while (i < m.rows) : (i += 1) {
        var j: usize = 0;
        while (j < m.cols) : (j += 1) {
            // var x = m.get(i, j);
            // TODO: multiply the correct element of d by the gradient
        }
    }
}

// Forward propagate information through a layer
fn forwardLayer(l: *Layer, in: Matrix) Matrix {
    l.in = in; // Save the input for backpropagation
    // TODO: fix this! multiply input by weights and apply activation function.
    return l.out;
}
