pub const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa.deinit() == .ok);

    // Utilize a hashmap to detect character collisions from the string.
    var map = std.AutoHashMap(u8, void).init(gpa.allocator());
    defer map.deinit();

    for (str) |char| {
        // Convert all characters to lowercase since, for the purposes of an isogram, 'a' == 'A'.
        const lower = switch (char) {
            inline 'a'...'z' => char,
            inline 'A'...'Z' => std.ascii.toLower(char),
            ' ', '-' => continue, // spaces and hyphens are allowed to appear any number times
            else => return false, // any other non-character value doesn't make a word and so does not make an isogram
        };

        // If the map already contains the key we want to add, its not an isogram.
        if (map.contains(lower)) {
            return false;
        }

        map.put(lower, {}) catch {};
    }

    // No key collisions (no repeated characters) so its an isogram.
    return true;
}
