// Tuộc Net :D

const std = @import("std");
const allocator = std.heap.page_allocator;

const Image = @import("image.zig").Image;
const Matrix = @import("matrix.zig").Matrix;
const Activation = enum { LINEAR, LOGISTIC, RELU, LRELU, SOFTMAX };

const Data = struct {
    X: Matrix = undefined,
    y: Matrix = undefined,
};

const Model = struct {
    layers: []Layer = undefined,

    pub fn init(self: *Model, layers_count: usize) !void {
        self.layers = try allocator.alloc(Layer, layers_count);
    }

    pub fn deinit(self: *Model) void {
        allocator.free(self.layers);
    }

    pub fn forward(m: Model, X: *Matrix) *Matrix {
        for (m.layers) |layer| X = layer.forward(X);
        return X;
    }
};

const Layer = struct {
    in: Matrix = undefined, //  Saved input to a layer
    w: Matrix = undefined, //   Current weights for a layer
    dw: Matrix = undefined, //  Current weight updates
    v: Matrix = undefined, //   Past weight updates (for use with momentum)
    out: Matrix = undefined, // Saved output from the layer
    activ: Activation = undefined, // Activation the layer uses

    pub fn init(l: *Layer, input: usize, output: usize, activ: Activation) !void {
        try l.in.init(1, 1);
        try l.out.init(1, 1);
        try l.v.init(input, output);
        try l.dw.init(input, output);

        try l.w.init(input, output);
        l.w.randomize(@sqrt(2.0 / @intToFloat(f32, input)));

        l.activ = activ;
    }

    pub fn deinit(l: *Layer) void {
        // l.in.deinit();
        l.w.deinit();
        l.dw.deinit();
        l.v.deinit();
        l.out.deinit();
    }

    // Forward propagate information through a layer
    pub fn forward(l: *Layer, in: Matrix) *Matrix {
        l.in = in; // Save the input for backpropagation
        // TODO: fix this! multiply input by weights and apply activation function.
        return &l.out;
    }

    // Backward propagate derivatives through a layer
    pub fn backward(l: *Layer, in: Matrix) Matrix {
        l.in = in; // Save the input for backpropagation
        // 1.4.1
        // delta is dL/dy
        // TODO: modify it in place to be dL/d(xw)

        // 1.4.2
        // TODO: then calculate dL/dw and save it in l->dw

        return l.out;
    }

    // Update the weights at layer l
    pub fn update(l: *Layer, rate: f32, momentum: f32, decay: f32) void {
        _ = l;
        _ = rate * momentum * decay;
        // TODO:
        // Calculate Δw_t = dL/dw_t - λw_t + mΔw_{t-1}
        // save it to l->v

        // Update l->w

        // Remember to free any intermediate results to avoid memory leaks

    }
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

//
pub fn main() !void {}

//
const expect = std.testing.expect;
test "Layer" {
    var l: Layer = undefined;
    try l.init(3, 4, .RELU);
    defer l.deinit();
    defer l.in.deinit();
}

test "Model" {
    var m: Model = undefined;
    try m.init(3);
    defer m.deinit();
}
