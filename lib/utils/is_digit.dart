extension NumberParsing on String {
  bool isDigit() {
    return int.tryParse(this) != null;
  }
}

