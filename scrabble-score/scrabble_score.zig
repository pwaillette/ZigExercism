const std = @import("std");

pub fn main() !void {
    const s = "a";
    const allocator = std.heap.page_allocator;
    var map = std.StringHashMap(u8).init(allocator);
    var scoreScrabble: u32 = 0;

    try initialize_map(&map);
    //try try map.put("a", 1);

    for (s) |char| {
        var c = char;
        if (std.ascii.isUpper(c)) c = std.ascii.toLower(c);
        var arr = [_]u8{c};
        var val = map.get(&arr);

        if (val) |v| {
            scoreScrabble += v;
        }
    }

    std.debug.print("Result: {}", .{scoreScrabble});

    const bytes = try allocator.alloc(u8, 1000);
    defer allocator.free(bytes);
}

pub fn score(s: []const u8) u32 {
    const allocator = std.heap.page_allocator;
    var map = std.StringHashMap(u8).init(allocator);
    defer map.deinit();
    var scoreScrabble: u32 = 0;
    initialize_map(&map);

    for (s) |char| {
        var c = char;
        if (std.ascii.isUpper(c)) c = std.ascii.toLower(c);
        var arr = [_]u8{c};
        var val = map.get(&arr);

        if (val) |v| {
            scoreScrabble += v;
        }
    }

    const bytes = allocator.alloc(u8, 1000) catch unreachable;
    defer allocator.free(bytes);
    return scoreScrabble;
}

pub fn initialize_map(map: *std.StringHashMap(u8)) void {
    map.*.put("a", 1) catch unreachable;
    map.*.put("e", 1) catch unreachable;
    map.*.put("i", 1) catch unreachable;
    map.*.put("o", 1) catch unreachable;
    map.*.put("u", 1) catch unreachable;
    map.*.put("l", 1) catch unreachable;
    map.*.put("n", 1) catch unreachable;
    map.*.put("r", 1) catch unreachable;
    map.*.put("s", 1) catch unreachable;
    map.*.put("t", 1) catch unreachable;
    map.*.put("d", 2) catch unreachable;
    map.*.put("g", 2) catch unreachable;
    map.*.put("b", 3) catch unreachable;
    map.*.put("c", 3) catch unreachable;
    map.*.put("m", 3) catch unreachable;
    map.*.put("p", 3) catch unreachable;
    map.*.put("f", 4) catch unreachable;
    map.*.put("h", 4) catch unreachable;
    map.*.put("v", 4) catch unreachable;
    map.*.put("w", 4) catch unreachable;
    map.*.put("y", 4) catch unreachable;
    map.*.put("k", 5) catch unreachable;
    map.*.put("j", 8) catch unreachable;
    map.*.put("x", 8) catch unreachable;
    map.*.put("q", 10) catch unreachable;
    map.*.put("z", 10) catch unreachable;
}
