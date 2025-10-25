const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    // Utilize a hashmap to detect character collisions from the string.
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var map = std.AutoHashMap(u8, void).init(gpa.allocator());

    for (str) |char| {
        // Spaces and hyphens are allowed to appear multiple times.
        if (char == ' ' or char == '-') {
            continue;
        }

        // Convert all characters to lowercase since, for the purposes of an isogram, 'a' == 'A'.
        const char_lower = std.ascii.toLower(char);

        // If the map already contains the key we want to add, its not an isogram.
        if (map.contains(char_lower)) {
            return false;
        }

        map.put(char_lower, {}) catch {};
    }

    // No key collisions (no repeated characters) so its an isogram.
    return true;
}
