import 'dart:math';

class NthPrime {
  static final _primeList = <int>[2];

  int prime(int nth) {
    // 2,3,5,7,11,13...
    /*
    return primeList[nth]
    if nth is bigger than primeList length
  traverse  from last element of primeList
 
  try if its divided by each divisor from self to squared self
  if divied countinue with next number
  if  its last divisor and its not divided then its prime num!

    */
    if (nth == 0) {
      throw ArgumentError('Invalid argument(s): There is no zeroth prime');
    } else {
      if (nth <= _primeList.length) return _primeList[nth - 1];

      int currentNum = _primeList.last;
      double sqrtNum = sqrt(currentNum);

      while (_primeList.length < nth) {
        currentNum++;
        for (int divisor = currentNum; divisor < sqrtNum; divisor++) {
          if (currentNum % divisor == 0) {
            break;
          } else if (divisor + 1 >= sqrtNum) {
            print(currentNum);
            _primeList.add(currentNum);
          }
        }
      }
      return _primeList[nth];
    }
  }
}
