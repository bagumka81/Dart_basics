/// Class for findings numbers in list
class FindNumbers {
  /// Dictionary of numbers in English
  static const Map<String, int> numbersDict = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
  };

  /// Static method for finding numbers in list
  static List<int> find(List<String> wordList) {
    Set<int> result = {}; // create empty map to enable search
    for (String str in wordList) {
      if (numbersDict.containsKey(str)) result.add(numbersDict[str]!);
    }
    return result.toList();
  }
}
