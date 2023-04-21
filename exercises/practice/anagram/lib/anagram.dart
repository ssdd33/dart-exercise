class Anagram {
  List<String> findAnagrams(String word, List<String> words) {
    final List<String> list = [];
    int getTotalUniPoint(String word) {
      return word.runes.fold<int>(0, (p, e) => p + e);
    }

    int wordPoints = getTotalUniPoint(word);
    words.forEach((w) => {
          if (getTotalUniPoint(w) == wordPoints) {list.add(w)}
        });
    return list;
  }
}
