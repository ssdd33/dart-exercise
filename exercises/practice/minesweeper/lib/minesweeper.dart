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
if(square[row][col]=='*'){
    annotatedMap[row].insert(col, '*');
    continue;
}

        int mineCount = 0;

        if (col != 0) {
          mineCount += mineToInt(row, col - 1);
          if (row != 0) {
            mineCount += mineToInt(row - 1, col);
            mineCount += mineToInt(row - 1, col - 1);
          }
          if (row != rowLength - 1) {
            mineCount += mineToInt(row + 1, col - 1);
            mineCount += mineToInt(row + 1, col);
          }
        }
        if (col != colLength - 1) {
          mineCount += mineToInt(row, col + 1);
          if (row != 0) {
            mineCount += mineToInt(row - 1, col + 1);
          }
          if (row != rowLength - 1) {
            mineCount += mineToInt(row + 1, col + 1);
          }
        }

        if (mineCount != 0) {
          annotatedMap[row].insert(col, mineCount.toString());
        }
      }
    }

  List<String> annotatedArray = annotatedMap.map((array)=>{String string = array.join(''); return string;}).toList();
  }

  int mineToInt(int row, int col) {
    return square[row][col - 1] == '*' ? 1 : 0;
  }
}
