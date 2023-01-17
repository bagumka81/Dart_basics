import 'package:test/test.dart';
import 'package:dart_basics/09_integral.dart' as integral;

// функция с особенностями
double linExclusion(double x) {
  if (x > 5) {
    throw RangeError("Values x>5 are out of scope!");
  }
  return x * 2 + 4;
}

void main() {
  group('Success test', () {
    test('f=x * 2 + 4, x=[3.5,6.7] ', () {
      // 45.44=(6.7-3.5)*(11+17.4)/2
      expect(integral.Integral.calc(((x) => x * 2 + 4), 3.5, 6.7, 10),
          45.440000000000005);
    });
    test('f=x * 2 + 4 for x>5 (f doesn\'t exist for x<=5), x=[3.5,6.7]', () {
      expect(integral.Integral.calc(linExclusion, 3.5, 6.7, 100000),
          18.75000000000225);
    });
  });
}
