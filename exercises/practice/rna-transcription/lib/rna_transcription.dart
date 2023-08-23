class RnaTranscription {
  /*
  - `G` -> `C`
- `C` -> `G`
- `T` -> `A`
- `A` -> `U`
  
  */
  String toRna(String value) {
    final rnaMap = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'};

    if (value == '') {
      return '';
    }

    return value.split('').map((e) => rnaMap[e]).toList().join('');
  }
}
