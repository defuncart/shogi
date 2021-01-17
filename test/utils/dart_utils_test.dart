import 'package:shogi/src/utils/dart_utils.dart';
import 'package:test/test.dart';

enum _TestEnum {
  value1,
  value2,
}

void main() {
  test('describeEnum', () {
    expect(DartUtils.describeEnum(_TestEnum.value1), 'value1');
    expect(DartUtils.describeEnum(_TestEnum.value2), 'value2');
  });

  test('listEquals', () {
    expect(DartUtils.listEquals(null, null), isTrue);
    expect(DartUtils.listEquals([1], null), isFalse);
    expect(DartUtils.listEquals(null, [1]), isFalse);
    expect([1] == [1], isFalse);
    expect(DartUtils.listEquals([1], [1]), isTrue);
    expect(
        DartUtils.listEquals(
          [
            [1]
          ],
          [
            [1]
          ],
        ),
        isFalse); //list of lists not considered
  });
}
