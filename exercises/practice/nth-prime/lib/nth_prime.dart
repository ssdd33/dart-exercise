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
      throw ArgumentError('There is no zeroth prime');
    } else {
      if (nth > _primeList.length) {
        int currentNum = _primeList.last + 1;

        while (_primeList.length < nth) {
          for (int i = 0; i < _primeList.length; i++) {
            if (currentNum % _primeList[i] == 0) {
              break;
            }
            if (i == _primeList.length - 1 &&
                currentNum % _primeList.last != 0) {
              _primeList.add(currentNum);
            }
          }
          currentNum++;
        }
      }

      return _primeList[nth - 1];
    }
  }
}
