import 'package:dart_basics/delimeters_calculator.dart' as dc;
import 'package:dart_basics/console_utils.dart' as console_utils;

void main(List<String> arguments) {

  print('------- Task 1 -------');
  final int num1 = console_utils.ConsoleUtils.consoleReadIntOnly("Input num1:");
  final int num2 = console_utils.ConsoleUtils.consoleReadIntOnly("Input num2:");
  try {
    print('greatest common divisor for $num1 and $num2 is '
        '${dc.DelimetersCalculator.gcd(num1, num2)}');
  }catch(e)
  {
    print("Can't calculate Greatest Common Divisor. Reason: $e");
  }
  try {
  print('least common multiple for $num1 and $num2 is '
      '${dc.DelimetersCalculator.lcm(num1, num2)}\n');
  }catch(e)
  {
    print("Can't calculate Least Common Multiple. Reason: $e");
  }
}

