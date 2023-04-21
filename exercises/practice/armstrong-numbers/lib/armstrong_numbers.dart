import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String numString) {
    int num = int.parse(numString);
    int length = numString.length;
    List<int> digits =
        numString.split('').map((string) => int.parse(string)).toList();
    int sum = digits.fold<int>(0, (p, e) => p + pow(e, length).toInt());

    return sum == num;
  }
}
