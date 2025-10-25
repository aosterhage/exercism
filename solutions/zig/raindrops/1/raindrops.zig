const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var writer = std.io.Writer.fixed(buffer);

    // Check if divisible by 3, 5, and 7.
    if (n % 3 == 0) writer.writeAll("Pling") catch unreachable;
    if (n % 5 == 0) writer.writeAll("Plang") catch unreachable;
    if (n % 7 == 0) writer.writeAll("Plong") catch unreachable;

    // If not, write the number as text.
    if (writer.end == 0) writer.printInt(n, 10, .lower, .{}) catch unreachable;

    return writer.buffered();
}
