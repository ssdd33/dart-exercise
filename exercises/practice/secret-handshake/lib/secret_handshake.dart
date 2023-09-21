//TODO try to use shift operator
class SecretHandshake {
  List<String> actions = ['wink', 'double blink', 'close your eyes', 'jump'];
  List<String> commands(int num) {
    List<String> result = <String>[];
    int index = 0;
    int currentNum = num;
    if (currentNum > 0) {
      while (currentNum > 1) {
        if (currentNum % 2 == 1) {
          result.add(actions[index]);
        }
        currentNum = (currentNum / 2).floor();
        index++;
      }
      if (index < 4) {
        result.add(actions[index]);
      } else {
        result = result.reversed.toList();
      }
    }

    return result;
  }
}
