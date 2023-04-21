class Acronym {
  String abreviate(String fullString) {
    List<String> words = fullString.split(' ');
    String acronym = words.reduce((value, element) => value + element[0]);
    return acronym;
  }
}
