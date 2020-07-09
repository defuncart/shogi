import 'package:shogi/src/utils/dart_utils.dart';
import 'package:test/test.dart';

enum _TestEnum {
  value1,
  value2,
}

main() {
  test('describeEnum', () {
    expect(DartUtils.describeEnum(_TestEnum.value1), 'value1');
    expect(DartUtils.describeEnum(_TestEnum.value2), 'value2');
  });
}
