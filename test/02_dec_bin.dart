import 'package:test/test.dart';
import 'package:dart_basics/02_dec_bin.dart' as dec_bin;

void main() {
  group('Success test', () {
    test('Convert 10 to b1010', () {
      expect(dec_bin.DecBin.decToBin(10), '1010');
    });
    test('Convert b1101 to 13', () {
      expect(dec_bin.DecBin.binToDec("1101"), 13);
    });
  });

  group('Exception throw test', () {
    test('Convert -20 to bin', () {
      expect(() => dec_bin.DecBin.decToBin(-20), throwsArgumentError);
    });
    test('Convert b0121 to dec', () {
      expect(() => dec_bin.DecBin.binToDec("0121"), throwsArgumentError);
    });
  });
}
