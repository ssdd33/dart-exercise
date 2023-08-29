// Your code here
String translate(String phrase) {
/*
0. split to words

each word
1. check if word start with consonant, consonant cluster and also 'qu' but 'xr', 'yt'
  0. cluster = '';
  a. if its not [a,e,i,o,u]
1.1 relocate cluster to the end of the word
2. add 'ay' at the end of the word  
*/
  List<String> words = phrase.split(' ');

  print('words $words');
  RegExp clusterMatch =
      RegExp(r'^(qu|((?!xr|yt)[^yaeio]qu)|(((?!xr|yt)[^aeiou])[^aeiouy]*))');

  final newWords = words.map((word) {
    final cluster = clusterMatch.firstMatch(word)?.group(0);
    print(cluster);
    if (cluster != null) {
      return '${word.substring(cluster.length, word.length)}${cluster}ay';
    }
    print(word);
    return '${word}ay';
  }).toList();

  print(newWords);
  return newWords.length == 1 ? newWords[0] : newWords.join(' ');
}
