/// Class for extractring space divided numbers from String
class ExtractNumbers {
  /// Static method for generating List of numbers from string
  static List<num> getNumbersList(String strNumbers) {
    return getNumbersFromString(strNumbers).toList();
  }

  /// Static method for generating numbers from string [str]
  /// usually you need to process them, not to store it in memory
  static Iterable<num> getNumbersFromString(String strNumbers) sync* {
    num? number;
    for (String str in strNumbers.split(" ")) {
      number = num.tryParse(str); // No more error about `String?`.
      if (number != null) yield number;
    }
  }
}