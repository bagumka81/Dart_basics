import 'dart:developer';

import 'package:dart_basics/console_utils.dart' as console_utils;
import 'package:dart_basics/01_delimeters_calculator.dart' as dc;
import 'package:dart_basics/02_dec_bin.dart' as dec_bin;
import 'package:dart_basics/03_extract_numbers.dart' as extr_num;
import 'package:dart_basics/04_word_list_to_maps.dart' as word_list_map;
import 'package:dart_basics/05_find_numbers.dart' as find_numbers;
import 'package:dart_basics/06_point.dart';
import 'package:dart_basics/07_roots.dart' as roots;
import 'package:dart_basics/08_user.dart' as user;
import 'package:dart_basics/09_integral.dart' as integral;
import 'package:test/scaffolding.dart';

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
  print('------- Task 6 -------');
  processTask6();
  print('------- Task 7 -------');
  processTask7();
  print('------- Task 8 -------');
  processTask8();
  print('------- Task 9 -------');
  processTask9();
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
  extr_num.ExtractNumbers.getNumbersList(strToPare).forEach((element) {
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

/// Process Homework Task 6:
/// Реализуйте класс Point(3D точка), у данного класса реализуйте метод
/// distanceTo(Point another), расчет расстояния. Реализовать метод,
/// возвращающий площадь треугольника, по трём точкам.
/// Реализуйте factory-конструкторы для данного класса, возвращающие [0,0,0] и
/// [1,1,1], которая определяет единичный вектор.
void processTask6() {
  print("Zero point print: ${Point.zero()}");
  print("Testing methods:");
  print("  Distance from ${Point.zero()} to ${Point.ones()} is "
      "${Point.zero().distanceTo(Point.ones())}");
  print("  Distance from ${Point.ones()} to ${Point(-5, 4, 3)} is "
      "${Point.ones().distanceTo(Point(-5, 4, 3))}");
  print("  Distance from ${Point.zero()} to ${Point(-5, 4, 3)} is "
      "${Point.zero().distanceTo(Point(-5, 4, 3))}");
  print("  Area for ${Point.zero()}, ${Point.ones()}, ${Point(-5, 4, 3)} is "
      "${Point.zero().area(Point.ones(), Point(-5, 4, 3))}");
}

/// Process Homework Task 7:
/// Реализуйте метод, который вычисляет корень любой заданной степени из числа.
/// Реализуйте данный метод как extension-метод для num. Алгоритм можете взять
/// на википедии как «Алгоритм нахождения корня n-й степени».
/// Запрещается использовать методы math. В случае когда значение вернуть
/// невозможно, необходимо бросать исключение с описанием ошибки.
void processTask7() {
  final double rootArg = console_utils.ConsoleUtils.consoleReadDoubleOnly(
      "Input argument of root:");
  final int rootPower =
      console_utils.ConsoleUtils.consoleReadIntOnly("Input power of root:");
  try {
    print("Result: ${rootArg.myRoot(rootPower)}");
  } catch (e) {
    print("Exception was raised: ${e.toString()}");
  }
}

/// Process Homework Task 8:
/// Создайте класс User с полем email. Реализуйте два наследника
/// данного класса AdminUser и GeneralUser. Реализовать mixin над User,
/// с методом getMailSystem, возвращающий часть email после @ (mail.ru).
/// Используйте данный миксин на AdminUser. Далее реализуйте класс
/// UserManager<T extends User> со списком User и методами добавить/удалить.
/// В UserManager сделать метод печати всех email, кроме Админа, для которого
/// печатать getMailSystem. Проверьте реализованные методы на практике.
void processTask8() {
  user.UserManager userManager = user.UserManager();
  userManager.addUser(user.GeneralUser("user1@mail.ru"));
  userManager.addUser(user.AdminUser("admUser@mail.ru"));
  userManager.addUser(user.GeneralUser("user2@ya.ru"));
  userManager.printEmails();
}

// функция с особенностями
double linExclusion(double x) {
  if (x>5){
    throw RangeError("Values x>5 are out of scope!");
  }
  return x * 2 + 4;
}

/// Process Homework Task 9:
/// Реализуйте метод, вычисления определённого интеграла Римана в заданных
/// значениях и с заданной точностью разбиения. Учесть случаи, когда функция
/// имеет точки разрыва. Реализованный метод должен принимать:
/// функцию, точки x1 и x2, точность разбиения.
void processTask9() {
  //double val = integral.Integral.calc(linx, 3.5, 6.7, 10);
  late double val;
  val= integral.Integral.calc(((x) => x * 2 + 4), 3.5, 6.7, 10);
  print ("result for linear function: $val"); // 45.44=(6.7-3.5)*(11+17.4)/2
  val= integral.Integral.calc(linExclusion, 3.5, 6.7, 100000);
  //18.75=(5-3.5)*(11+14)/2,but only 100 000 steps give good accuracy
  print ("result for linear function with issues: $val");

}
