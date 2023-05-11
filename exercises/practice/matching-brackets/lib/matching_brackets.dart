class MatchingBrackets {
  bool isPaired(String string) {
    RegExp r = RegExp(r'\s|[^\(\)\{\}\[\]]');
    String str = string.replaceAll(r, '');

    Map<String, String> pairs = {"(": ")", "{": "}", "[": "]"};
    final stack = <String>[];

    for (int i = 0; i < str.length; i++) {
      String? pairBracket = pairs[str[i]];

      if (pairBracket != null) {
        stack.add(pairBracket);
      } else {
        String stackTop = '';
        try {
          stackTop = stack.removeLast();
          if (stackTop != str[i]) {
            throw (Error);
          }
        } catch (e) {
          return false;
        }
      }
    }

    return stack.length == 0;
  }
}
