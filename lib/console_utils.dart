import 'dart:io';

/// Class contains auxilary static functions for console application
class ConsoleUtils {
  ///Reads Integer number from console
  /// user sees [message]. Argument is optional
  /// returns Int or null
  static int? consoleReadInt([String? message]) {
    if (message != null && message.isNotEmpty) {
      print(message);
    }
    // Read a line and try to parse it as an integer.
    String? line = stdin.readLineSync();
    if (line != null) {
      int? num = int.tryParse(line); // No more error about `String?`.
      if (num != null) {
        return num;
      }
    }
    return null;
  }

  /// Static method for reading Integers numbers only
  static int consoleReadIntOnly(String message) {
    int? console_num = null;
    while (console_num == null) {
      console_num = consoleReadInt(message);
      if (console_num == null) print("Sorry it's not a number");
    }
    return console_num.toInt();
  }

}
