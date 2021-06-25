import 'package:shogi/src/services/parser/game_parser.dart';
import 'package:test/test.dart';

void main() {
  final invalid = '''
手合割：平手
先手：
後手：

手数----指手----消費時間--
  ''';

  test('When invalid kif, expect argument error', () {
    expect(
      () => GameParser.fromKif(invalid),
      throwsArgumentError,
    );
  });
}
