import 'package:dart_basics/delimeters_calculator.dart' as dc;
import 'package:test/test.dart';

void main() {
  group('Success test', () {
    test('gcm 10 15', () {
      expect(dc.DelimetersCalculator.gcd(10, 15), 5);
    });
    test('lcm 10 15', () {
      expect(dc.DelimetersCalculator.lcm(10, 15), 30);
    });
  });

  group('Exception throw test', () {
    test('gcm -1 0', () {
      expect(() => dc.DelimetersCalculator.gcd(-1, 0), throwsArgumentError);
    });
    test('lcm 0 0', () {
      expect(() => dc.DelimetersCalculator.lcm(0, 0), throwsArgumentError);
    });
  });
}
