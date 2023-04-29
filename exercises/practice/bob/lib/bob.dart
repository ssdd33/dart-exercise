class Bob {
  String response(String words) {
    if (words.replaceAll(RegExp(r'\r|\t|\n'), '').trim() == '') {
      return "Fine. Be that way!";
    }
    if (words == words.toUpperCase() && words != words.toLowerCase()) {
      if (words.trim()[words.length - 1] == '?') {
        return "Calm down, I know what I'm doing!";
      } else {
        return "Whoa, chill out!";
      }
    }
    if (words.trim()[words.trim().length - 1] == '?') {
      return "Sure.";
    }

    return "Whatever.";
  }
}
