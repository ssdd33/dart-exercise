class Forth {
  final stack = <int>[];
  List<String> words = [];

  Map<String, String> commands = {
    'swap': 'swap',
    'dup': 'dup',
    'over': 'over',
    'drop': 'drop',
    '+': '+',
    '-': '-',
    '*': '*',
    '/': '/',
    ':': ':'
  };

  void evaluate(String subset) {
    words = subset.split(' ');

    if (words[0] == ':') {
      commands[words[0]] = words.sublist(1, words.length - 2).join(' ');
    }

    while (words.length > 0) {
      String currentWord = words.removeAt(0);

      if (isNumeric(currentWord)) {
        stack.add(int.parse(currentWord));
        continue;
      } else {
        try {
          operate(currentWord);
        } on Exception {
          rethrow;
        }
      }
    }
  }

  Exception throwsEmptyStack() {
    throw (Exception('Exception: Stack empty'));
  }

  Exception throwsInvalidDefinition() {
    throw (Exception('Exception: Invalid definition'));
  }

  Exception throwsUnknownCommands() {
    throw (Exception('Exception: Unknown command'));
  }

  bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  void operate(String operator) {
    String lowCaseOperator = operator.toLowerCase();
    String? command = commands[lowCaseOperator];

    if (command != 'drop') {
      if (stack.length < 2) {
        throwsEmptyStack();
      }
      int num1 = stack.removeLast();
      int num2 = stack.removeLast();
      switch (command) {
        case 'swap':
          stack.addAll([num1, num2]);
          break;

        case 'over':
          stack.add(stack[stack.length - 2]);
          break;

        case 'dup':
          stack.add(stack[stack.length - 1]);
          break;

        case '+':
          stack.add(num1 + num2);
          break;
        case '-':
          stack.add(num1 - num2);
          break;
        case '*':
          stack.add(num1 * num2);
          break;
        case '/':
          stack.add(num1 ~/ num2);
          break;
        default:
          {
            if (command != null) {
              words = [...command.split(' '), ...words];
            } else {
              throwsUnknownCommands();
            }
          }
      }
    } else {
      if (stack.length == 0) {
        throwsEmptyStack();
      } else {
        stack.removeLast();
      }
    }
  }
}
