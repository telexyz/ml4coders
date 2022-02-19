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
}

// Vậy là đã nắm được sơ sơ cách viết chương trình trong Zig. Đầu tiên hãy cài đặt lại hàm `logistic_sigmoid_regression` từ https://github.com/tiepvupsu/tiepvupsu.github.io/blob/master/assets/LogisticRegression/LogisticRegression_post.ipynb
fn logisticRegressionExample() void {
    // Dữ liệu đầu vào là một mảng ghi số lượng thời gian bỏ ra để học của 20 sinh viên
    var study_hours: [20]f32 = .{ 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 1.75, 2.00, 2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 4.00, 4.25, 4.50, 4.75, 5.00, 5.50 };

    // và một mảng ghi nhận việc trượt hay qua được bài thi tương ứng với số giờ bỏ ra
    var passed: [20]f32 = .{ 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1 };

    var weights: [study_hours.len]f32 = undefined;
    logisticSigmoidRegression(weights[0..], study_hours[0..], passed[0..], 5, 1e-4, 10_000);
}

fn logisticSigmoidRegression(
    w: []f32, // weights
    X: []f32, // features
    y: []f32, // labels
    eta: f32,
    tol: f32,
    max_count: usize,
) void {
    // Khởi tạo ngẫu nhiên giá trị cho w
    const random = std.rand.DefaultPrng.init(123).random();
    const n = @intToFloat(f32, w.len);
    for (w) |*elem| elem.* = (random.float(f32) - 0.5) / n;

    //     it = 0
    //     N = X.shape[1]
    //     d = X.shape[0]
    //     count = 0
    //     check_w_after = 20
    //     while count < max_count:
    // #         it += 1
    //         # mix data
    //         mix_id = np.random.permutation(N)
    //         for i in mix_id:
    //             xi = X[:, i].reshape(d, 1)
    //             yi = y[i]
    //             zi = sigmoid(np.dot(w[-1].T, xi))
    //             w_new = w[-1] + eta*(yi - zi)*xi
    //             count += 1
    //             # stopping criteria
    //             if count%check_w_after == 0:
    //                 if np.linalg.norm(w_new - w[-check_w_after]) < tol:
    //                     return w
    //             w.append(w_new)
    //     return w
}
