class Raindrops {
  String convert(int value) {
    String result = '';

    if (value % 3 == 0) {
      result += 'pling';
    }

    if (value % 5 == 0) {
      result += 'plang';
    }

    if (value % 7 == 0) {
      result += 'plong';
    }

    if (result == '') {
      result = '$value';
    }

    return result;
  }
}
