const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    var writer = std.io.Writer.fixed(buffer);

    const name_to_say = name orelse "you";
    try writer.print("One for {s}, one for me.", .{name_to_say});

    return writer.buffered();
}
