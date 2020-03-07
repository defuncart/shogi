/// A class of extension methods for String
extension StringExtensions on String {
  /// Returns whether a string is null or empty
  bool get isNullOrEmpty => this == null || this.isEmpty;

  /// Returns the first character of the string
  ///
  /// Returns `null` is the string is null or empty
  String get first => this.isNullOrEmpty ? null : this[0];

  /// Returns the last character of the string
  ///
  /// Returns `null` is the string is null or empty
  String get last => this.isNullOrEmpty ? null : this[this.length - 1];

  /// Returns whether the string is a single character
  bool get isSingleCharacter => this.isNullOrEmpty ? false : this.length == 1;

  /// Checks if the first character is upper case
  bool get isUpperCase {
    if (this == null || this.isEmpty || this.trim().isEmpty) {
      return false;
    }

    final firstLetter = this.first;
    return firstLetter.toUpperCase() == firstLetter;
  }
}
