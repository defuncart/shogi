/// A collection of useful util methods
class DartUtils {
  /// Returns `value` from `Enum.value`
  ///
  /// Taken from Flutter foundation https://api.flutter.dev/flutter/foundation/describeEnum.html
  static String describeEnum(Object enumEntry) {
    final description = enumEntry.toString();
    final indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }

  /// Compares two lists for deep equality.
  /// Returns true if the lists are both null, or if they are both non-null, have the same length, and contain the same members in the same order. Returns false otherwise.
  ///
  /// The term "deep" above refers to the first level of equality: if the elements are maps, lists, sets, or other collections/composite objects, then the values of those elements are not compared element by element unless their equality operators (Object.==) do so.
  ///
  /// Taken from Flutter foundation https://api.flutter.dev/flutter/foundation/listEquals.html
  static bool listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) {
      return b == null;
    }
    if (b == null || a.length != b.length) {
      return false;
    }
    if (identical(a, b)) {
      return true;
    }
    for (var index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) {
        return false;
      }
    }
    return true;
  }
}
