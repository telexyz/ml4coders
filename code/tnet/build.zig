const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const tnet = b.addExecutable("tnet", "tnet.zig");
    tnet.setTarget(target);
    tnet.setBuildMode(mode);
    tnet.install();
    tnet.addIncludeDir(".");

    const run_cmd = tnet.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const all_tests = b.addTest("tnet.zig");
    all_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run all tests");
    test_step.dependOn(&all_tests.step);
}
