bool isValid(String isbn) {
  /*
  1. remove dashes 
  2. check length 
  3. check is there any character 
  4. check last string is int or Character&X
  5. check mod11 ==0
  */

  String parsed = isbn.replaceAll('-', '');
  if (parsed.length > 10) {
    return false;
  }

  List<String> chars = parsed.split('');
  int sum = 0;
  for (var i = 0; i < 10; i++) {
    print('${isNumeric(chars[i])} ,  $i , ${chars[i]}');
    if (!isNumeric(chars[i])) {
      print('nan $i, ${chars[i]}');
      if (i != 9 || chars[i] != 'X') {
        return false;
      } else {
        sum += 10;
        break;
      }
    }
    print('numeric $i , ${chars[i]}');
    sum += (10 - i) * int.parse(chars[i]);
  }

  if (sum % 11 != 0) {
    return false;
  }
  return true;
}

bool isNumeric(String str) {
  try {
    double.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}
