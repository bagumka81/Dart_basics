/// Class for counting words in list
class WordListToMap {
  /// Static method for counting words in list
  static Map<String, int> convert(List<String> wordList) {
    Map<String, int> result = {}; // create empty map to enable search
    for (String element in wordList) {
      result.update(element, (value) => ++value, ifAbsent: () => 1);
    }
    return result;
  }
}