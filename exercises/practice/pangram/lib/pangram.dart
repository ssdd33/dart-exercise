class Pangram {
  bool isPangram(String sentence) {
    /*
 
 -check if its empty string 

    - toLowercase all the letters
    - make set with letters 
    - filter if letters ascii code  is contained in 97~ 122 
    - check if set length is 26

    */

    final letterSet = {...sentence.toLowerCase().split('')};

    if (letterSet.length < 26) return false;

    final asciiCodes = letterSet.join().codeUnits.toList();
    asciiCodes.sort((a, b) => a - b);
    bool isAExist = false;
    bool isZExist = false;
    for (int i = 0; i < asciiCodes.length; i++) {
      int code = asciiCodes[i];
      if (code == 97) {
        isAExist = true;
      }
      if (code == 122) {
        isZExist = true;
      }
      if (code > 97 && code < 122 && i + 1 < asciiCodes.length) {
        if (code != asciiCodes[i + 1] - 1) {
          return false;
        }
      }
    }

    return isAExist && isZExist;
  }
}
