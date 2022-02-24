const std = @import("std");

fn forward(W: Weight, x: f32) f32 {
    var a2: f32 = 0;
    comptime var i: usize = 0;
    inline while (i < HIDDEN_NODES) : (i += 1)
        a2 += @sin(x * W[W1_ + i] + W[B1_ + i]) * W[W2_ + i];
    return a2; // = purelin(a2)
}

// def integration(x, Phi):
//   sum = 0
//   for k in range(1, 30):
    sum += simpson(lambda t: Phi(x-t)*np.cos(k*t-(pi*ALPHA)/2,)/k**ALPHA, 0, 2*pi, 351)
//   return sum/pi #+ simpson(lambda t: (x*t)*Phi(t), 0, pi, 101)

fn err(W: Weight, out: Output) f32 {
    var sum: f32 = 0;
    _ = W;
    // for (out) |x| sum += x;
    // (integration(x, lambda t: NN(W, t)) - right_eq(x))**2
    // https://www.gnu.org/software/gsl/doc/html/integration.html
    return sum / @intToFloat(f32, HIDDEN_NODES);
}

pub fn main() !void {
    std.debug.print("\nweights2: ", .{});
    for (weights2) |w| std.debug.print("{d:.3}, ", .{w});

    const x: f32 = 1.5;
    const y = forward(weights2, 1.5);
    std.debug.print("\n\nforward({d:.3}) = {d:.3}\n", .{ x, y });

    const e = err(weights2, X);
    std.debug.print("\nNew neural network has error: {d:3}\n", .{e});
}

// Data

const Output = [10]f32;
const X: Output = .{ 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0 };

const HIDDEN_NODES: usize = 12;
const B1_: usize = 0;
const W1_: usize = B1_ + HIDDEN_NODES;
const W2_: usize = W1_ + HIDDEN_NODES;
const TOTAL_: usize = W2_ + HIDDEN_NODES;

const Weight = [TOTAL_]f32;
const weights2: Weight = .{ 7.603236172295869677e-01, -1.719828956830381922e-02, 5.727591677136329995e-01, 7.751181311525225937e-01, 4.780151563108267498e-01, 2.270454008140856406e-01, 1.702198675266772265e-01, 7.691694454116951851e-01, 1.094749035392145881e-01, 8.590288889295169539e-02, 6.908832432006389856e-01, 9.780077601967838152e-01, -7.502617784564356851e-02, 3.883085974408610475e-01, 1.210402051432112769e+00, 4.188451285782722744e-01, 7.163696969925386071e-01, -9.183253335142674278e-02, 1.560638996259978928e+00, 6.992037763995817556e-01, 1.192281744559369784e-02, -4.214179337102697681e-02, 3.218788256214019095e-01, 5.556059887317476020e-01, 4.268579067437321406e-01, 1.429232793696635362e-01, -7.378586301452214058e-02, 1.954680029100448468e-01, 3.071611381151858611e-01, 5.162447555572483582e-01, 7.229654706400401309e-01, 2.652857278957371778e-01, 4.898447529195212868e-01, 2.443281432420108257e-01, -5.189361638747112121e-02, 7.038124693927678976e-02 };

const W0: [TOTAL_]f32 = .{ 0.77132064, 0.02075195, 0.63364823, 0.74880388, 0.49850701, 0.22479665, 0.19806286, 0.76053071, 0.16911084, 0.08833981, 0.68535982, 0.95339335, 0.00394827, 0.51219226, 0.81262096, 0.61252607, 0.72175532, 0.29187607, 0.91777412, 0.71457578, 0.54254437, 0.14217005, 0.37334076, 0.67413362, 0.44183317, 0.43401399, 0.61776698, 0.51313824, 0.65039718, 0.60103895, 0.8052232, 0.52164715, 0.90864888, 0.31923609, 0.09045935, 0.30070006 };
