class Luhn {
  bool valid(String nums) {
    /*
  1.check if its shorter than 2
  2.if length is odd check every odd index , and if length is even check every even index
  4. check if its nan
  5.if num*9 > 9 subtract 9 and sum 
  6. check if sum is evenly divisible by 10
  */

    String parsed = nums.replaceAll(' ', '');
    if (parsed.length < 2) {
      return false;
    }
    int sum = 0;
    for (int i = 0; i < parsed.length; i++) {
      if (double.tryParse(parsed[i]) == null) {
        return false;
      }
      if (i % 2 == parsed.length % 2) {
        int doubbled = int.parse(parsed[i]) * 2;
        if (doubbled > 9) {
          doubbled -= 9;
        }
        sum += doubbled;
      } else {
        sum += int.parse(parsed[i]);
      }
    }

    return sum % 10 == 0;
  }
}
