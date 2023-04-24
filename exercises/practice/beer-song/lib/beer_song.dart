class BeerSong {
  List<String> recite(int startNum, int verseCount) {
    final List<String> verses = [];
    for (int count = startNum; count > startNum - verseCount; count--) {
      if (count == 2) {
        verses.addAll([
          '2 bottles of beer on the wall, 2 bottles of beer.',
          'Take one down and pass it around, 1 bottle of beer on the wall.',
          '',
        ]);
      } else if (count == 1) {
        verses.addAll([
          '1 bottle of beer on the wall, 1 bottle of beer.',
          'Take it down and pass it around, no more bottles of beer on the wall.',
          '',
        ]);
      } else if (count == 0) {
        verses.addAll([
          'No more bottles of beer on the wall, no more bottles of beer.',
          'Go to the store and buy some more, 99 bottles of beer on the wall.',
          '',
        ]);
      } else {
        verses.addAll([
          '$count bottles of beer on the wall, $count bottles of beer.',
          'Take one down and pass it around, ${count - 1} bottles of beer on the wall.',
          '',
        ]);
      }
    }

    verses.removeLast();
    return verses;
  }
}
