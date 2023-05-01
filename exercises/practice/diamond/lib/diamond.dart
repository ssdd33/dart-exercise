class Diamond {
  List<String> rows(String alphabet) {
    int ascii = alphabet.codeUnitAt(0);
    final rows = <String>[];
    StringBuffer rowString = StringBuffer();
    if (alphabet == 'A') {
      rows.add(alphabet);
      return rows;
    }

    for (var row = ascii - 65; row >= 0; row--) {
      String curAlphabet = String.fromCharCode(65 + row);
      if (row == 0) {
        rowString.writeAll(List<String>.filled(ascii - 65, ' '));
        rowString.write(curAlphabet);
        rowString.writeAll(List<String>.filled(ascii - 65, ' '));
        rows.add(rowString.toString());
        rows.insert(0, rowString.toString());
        rowString.clear();
      } else if (row == ascii - 65) {
        rowString.write(curAlphabet);
        rowString.writeAll(List<String>.filled(row * 2 - 1, ' '));
        rowString.write(curAlphabet);
        rows.add(rowString.toString());
        rowString.clear();
      } else {
        rowString.writeAll(List<String>.filled(ascii - (row + 65), ' '));
        rowString.write(curAlphabet);
        rowString.writeAll(List<String>.filled(row * 2 - 1, ' '));
        rowString.write(curAlphabet);
        rowString.writeAll(List<String>.filled(ascii - (row + 65), ' '));
        rows.add(rowString.toString());

        rows.insert(0, rowString.toString());

        rowString.clear();
      }
    }

    return rows;
  }
}
