class Isogram {
  bool isIsogram(String str) {
    /*
    1. replace all spaces, slashs to ''
    2. if its empty string return true
    3. check is there any duplicated character
    */

    String parsed = str.replaceAll(RegExp(r'-|\s*'), '').toLowerCase();
    if (parsed.length == 0) return true;
    List<bool> check = List<bool>.filled(130, false);

    for (int i = 0; i < parsed.length; i++) {
      int charCodeIndex = parsed[i].codeUnitAt(0);

      if (check[charCodeIndex]) {
        return false;
      } else {
        check[charCodeIndex] = true;
      }
    }
    return true;
  }
}

bool isEmpty(List<bool> list, int index) {
  try {
    bool value = list[index];
    return !value;
  } on RangeError {
    return true;
  }
}
