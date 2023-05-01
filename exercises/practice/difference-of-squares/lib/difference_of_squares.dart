import 'dart:math';

class DifferenceOfSquares {
  int squareOfSum(int num) {
    if (num <= 1) {
      return num;
    } else if (num % 2 == 0) {
      return pow((num + 1) * (num / 2), 2).toInt();
    } else {
      return pow(((num + 1) * (sqrt(num).ceil() - 1)) + sqrt(num).ceil(), 2)
          .toInt();
    }
  }

  int sumOfSquares(int num) {
    if (num <= 1) {
      return num;
    } else if (num % 2 == 0) {
      int mid = num ~/ 2;
      int baseNum = (pow(mid, 2) + pow(mid + 1, 2)).toInt();
      int result = baseNum * mid;
      for (int n = 1; n <= mid - 1; n++) {
        result += 4 * factorial(n);
      }
      return result;
    } else {
      int mid = sqrt(num).ceil().toInt();
      int baseNum = (pow(mid - 1, 2) + pow(mid + 1, 2)).toInt();

      int result = baseNum * (mid - 1) + pow(mid, 2).toInt();

      for (int n = 1; n <= mid - 2; n++) {
        result += (6 * n) + (4 * factorial(n - 1));
      }
      return result;
    }
  }

  int differenceOfSquares(int num) {
    return squareOfSum(num) - sumOfSquares(num);
  }

  int factorial(int num) {
    int result = 0;
    if (num > 0) {
      for (int n = 1; n <= num; n++) {
        result += n;
      }
    }

    return result;
  }
}
