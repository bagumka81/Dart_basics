/// Class for working with prime numbers
class DecBin {
  static const int zeroCode = 48;
  static const int oneCode = 49;

  /// Static method for converting decimal [n] to binary
  static String decToBin(int n) {
    String value = "";
    if (n < 0) {
      throw ArgumentError("Works for positive numbers only!");
    }
    if (n == 0) return "0";
    int currPart = 1;
    int power = 0;
    // find eldest "one"
    for (; power < 64 && currPart < n; power++, currPart <<= 1) {}
    if (power < 64) currPart >>= 1;
    while (currPart > 0) {
      if (currPart <= n) {
        value += '1';
        n -= currPart;
      } else {
        value += '0';
      }
      currPart >>= 1;
    }
    return value; // n.toRadixString(2);
  }

  /// Static method for converting binary string to decimal [n]
  static int binToDec(String n) {
    int power = 1; // power of 2
    int value = 0;
    for (int i = n.length - 1; i >= 0; i--) {
      if (n.codeUnitAt(i) < zeroCode || n.codeUnitAt(i) > oneCode) {
        throw ArgumentError("Binary string should contain 1 or 0 only!");
      }
      value += (n.codeUnitAt(i) - zeroCode) * power;
      power <<= 1;
    }
    return value; //int.parse(n, radix: 2);
  }
}
