import 'dart:math';

class Darts {
  int score(double x, double y) {
    double distance = sqrt(pow(x, 2) + pow(y, 2));

    if (distance <= 10 && distance > 5) {
      return 1;
    }
    if (distance <= 5 && distance > 1) {
      return 5;
    }

    if (distance <= 1) {
      return 10;
    }

    return 0;
  }
}
