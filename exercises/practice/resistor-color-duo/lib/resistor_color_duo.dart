class ResistorColorDuo {
  List<String> colorList = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];

  int value(List<String> colors) {
    int result = 0;

    if (colors.length > 1) {
      result += colorList.indexOf(colors[0]) * 10;
      result += colorList.indexOf(colors[1]);
    } else {
      result = colorList.indexOf(colors[0]);
    }
    return result;
  }
}
