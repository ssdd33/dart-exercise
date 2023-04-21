import 'dart:math';

class Allergies {
  List<String> substances = [
    'eggs',
    'peanuts',
    'shellfish',
    'strawberries',
    'tomatoes',
    'chocolate',
    'pollen',
    'cats'
  ];

  bool allergicTo(String allergen, int totalScore) {
    List<num> scores = substances
        .map<num>((allegen) => pow(2, substances.indexOf(allegen)))
        .toList();
    List<num> smallers = scores.where((score) => score <= totalScore).toList();

    while (smallers.length != 0) {
      int lastScore = smallers.removeLast().toInt();
      int indexOfLastScore = smallers.length;
      if (substances[indexOfLastScore] == allergen) {
        return true;
      }
      totalScore -= lastScore;
    }

    return false;
  }

  List<String> list(int totalScore) {
    List<String> list = [];
    List<num> scores = substances
        .map<num>((allegen) => pow(2, substances.indexOf(allegen)))
        .toList();
    List<num> smallers = scores.where((score) => score <= totalScore).toList();

    while (smallers.length != 0) {
      int lastScore = smallers.removeLast().toInt();
      int indexOfLastScore = smallers.length;
      list.add(substances[indexOfLastScore]);
      totalScore -= lastScore;
    }

    return list;
  }
}
