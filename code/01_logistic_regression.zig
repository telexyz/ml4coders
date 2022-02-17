const std = @import("std");
const fastmath = @import("util/fastmath.zig");

pub fn main() !void {
    var x = fastmath.dotProduct(&.{ 1, 2, 3, 4 }, &.{ 4, 3, 2, 1 });
    std.debug.print("{d}", .{x});
}
