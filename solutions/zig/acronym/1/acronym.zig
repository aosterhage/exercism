const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym: std.ArrayList(u8) = .empty;
    defer acronym.deinit(allocator);

    var tokens = mem.tokenizeAny(u8, words, " -");
    while (tokens.next()) |token| {
        var i: usize = 0;
        while (!std.ascii.isAlphabetic(token[i])) : (i += 1) {}
        try acronym.append(allocator, std.ascii.toUpper(token[i]));
    }

    return acronym.toOwnedSlice(allocator);
}
