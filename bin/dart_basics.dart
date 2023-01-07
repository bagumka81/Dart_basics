import 'dart:developer';

import 'package:dart_basics/01_delimeters_calculator.dart' as dc;
import 'package:dart_basics/console_utils.dart' as console_utils;
import 'package:dart_basics/02_dec_bin.dart' as dec_bin;
import 'package:dart_basics/03_extract_numbers.dart' as extr_num;
import 'package:dart_basics/04_word_list_to_maps.dart' as word_list_map;
import 'package:dart_basics/05_find_numbers.dart' as find_numbers;

void main(List<String> arguments) {
  print('------- Task 1 -------');
  processTask1();
  print('------- Task 2 -------');
  processTask2();
  print('------- Task 3 -------');
  processTask3();
  print('------- Task 4 -------');
  processTask4();
  print('------- Task 5 -------');
  processTask5();
}

/// Process Homework Task 1:
/// Реализуйте методы вычисления НОД и НОК целых чисел. Реализуйте метод,
/// который разбивает число на простые множители и возвращает их.
void processTask1() {
  final int num1 = console_utils.ConsoleUtils.consoleReadIntOnly("Input num1:");
  final int num2 = console_utils.ConsoleUtils.consoleReadIntOnly("Input num2:");
  try {
    print('greatest common divisor for $num1 and $num2 is '
        '${dc.DelimetersCalculator.gcd(num1, num2)}');
  } catch (e) {
    print("Can't calculate Greatest Common Divisor. Reason: $e");
  }
  try {
    print('least common multiple for $num1 and $num2 is '
        '${dc.DelimetersCalculator.lcm(num1, num2)}\n');
  } catch (e) {
    print("Can't calculate Least Common Multiple. Reason: $e");
  }

  final int num = console_utils.ConsoleUtils.consoleReadIntOnly(
      "Input number for prime factorization:");
  if (num > 1) {
    console_utils.ConsoleUtils.addToPrintLine("$num = ");
    bool isFirstDelimiter = true; // to suppress multiply symbol
    for (var i in dc.DelimetersCalculator.getDelimiters(num)) {
      console_utils.ConsoleUtils.addToPrintLine(isFirstDelimiter ? i : "*$i");
      isFirstDelimiter = false;
    }
    console_utils.ConsoleUtils.addToPrintLine("\n");
  } else {
    print("No delimiters found");
  }
}

/// Process Homework Task 2:
/// Реализуйте методы для преобразования целых чисел из
/// десятичной системы в двоичную и обратно
void processTask2() {
  final int num =
      console_utils.ConsoleUtils.consoleReadIntOnly("Input decimal number:");
  print("dec n = bin ${dec_bin.DecBin.decToBin(num)}");

  final String binStr =
      console_utils.ConsoleUtils.consoleReadBinStrOnly("Input binary string:");
  print("bin n = dec ${dec_bin.DecBin.binToDec(binStr)}");
}

/// Process Homework Task 3:
/// Реализуйте метод, который принимает строку слов, разделённых пробелами.
/// Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
/// To eliminate ambiguity, let's say that number should be a separate "word",
///  and we don't search numbers in words
void processTask3() {
  final String strToPare = console_utils.ConsoleUtils.consoleReadStringOnly(
      "Input space divided string to split it in numbers:");
  print("Numbers in string:");
  extr_num.ExtractNumbers.getNumbersFromString(strToPare).forEach((element) {
    console_utils.ConsoleUtils.addToPrintLine(" $element");
  });
  print("\n");
}

/// Process Homework Task 4:
/// Есть коллекция слов. Реализуйте метод, возвращающий Map.
/// Данный Map должен соотносить слово и количество его вхождений в
/// данную коллекцию.
void processTask4() {
  const List<String> wordCollection = [
    "one",
    "two",
    "three",
    "three",
    "two",
    "three"
  ];
  print("Words collection:");
  wordCollection.forEach((element) {
    console_utils.ConsoleUtils.addToPrintLine(" '$element'");
  });
  console_utils.ConsoleUtils.addToPrintLine("\n");
  Map<String, int> result = word_list_map.WordListToMap.convert(wordCollection);
  print("Resulting map:");
  result.forEach((key, value) {
    print("\"$key\": $value");
  });
  print("\n");
}

/// Process Homework Task 5:
/// Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
/// Реализуйте метод, возвращающий цифры без повторений, которые встречаются в
/// данной строке. Однако цифры встречаются в виде английских слов
/// от zero до nine. Например, в результате строки ‘one, two, zero, zero’ мы
/// получим следующий результат: [1, 2, 0]. Если в строке есть слова,
/// не являющиеся цифрами от 0 до 9, пропускайте их.
void processTask5() {
  const List<String> wordCollection = [
    "one",
    "two",
    "zero",
    "cat",
    "dog",
    "zero"
  ];
  print("Words collection:");
  print(wordCollection);
  List<int> result = find_numbers.FindNumbers.find(wordCollection);
  print("Found numbers:");
  print(result);
}
