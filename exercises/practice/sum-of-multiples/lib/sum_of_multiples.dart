class SumOfMultiples {
  int sum(List<int> items, int level) {
    /*
    - forEach item, get multiples less than level number
    - combine and set
    - sum of multiples
    */
    int result = 0;
    List<int> multiples = [];

    for (int item in items) {
      if (item == 0) continue;
      int length = level % item == 0
          ? ((level / item) - 1).floor()
          : (level / item).floor();
      List<int> temp =
          List<int>.generate(length, (index) => item + item * index);
      multiples.addAll(temp);
    }
    print(multiples);
    Set<int> setOfMultiples = multiples.toSet();
    result = setOfMultiples.toList().fold(0, (pre, el) => pre + el);

    return result;
  }
}
