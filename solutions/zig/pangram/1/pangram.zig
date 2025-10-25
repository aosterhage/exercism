const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var map = std.AutoHashMap(u8, void).init(gpa.allocator());

    for (str) |char| {
        switch (char) {
            'a'...'z' => map.put(char, {}) catch {},
            'A'...'Z' => map.put(std.ascii.toLower(char), {}) catch {},
            else => continue,
        }
    }

    return map.count() == 26;
}
