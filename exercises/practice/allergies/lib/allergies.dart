// import 'dart:math';

// class Allergies {
//   List<String> substances = [
//     'eggs',
//     'peanuts',
//     'shellfish',
//     'strawberries',
//     'tomatoes',
//     'chocolate',
//     'pollen',
//     'cats'
//   ];

//   bool allergicTo(String allergen, int totalScore) {
//     List<num> scores = substances
//         .map<num>((allegen) => pow(2, substances.indexOf(allegen)))
//         .toList();
//     List<num> smallers = scores.where((score) => score <= totalScore).toList();

//     while (smallers.length != 0) {
//       int lastScore = smallers.removeLast().toInt();
//       int indexOfLastScore = smallers.length;
//       if (substances[indexOfLastScore] == allergen) {
//         return true;
//       }
//       totalScore -= lastScore;
//     }

//     return false;
//   }

//   List<String> list(int totalScore) {
//     List<String> list = [];
//     List<num> scores = substances
//         .map<num>((allegen) => pow(2, substances.indexOf(allegen)))
//         .toList();
//     List<num> smallers = scores.where((score) => score <= totalScore).toList();

//     while (smallers.length != 0) {
//       int lastScore = smallers.removeLast().toInt();
//       int indexOfLastScore = smallers.length;
//       list.add(substances[indexOfLastScore]);
//       totalScore -= lastScore;
//     }

//     return list;
//   }
// }

class Allergies {
  final substances = [
    'eggs',
    'peanuts',
    'shellfish',
    'strawberries',
    'tomatoes',
    'chocolate',
    'pollen',
    'cats'
  ];

  bool allergicTo(String item, int score) {
    int index = substances.indexOf(item);
    print(
        's:$score, i:$index, s>>i:${score >> index}  s>>i&1:${(score >> index) & 1}, s>>1:${score >> 1} ');
    return ((score >> index) & 1) == 1;
  }

  List<String> list(int score) =>
      substances.where((t) => allergicTo(t, score)).toList();
}
