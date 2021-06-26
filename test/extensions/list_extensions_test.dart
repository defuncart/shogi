import 'package:shogi/src/extensions/list_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('Int array, no duplicates', () {
    final list = [1, 2, 3, 4, 5];
    final map = list.convertToMapWithCountUniqueElements();
    expect(map, {1: 1, 2: 1, 3: 1, 4: 1, 5: 1});
  });

  test('Int array, duplicates', () {
    final list = [1, 2, 2, 1, 3];
    final map = list.convertToMapWithCountUniqueElements();
    expect(map, {1: 2, 2: 2, 3: 1});
  });
}
