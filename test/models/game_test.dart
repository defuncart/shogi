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
    expect(game.moves, isNotNull);
    expect(game.moves, isNotEmpty);
    expect(game.gameBoards.length, game.moves.length + 1);
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

  test('Equality', () {
    final move = Move(
      player: PlayerType.sente,
      piece: PieceType.pawn,
      from: Position.fromString('77'),
      to: Position.fromString('76'),
    );
    final game1 = Game(
      gameBoards: [
        ShogiUtils.initialBoard,
        GameEngine.makeMove(ShogiUtils.initialBoard, move)
      ],
      moves: [move],
    );
    final game2 = Game(
      gameBoards: [
        ShogiUtils.initialBoard,
        GameEngine.makeMove(ShogiUtils.initialBoard, move)
      ],
      moves: [move],
    );
    expect(game1, isNotNull);
    expect(game2, isNotNull);
    expect(game1, game2);
  });
}
