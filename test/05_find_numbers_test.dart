import 'package:test/test.dart';
import 'package:dart_basics/05_find_numbers.dart' as find_numbers;

void main() {
  group('Success test', () {
    test('Convert "one, two, three, cat, dog" to b1010', () {
      expect(
          find_numbers.FindNumbers.find(
              ["one", "two", "zero", "cat", "dog", "zero"]),
          [1, 2, 0]);
    });
  });
}
