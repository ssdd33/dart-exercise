class CollatzConjecture {
  int steps(int num) {
    int steps = 0;

    if (num <= 0) {
      throw (ArgumentError('Only positive integers are allowed'));
    }
    while (num != 1) {
      steps++;
      if (num % 2 == 0) {
        num = num ~/ 2;
        continue;
      } else {
        num = num * 3 + 1;
      }
    }

    return steps;
  }
}
