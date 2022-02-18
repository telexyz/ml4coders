// Khởi tạo namespace std standard lib của Zig
const std = @import("std");
pub const allocator = std.heap.page_allocator;

// Load source code và khởi tạo namespace fastmath từ mã nguồn util/fastmath.zig
const fastmath = @import("util/fastmath.zig");

fn testFastmath() void {
    // Gọi là fastmath cho có tí nguy hiểm chứ thực ra đơn giản lắm
    // Hàm fastmath's dotProduct là dotProduct của 2 vectors x, y.
    // Cài đặt bình thường chỉ cần 2 dòng code là xong:
    // var dot: f32 = 0; for (x) |v, i| dot += x[i] * y[i];
    // Hàm fastmath.dotProduct có kiểu dữ liệu vector build-in của Zig,
    // thực hiện 1 phép nhân trên 4 toán tử f32 trong một lần để tăng tốc độ
    std.debug.print("dot product của 2 vector [1, 2, 3, 4] và [4, 3, 2, 1] là {d}\n", .{fastmath.dotProduct(&.{ 1, 2, 3, 4 }, &.{ 4, 3, 2, 1 })});

    // Test fastmath's sigmoid
    // Hàm này càng đơn giản hơi. Tính trước giá trị sigmoid trên một mảng 512 phần tử,
    // chặn đầu chặn đuôi, còn lại map một giá trị bất kỳ vào 1 ô trên mảng đó.
    // => Giá trị đầu ra là tương đối (đã được/bị lượng hóa)
    std.debug.print(
        "sigmoid của 1,2,3,4 là {d:.3},{d:.3},{d:.3},{d:.3}\n",
        .{ fastmath.sigmoid(1), fastmath.sigmoid(2), fastmath.sigmoid(3), fastmath.sigmoid(-4) },
    );
}

// Hàm được gọi đầu tiên khi chạy chương trình
pub fn main() anyerror!void {
    // Rồi chúng ta gọi thử xem fastmath đã được link với phần code chính chưa nào
    testFastmath();

    var matrix_X: [20]f32 = .{ 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 1.75, 2.00, 2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 4.00, 4.25, 4.50, 4.75, 5.00, 5.50 };

    var vector_y: [20]f32 = .{ 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1 };

    var matrix_W: [matrix_X.len]f32 = undefined;
    logistic_sigmoid_regression(matrix_W[0..], matrix_X[0..], vector_y[0..], 5, 1e-4, 10_000);
}

// Vậy là đã nắm được sơ sơ cách viết chương trình trong Zig. Đầu tiên hãy cài đặt lại hàm `logistic_sigmoid_regression` từ https://github.com/tiepvupsu/tiepvupsu.github.io/blob/master/assets/LogisticRegression/LogisticRegression_post.ipynb
fn logistic_sigmoid_regression(
    matrix_W: []f32, // ma trận đầu ra
    matrix_X: []f32, // ma trận feature
    vector_y: []f32, // vector nhãn?
    eta: f32,
    tol: f32,
    max_count: usize,
) void {
    _ = matrix_W;
    _ = matrix_X;
    _ = vector_y;
    _ = eta;
    _ = tol;
    _ = max_count;
}
