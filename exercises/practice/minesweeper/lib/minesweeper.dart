class Minesweeper {
  List<String> square;
  Minesweeper(
    this.square,
  );

  List<String> annotated() {
    /*
    0. create map same length with square and filled with ' '
    1. get adjacent positions
    2. check if position has mine
    3. insert number at same position of map
    4. join map array 
    */

    int rowLength = square.length;
    int colLength = square[0].length;

    final annotatedMap = List.filled(rowLength, List.filled(colLength, ' '));

    for (int row = 0; row < rowLength; row++) {
      for (int col = 0; col < colLength; col++) {
        if (square[row][col] == '*') {
          annotatedMap[row].insert(col, '*');
          continue;
        }

        int mineCount = 0;

        for (int checkRow = row - 1; checkRow <= row + 1; checkRow++) {
          for (int checkCol = col - 1; checkCol <= col + 1; checkCol++) {
            if (checkRow == row && checkCol == col) continue;

            if (checkRow < 0 ||
                checkRow > rowLength - 1 ||
                checkCol < 0 ||
                checkCol > colLength - 1) continue;

            mineCount += mineToInt(checkRow, checkCol);
          }
        }

        if (mineCount != 0) {
          annotatedMap[row].insert(col, mineCount.toString());
        }
      }
    }

    final strArray = annotatedMap.map((array) => array.join(''));

    List<String> result = List<String>.from(strArray);

    return result;
  }

  int mineToInt(int row, int col) {
    return square[row][col] == '*' ? 1 : 0;
  }
}
