class PascalsTriangle {
  List<List<int>> rows(int count) {
/*                   0
                <int>[1], 1
              <int>[1, 1], 2
            <int>[1, 2, 1], 3
          <int>[1, 3, 3, 1], 4
        <int>[1, 4, 6, 4, 1], 5
      <int>[1, 5, 10, 10, 5, 1]

triangle[3-1][1] = triangle[2-1][0] + triangle[2-1][1]
triangle[4-1][1] = triangle[3-1][1-1] + triangle[3-1][1-0]
triangle[4-1][2] = triangle[3-1][2-1] + triangle[3-1][2-0]
triangle[5-1][1] = triangle[3-1][2-1] + triangle[3-1][2-0]


*/

    List<List<int>> result = [];

    for (int rowIndex = 1; rowIndex <= count; rowIndex++) {
      List<int> row = [];
      for (int i = 1; i <= rowIndex; i++) {
        //make row
        if (1 == i || i == rowIndex) {
          row.add(1);
        } else {
          int number =
              result[rowIndex - 2][i - 2] + result[rowIndex - 2][i - 1];

          row.add(number);
        }

        //add row to triangle
      }
      result.add(row);
    }

    return result;
  }
}
