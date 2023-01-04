/// Class for working with prime numbers
class DecBin {
  /// Static method for converting decimal [n] to binary
  static String decToBin(int n) {
    return n.toRadixString(2);
  }
  /// Static method for converting decimal [n] to binary
  static int binToDec(String n) {
    return int.parse(n, radix: 2);
  }

  /// Static method for generating prime numbers from 2 to [n]
  static Iterable<int> getNextPrime(int n) sync* {
    int k = 2;
    while (k <= n) {
      yield k++;
    }
  }
}
