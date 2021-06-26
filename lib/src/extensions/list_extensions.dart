/// A class of extension methods for List
extension ListExtensions on List {
  /// Converts a List<T> to Map<T, int> with the count of each unique element
  ///
  /// E.g. `[1, 2, 2, 1, 3] => {1:2, 2:2, 3:1}`
  Map<T, int> convertToMapWithCountUniqueElements<T>() {
    final map = <T, int>{};
    for (final value in this) {
      map[value] = (map[value] ?? 0) + 1;
    }

    return map;
  }
}
