// Khởi tạo namespace std standard lib của Zig
const std = @import("std");

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
    // Rồi chúng ta gọi test thử xem fastmath đã được link với phần code chính chưa nào
    testFastmath();
}

// Vậy là đã nắm được sơ sơ cách viết chương trình trong Zig. Đầu tiên hãy cài đặt lại hàm `logistic_sigmoid_regression` từ https://github.com/tiepvupsu/tiepvupsu.github.io/blob/master/assets/LogisticRegression/LogisticRegression_post.ipynb

fn logistic_sigmoid_regression() void {
    //
}
