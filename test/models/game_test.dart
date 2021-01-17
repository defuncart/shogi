import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('Valid kif', () {
    final kifu = '''
手合割：平手
先手
後手　

手数----指手----消費時間--
   1 ７六歩(77)
   2 ３四歩(33)
   3 ２二角成(88)
   4 同　銀(31)
   5 投了
''';
    final game = Game.fromKif(kifu);
    expect(game, isNotNull);
    expect(game.gameBoards, isNotNull);
    expect(game.gameBoards, isNotEmpty);
    expect(game.winner, isNotNull);
  });

  test('Null kif', () {
    final game = Game.fromKif(null);
    expect(game, isNull);
  });

  test('Invalid kif', () {
    final game = Game.fromKif('bla');
    expect(game, isNull);
  });
}
