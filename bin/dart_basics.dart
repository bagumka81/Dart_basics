import 'package:dart_basics/delimeters_calculator.dart' as dc;

void main(List<String> arguments) {

  print('------- Task 1 -------');
  const int num1 = 10;
  const int num2 = 15;
  print('greatest common divisor for $num1 and $num2 is '
  '${dc.DelimetersCalculator.gcd(num1, num2)}');
  print('least common multiple for $num1 and $num2 is '
      '${dc.DelimetersCalculator.lcm(num1, num2)}\n');

}
