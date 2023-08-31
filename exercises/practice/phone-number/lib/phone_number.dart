class PhoneNumber {
  String clean(String phoneNumber) {
/*

0.remove ().-+ and spaces
1. check if there is nan
 - letter : 'letters not permitted'
 - punctuation : 'punctuations not permitted'


- length >11 : 'more than 11 digits'
- length == 11 
 -> check country code : '11 digits must start with 1' [0]
 -> check area code [1]
 -> check exchange code [4]
- length <10 :'incorrect number of digits',
- length ==10 :  
 -> check [0]
 -> check [3]

 all pass -> return 10digit from end of phoneNumber
*/

    Map<String, String> digitToWord = {'0': 'zero', '1': 'one'};
    List<String> unAcceptableDigits = ['0', '1'];

    RegExp checkPunc = RegExp(r'[()\-+\.]|\s+');

    final digits = phoneNumber.replaceAll(checkPunc, "");
    print(phoneNumber);
    print(digits);

    if (RegExp(r'[a-zA-Z]+').allMatches(digits).isNotEmpty) {
      throw _throwFormatException('letters not permitted');
    }
    if (RegExp(r'\W+').allMatches(digits).isNotEmpty) {
      throw _throwFormatException('punctuations not permitted');
    }

    if (digits.length > 11) {
      throw _throwFormatException('more than 11 digits');
    }
    if (digits.length == 11) {
      String countryCode = digits[0];
      String firstOfAreaCode = digits[1];
      String firstOfExchangeCode = digits[4];

      if (countryCode != '1') {
        throw _throwFormatException('11 digits must start with 1');
      }
      if (unAcceptableDigits.contains(firstOfAreaCode)) {
        throw _throwFormatException(
            'area code cannot start with ${digitToWord[firstOfAreaCode]}');
      }

      if (unAcceptableDigits.contains(firstOfExchangeCode)) {
        throw _throwFormatException(
            'exchange code cannot start with ${digitToWord[firstOfExchangeCode]}');
      }

      return digits.substring(1);
    }

    if (digits.length < 10) {
      throw _throwFormatException('incorrect number of digits');
    } else {
      String firstOfAreaCode = digits[0];
      String firstOfExchangeCode = digits[3];

      if (unAcceptableDigits.contains(firstOfAreaCode)) {
        throw _throwFormatException(
            'area code cannot start with ${digitToWord[firstOfAreaCode]}');
      }

      if (unAcceptableDigits.contains(firstOfExchangeCode)) {
        throw _throwFormatException(
            'exchange code cannot start with ${digitToWord[firstOfExchangeCode]}');
      }
      return digits;
    }
  }

  FormatException _throwFormatException(String message) {
    return FormatException(message);
  }
}
