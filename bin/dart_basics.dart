import 'package:dart_basics/dart_basics.dart' as dart_basics;
import 'package:dart_basics/delimeters_calculator.dart' as delimeters_calculator;

void main(List<String> arguments) {
  print('Hello world: ${dart_basics.calculate()}!');

  print('------- Task 1 -------');
  const int num1 = 10;
  const int num2 = 15;
  print('greatest common divisor for $num1 and $num2 is '
  '${delimeters_calculator.DelimetersCalculator.gcd(num1, num2)}');
  print('least common multiple for $num1 and $num2 is '
      '${delimeters_calculator.DelimetersCalculator.lcm(num1, num2)}\n');

}
