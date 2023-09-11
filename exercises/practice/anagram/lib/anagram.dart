class Anagram {
  List<String> findAnagrams(String word, List<String> words) {
    final List<String> list = [];

    bool _isAnagram(String word2) {
      if (word.length != word2.length ||
          word.toLowerCase() == word2.toLowerCase()) return false;

      List<String> chars1 = word.toLowerCase().split('');
      word2 = word2.toLowerCase();

      for (int i = 0; i < word2.length; i++) {
        int indexOfChar = chars1.indexOf(word2[i]);
        if (indexOfChar < 0) return false;
        chars1.removeAt(indexOfChar);
      }

      return true;
    }

    words.forEach((w) => {
          if (_isAnagram(w)) {list.add(w)}
        });
    return list;
  }
}
