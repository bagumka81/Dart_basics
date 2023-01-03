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

  /// Static method for getting delimiters of [n]
  /// [n] must be more than 1
  static Iterable<int> getDelimiters(int n) sync* {
    if (n < 2) {
      throw ArgumentError("Argument must be more than 1");
    }
    for (int nextPrime in getNextPrime(n)) {
      while (n % nextPrime == 0) {
        yield nextPrime;
        n = n ~/ nextPrime;
      }
      if (n == 1) break;
    }
  }

  /// Static method for generating prime numbers from 2 to [n]
  static Iterable<int> getNextPrime(int n) sync* {
    int k = 2;
    bool isPrime = true;
    for (; k <= n; k++, isPrime = true) {
      for (int i = 2; i < k; i++) {
        if (k % i == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        yield k;
      }
    }
  }
}
