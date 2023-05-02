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
  };

  void evaluate(String subset) {
    words = subset.split(' ');

    if (words[0] == ':') {
      if (isNumeric(words[1])) {
        throwsInvalidDefinition();
      }
      String lowcaseWord = words[1].toLowerCase();
      commands[lowcaseWord] = words
          .sublist(2, words.length - 1)
          .map<String>((word) {
            String lowcaseWord = word.toLowerCase();
            return commands[lowcaseWord] != null
                ? commands[lowcaseWord]!
                : lowcaseWord;
          })
          .toList()
          .join(' ');
      return;
    }

    while (words.length > 0) {
      String currentWord = words.removeAt(0);

      if (isNumeric(currentWord)) {
        stack.add(int.parse(currentWord));
        continue;
      } else {
        try {
          operate(currentWord);
        } catch (e) {
          throw (e);
        }
      }
    }
  }

  void throwsEmptyStack() {
    throw (Exception('Stack empty'));
  }

  void throwsInvalidDefinition() {
    throw (Exception('Invalid definition'));
  }

  void throwsUnknownCommands() {
    throw (Exception('Unknown command'));
  }

  void throwsDivisionByZero() {
    throw (Exception('Division by zero'));
  }

  bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  void operate(String operator) {
    String lowCaseOperator = operator.toLowerCase();
    String? command = commands[lowCaseOperator];

    switch (command) {
      case 'swap':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();

        stack.addAll([num1, num2]);
        break;

      case 'over':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();
        stack.addAll([num2, num1, num2]);
        break;

      case '+':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();
        stack.add(num1 + num2);
        break;
      case '-':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();
        stack.add(num2 - num1);
        break;
      case '*':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();
        stack.add(num1 * num2);
        break;
      case '/':
        if (stack.length < 2) {
          throwsEmptyStack();
        }
        int num1 = stack.removeLast();
        int num2 = stack.removeLast();
        if (num1 == 0) {
          throwsDivisionByZero();
        }
        stack.add(num2 ~/ num1);
        break;
      case 'drop':
        if (stack.length == 0) {
          throwsEmptyStack();
        }
        stack.removeLast();
        break;
      case 'dup':
        if (stack.length == 0) {
          throwsEmptyStack();
        }
        stack.add(stack[stack.length - 1]);

        break;
      default:
        if (command != null) {
          words = [...command.split(' '), ...words];
        } else {
          throwsUnknownCommands();
        }
    }
  }
}
