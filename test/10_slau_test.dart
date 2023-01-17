import 'package:test/test.dart';
import 'package:dart_basics/10_slau.dart' as slau;

void main() {
  group('Success test', () {
    test('usual matrix len =2, solution = [-1.0, 2.0]', () {
      expect(slau.Slau.solve([0.0, 1.0, 2.0, 3.0, 4.0, 5.0]), [-1.0, 2.0]);
    });
    test('usual matrix len =3, solution = [0, -1.0, 2.0]', () {
      expect(
          slau.Slau.solve(
              [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, -8.0, 9.0, 10.0, 11]),
          [-0.0, -1.0000000000000004, 2.0000000000000004]);
    });
  });

  group('Exception throw test', () {
    test('Singular matrix', () {
      expect(
          () => slau.Slau.solve(
              [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11]),
          throwsArgumentError);
    });
  });
}
