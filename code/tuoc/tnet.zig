// Tuộc Net :D

const std = @import("std");
const Matrix = @import("matrix");

const Activation = enum { LINEAR, LOGISTIC, RELU, LRELU, SOFTMAX };

// Run an activation function on each element in a matrix,
// modifies the matrix in place
// matrix m: Input to activation function
// Activation a: function to run
fn activateMatrix(m: Matrix, a: Activation) void {
    var i: usize = 0;
    while (i < m.rows) : (i += 1) {
        var sum: f32 = 0;
        var j: usize = 0;
        while (j < m.cols) : (j += 1) {
            var x: f32 = m.get(i, j);
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
        if (a == SOFTMAX) {
            // TODO: have to normalize by sum if we are using SOFTMAX
        }
    }
}
