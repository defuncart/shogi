/// A class of extension methods for String
extension StringExtensions on String {
  /// Returns the first character of the string
  String get first => isNotEmpty ? this[0] : this;

  /// Returns the last character of the string
  String get last => isNotEmpty ? this[length - 1] : this;

  /// Returns whether the string is a single character
  bool get isSingleCharacter => length == 1;

  /// Checks if the first character is upper case
  bool get isUpperCase {
    if (isEmpty || trim().isEmpty) {
      return false;
    }

    final firstLetter = first;
    return firstLetter.toUpperCase() == firstLetter;
  }

  /// Checks if the first character is lower case
  bool get isLowerCase {
    if (isEmpty || trim().isEmpty) {
      return false;
    }

    final firstLetter = first;
    return firstLetter.toLowerCase() == firstLetter;
  }
}
