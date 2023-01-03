/// Class contains static functions for calculation of:
/// 1. greatest common divisor
/// 2. least common multiple
class DelimetersCalculator {
  ///Finds greatest common divisor for
  /// two numbers [num1] and [num2]
  static int gcd(int num1, int num2) {
    if (num1 < 0 || num2 < 0) {
      throw ArgumentError("gcd arguments must be >=0");
    }
    if (num1 < num2) {
      int temp = num1;
      num1 = num2;
      num2 = temp;
    }
    return num2 > 0 ? gcd(num2, num1 % num2) : num1;
  }

  ///Finds least common multiple for
  /// two numbers [num1] and [num2]
  static int lcm(int num1, int num2) {
    if (num1 <= 0 || num2 <= 0) {
      throw ArgumentError("lcm arguments must be >0");
    }
    return (num1 ~/ gcd(num1, num2)) * num2;
  }
}
