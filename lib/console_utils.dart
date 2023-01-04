import 'dart:io';

/// Class contains auxiliary static functions for console application
class ConsoleUtils {
  ///Reads Integer number from console
  /// user sees [message]. Argument is optional
  /// returns Int or null
  static int? consoleReadInt([String? message]) {
    if (message != null && message.isNotEmpty) print(message);
    // Read a line and try to parse it as an integer.
    String? line = stdin.readLineSync();
    if (line != null) {
      int? num = int.tryParse(line); // No more error about `String?`.
      if (num != null) return num;
    }
    return null;
  }

  /// Static method for reading Integers numbers only
  static int consoleReadIntOnly(String message) {
    int? consoleNum = null;
    while (consoleNum == null) {
      consoleNum = consoleReadInt(message);
      if (consoleNum == null) print("Sorry it's not a number");
    }
    return consoleNum.toInt();
  }

  /// Static method for adding text to line print
  static void addToPrintLine(Object content) {
    stdout.write(content);
  }

  /// Static method for reading binary String numbers only
  static String consoleReadBinStrOnly(String? message) {
    bool binString = false;
    String? line;
    while (!binString) {
      binString = true;
      if (message != null && message.isNotEmpty) print(message);
      line = stdin.readLineSync();
      if (line == null || line.isEmpty) {
        binString = false;
      } else {
        line = line.toString();
        for (int i = 0; i < line.length && binString; i++) {
          if (line[i] != '0' && line[i] != '1') binString=false;
        }
      }
      if (!binString) print("Sorry it's not a binary string.");
    }
    return line.toString();
  }
}
