class Pangram {
  // Put your code here
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

    final asciiCodes = letterSet.join().codeUnits;

    for (int i = 0; i < asciiCodes.length; i++) {
      int code = asciiCodes[i];
      if (code < 97 || code > 122) return false;
    }

    return true;
  }
}
