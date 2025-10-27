const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    // Use a set so that duplicates will be ignored.
    // Zig doesn't (yet?) have sets so use a HashMap with a `void` value.
    // Use an `AutoArrayHashMap` to optimize for iterating over the keys to return the sum.
    var set = std.AutoArrayHashMap(u32, void).init(allocator);
    defer set.deinit();

    for (factors) |factor| {
        // The only special case to consider on unsigned integers is 0 (ignoring overflow).
        // 0 adds nothing to the sum in the end and has no multiples so simply skip it.
        if (factor == 0) continue;

        var multiple = factor;
        while (multiple < limit) : (multiple += factor) {
            try set.put(multiple, {});
        }
    }

    var total: u64 = 0;
    for (set.keys()) |k| {
        total += k;
    }
    return total;
}
