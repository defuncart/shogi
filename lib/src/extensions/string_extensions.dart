/// A class of extension methods for String
extension StringExtensions on String {
  /// Returns whether a string is null or empty
  bool get isNullOrEmpty => this == null || isEmpty;

  /// Returns the first character of the string
  ///
  /// Returns `null` is the string is null or empty
  String get first => isNullOrEmpty ? null : this[0];

  /// Returns the last character of the string
  ///
  /// Returns `null` is the string is null or empty
  String get last => isNullOrEmpty ? null : this[length - 1];

  /// Returns whether the string is a single character
  bool get isSingleCharacter => isNullOrEmpty ? false : length == 1;

  /// Checks if the first character is upper case
  bool get isUpperCase {
    if (this == null || isEmpty || trim().isEmpty) {
      return false;
    }

    final firstLetter = first;
    return firstLetter.toUpperCase() == firstLetter;
  }

  /// Checks if the first character is lower case
  bool get isLowerCase {
    if (this == null || isEmpty || trim().isEmpty) {
      return false;
    }

    final firstLetter = first;
    return firstLetter.toLowerCase() == firstLetter;
  }
}
