import 'package:dart_basics/delimeters_calculator.dart' as dc;
import 'package:dart_basics/console_utils.dart' as console_utils;
import 'package:dart_basics/dec_bin.dart' as dec_bin;

void main(List<String> arguments) {
  print('------- Task 1 -------');
  processTask1();
  print('------- Task 2 -------');
  processTask2();
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
  if (num>1){
    console_utils.ConsoleUtils.addToPrintLine("$num = ");
    bool isFirstDelimiter = true; // to suppress multiply symbol
    for (var i in dc.DelimetersCalculator.getDelimiters(num))
    {
      console_utils.ConsoleUtils.addToPrintLine(isFirstDelimiter ? i : "*$i");
      isFirstDelimiter = false;
    }
    console_utils.ConsoleUtils.addToPrintLine("\n");
  }else{
    print ("No delimiters found");
  }
}

/// Process Homework Task 2:
/// Реализуйте методы для преобразования целых чисел из
/// десятичной системы в двоичную и обратно
void processTask2() {
  final int num = console_utils.ConsoleUtils.consoleReadIntOnly(
      "Input decimal number:");
  print("dec n = bin ${dec_bin.DecBin.decToBin(num)}");

  final String binStr = console_utils.ConsoleUtils.consoleReadBinStrOnly(
      "Input binary string:");
  print("bin n = dec ${dec_bin.DecBin.binToDec(binStr)}");

}
