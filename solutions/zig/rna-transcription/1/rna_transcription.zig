const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = try allocator.alloc(u8, dna.len);

    for (dna, 0..) |nucleotide, index| {
        switch (nucleotide) {
            'G' => rna[index] = 'C',
            'C' => rna[index] = 'G',
            'T' => rna[index] = 'A',
            'A' => rna[index] = 'U',
            else => unreachable,
        }
    }

    return rna;
}
