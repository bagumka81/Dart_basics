import 'dart:math';

/// Class Point in 3D space
class Point {
  /// Coordinate X
  final double x;

  /// Coordinate Y
  final double y;

  /// Coordinate Z
  final double z;

  ///Main constructor, initializing [x], [y], [z]
  Point(this.x, this.y, this.z);

  ///Factory constructor zero vector
  factory Point.zero() => Point(0, 0, 0);

  ///Factory constructor vector of ones
  factory Point.ones() => Point(1, 1, 1);

  /// Calculate distance
  double distanceTo(Point toPoint) {
    return sqrt((x - toPoint.x) * (x - toPoint.x) +
        (y - toPoint.y) * (y - toPoint.y) +
        (z - toPoint.z) * (z - toPoint.z));
  }

  /// Calculate area
  double area(Point point2, Point point3) {
    // calculate sides
    final double a = distanceTo(point2);
    final double b = distanceTo(point3);
    final double c = point2.distanceTo(point3);
    // calculate semi perimeter
    final double p = (a + b + c) / 2;
    // use Heron formula to determinate triangles area
    return sqrt(p * (p - a) * (p - b) * (p - c));
  }

  @override
  String toString() => "($x, $y, $z)";
}
