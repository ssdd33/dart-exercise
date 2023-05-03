class Hamming {
  // Put your code here
  int distance(String dna1, String dna2) {
    if (dna1.length != dna2.length) {
      throw ArgumentError('strands must be of equal length');
    }

    if (dna1.allMatches(dna2).length != 0) {
      return 0;
    }
    int distance = 0;
    dna1.split('').asMap().forEach((key, value) {
      if (value != dna2[key]) {
        distance++;
      }
    });

    return distance;
  }
}
