/// Class for working with prime numbers
class Primes {
  /// Static method for generating prime numbers from 2 to [n]
  static Iterable<int> getNextPrime(int n) sync* {
    int k = 2;
    while (k <= n) {
      yield k++;
    }
  }
}
