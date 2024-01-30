const std = @import("std");

pub const Triangle = struct {
    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        const triangle = Triangle{ .a = a, .b = b, .c = c };

        return if (triangle.isCorrectInequality()) if (triangle.isEquilateral() and triangle.a == 0) TriangleError.Invalid else if (triangle.isEquilateral() or triangle.isIsosceles() or triangle.isScalene()) triangle else TriangleError.Invalid else TriangleError.Invalid;
    }

    pub fn isCorrectInequality(self: Triangle) bool {
        const firstExpr: bool = (self.a + self.b >= self.c);
        const secondExpr: bool = (self.b + self.c >= self.a);
        const thirdExpr: bool = (self.a + self.c >= self.b);

        return firstExpr and secondExpr and thirdExpr;
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.b == self.c;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.a == self.c or self.b == self.c;
    }

    pub fn isScalene(self: Triangle) bool {
        return self.a != self.b and self.b != self.c and self.c != self.a;
    }
};

pub const TriangleError = error{Invalid};
