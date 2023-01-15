import 'package:test/test.dart';
import 'package:dart_basics/07_roots.dart' as roots;

void main() {
  group('Success test', () {
    test('(-8)^(1/3)=2', () {
      expect((-8).myRoot(3), -2);
    });
    test('2^(1/2)=1.414', () {
      expect(2.myRoot(2), 1.414213562373095);
    });
    test('768^(0)=1', () {
      expect(768.myRoot(0), 1);
    });
    test('3685^(1)=3685', () {
      expect(3685.myRoot(1), 3685);
    });
    test(
        '[abs(-34), abs(-1.14), abs(0), abs(500), abs(4567)] ='
        ' [34, 1.14, 0, 500, 4567]', () {
      expect(
          [roots.Root.abs(-34), roots.Root.abs(-1.14), roots.Root.abs(0),
            roots.Root.abs(500), roots.Root.abs(4567)],
          [34, 1.14, 0, 500, 4567]);
    });
  });

  group('Exception throw test', () {
    test('(-8)^(1/2) has a complex result - throws exception', () {
      expect(() => (-8).myRoot(2), throwsArgumentError);
    });
    test('8.myRoot(-3), negative power is not implemented', () {
      expect(() => 8.myRoot(-3), throwsArgumentError);
    });
  });
}
