/// A collection of useful util methods
class DartUtils {
  /// Returns `value` from `Enum.value`
  ///
  /// Taken from Flutter foundation.
  static String describeEnum(Object enumEntry) {
    final description = enumEntry.toString();
    final indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }
}
