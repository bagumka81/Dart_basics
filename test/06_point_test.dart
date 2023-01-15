import 'package:test/test.dart';
import 'package:dart_basics/06_point.dart';

void main() {
  group('Success test', () {
    test('Distance from (0.0, 0.0, 0.0) to (1.0, 1.0, 1.0) is 1.732', () {
      expect(Point.zero().distanceTo(Point.ones()), 1.7320508075688772);
    });
    test('Distance from (1.0, 1.0, 1.0) to (-5.0, 4.0, 3.0) is 7.0', () {
      expect(Point.ones().distanceTo(Point(-5, 4, 3)), 7.0);
    });
    test('Distance from (0.0, 0.0, 0.0) to (-5.0, 4.0, 3.0) is 7.071', () {
      expect(Point.zero().distanceTo(Point(-5, 4, 3)), 7.0710678118654755);
    });
    test(
        'Area for (0.0, 0.0, 0.0), (1.0, 1.0, 1.0),'
        ' (-5.0, 4.0, 3.0) is 6.0415', () {
      expect(
          Point.zero().area(Point.ones(), Point(-5, 4, 3)), 6.0415229867972835);
    });
  });
}
