import 'dart:math';

class HighScores {
  List<int> scores;
  HighScores(
    this.scores,
  );

  int latest() {
    return scores[scores.length - 1];
  }

  int personalBest() {
    return scores.reduce((value, element) => max(value, element));
  }

  List<int> personalTopThree() {
    List<int> copy = [...scores];
    copy.sort((a, b) => -(a.compareTo(b)));
    return copy.length < 3 ? copy : copy.sublist(0, 3);
  }
}
