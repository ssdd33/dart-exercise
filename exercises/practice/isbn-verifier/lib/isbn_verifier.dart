bool isValid(String isbn) {
  /*
  1.check length
  2.check if there is character in middle of isbn
  3.if last isbn is character check if its 'X'
  4.check its mod11 == 0
  */

  List<String> chars = isbn.replaceAll('-', '').split('');
  if (chars.length != 10) {
    return false;
  }
  int sum = 0;
  for (var i = 0; i < 10; i++) {
    if (!isNumeric(chars[i])) {
      if (i < 9) {
        return false;
      } else if (chars[i] != 'X') {
        return false;
      }
      sum += 10;
    } else {
      sum += int.parse(chars[i]) * (10 - i);
    }
  }

  if (sum % 11 != 0) {
    return false;
  }
  return true;
}

bool isNumeric(String str) {
  try {
    int.parse(str);
    return true;
  } on FormatException {
    return false;
  }
}
