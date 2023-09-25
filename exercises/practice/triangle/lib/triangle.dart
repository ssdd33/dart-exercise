class Triangle {
  bool equilateral(double a, double b, double c) {
    if (_isTriangle(a, b, c)) {
      return a == b && b == c;
    }
    return false;
  }

  bool isosceles(double a, double b, double c) {
    if (_isTriangle(a, b, c)) {
      return a == b || b == c || a == c;
    }
    return false;
  }

  bool scalene(double a, double b, double c) {
    if (_isTriangle(a, b, c)) {
      return !equilateral(a, b, c) && !isosceles(a, b, c);
    }
    return false;
  }

  bool _isTriangle(double a, double b, double c) {
    return a != 0 && b != 0 && c != 0 && a + b >= c && a + c >= b && b + c >= a;
  }
}
