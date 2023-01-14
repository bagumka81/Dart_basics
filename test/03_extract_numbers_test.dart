import 'package:test/test.dart';
import 'package:dart_basics/03_extract_numbers.dart' as extr_num;

void main() {
  group('Success test', () {
    test('Convert "10 3,5 f4 3" to [10, 3]', () {
      expect(extr_num.ExtractNumbers.getNumbersList("10 3,5 f4 3"), [10, 3]);
    });
    test('Convert "5.6 1e-15 e56" to [5.6, 1e-15]', () {
      expect(extr_num.ExtractNumbers.getNumbersList("5.6 1e-15 e56"),
          [5.6, 1e-15]);
    });
    test('Convert "1,5 r56 d45" to []', () {
      expect(extr_num.ExtractNumbers.getNumbersList("1,5 r56 d45"), []);
    });
  });
}
