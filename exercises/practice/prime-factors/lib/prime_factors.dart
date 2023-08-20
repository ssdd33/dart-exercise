class PrimeFactors {
  List<int> factors(int Num) {
/*

1. number=Num , divisor =2, factors = [];
2. while Num = 1;
if(num%divisor ==0) factors.add(divisor) 
else divisor ++; 
3. return factors

*/

    int number = Num;
    int divisor = 2;
    List<int> result = <int>[];

    while (number != 1) {
      if (number % divisor == 0) {
        number = (number / divisor).round();
        result.add(divisor);
      } else {
        divisor++;
      }
    }
    return result;
  }
}
