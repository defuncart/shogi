import 'package:flutter_test/flutter_test.dart';
import 'package:shogi/src/utils/dart_utils.dart';

enum TestEnum {
  value1,
  value2,
}

main() {
  test('describeEnum', () {
    final describeEnum = DartUtils.describeEnum(TestEnum.value1);
    expect(describeEnum, 'value1');
  });
}
