const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    std.debug.assert(buffer.len >= s.len);

    // Assume the string is ASCII encoded; this means we can iterate and reverse individual u8s.
    for (s, 1..) |c, i| {
        buffer[s.len - i] = c;
    }
    return buffer[0..s.len];
}
