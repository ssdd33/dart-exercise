// Put your code here
double score(String letter) {
/*```text
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

'65-90'

```
*/
  final List<int> values = List<int>.filled(26, 0);

  void storeValue(String letters, int value) {
    letters.codeUnits.forEach((i) => values[i - 65] = value);
  }

  storeValue("AEIOULNRST", 1);
  storeValue("DG", 2);
  storeValue("BCMP", 3);
  storeValue("FHVWY", 4);
  storeValue("K", 5);
  storeValue("JX", 8);
  storeValue("QZ", 10);

  return letter.toUpperCase().codeUnits.fold(0, (p, c) => p + values[c - 65]);
}
