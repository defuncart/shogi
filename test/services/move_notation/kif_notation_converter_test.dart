import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  final converter = KIFNotationConverter();

  test('Valid format', () {
    final kifu = '''
手合割：平手
先手：
後手：

手数----指手----消費時間--
   1 ７六歩(77)
   2 ３四歩(33)
   3 ２二角成(88)
   4 同　銀(31)
   5 １五角打
''';
    final moves = converter.movesFromFile(kifu);
    expect(moves, isNotNull);
    expect(moves.length, 5);
    expect(moves, [
      Move(
        player: PlayerType.sente,
        piece: PieceType.pawn,
        from: Position.fromString('77'),
        to: Position.fromString('76'),
        isCapture: false,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.gote,
        piece: PieceType.pawn,
        from: Position.fromString('33'),
        to: Position.fromString('34'),
        isCapture: false,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.sente,
        piece: PieceType.bishop,
        from: Position.fromString('88'),
        to: Position.fromString('22'),
        isCapture: true,
        isDrop: false,
        isPromotion: true,
      ),
      Move(
        player: PlayerType.gote,
        piece: PieceType.silver,
        from: Position.fromString('31'),
        to: Position.fromString('22'),
        isCapture: true,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.sente,
        piece: PieceType.bishop,
        from: null,
        to: Position.fromString('15'),
        isCapture: false,
        isDrop: true,
        isPromotion: false,
      ),
    ]);
  });

  test('Invalid format', () {
    final kifu = '''
初期局面
1: ☗７六歩
    2 歩(33)
    3 ２二成(88)
4: ☖同銀
''';
    final moves = converter.movesFromFile(kifu);
    expect(moves, isEmpty);
  });

  test('determineWinner', () {
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
    final winner = converter.determineWinner(kifu);
    expect(winner, PlayerType.gote);
  });

  test('movesAsText', () {
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
    final movesAsText = converter.movesAsText(kifu);
    expect(movesAsText, isNotNull);
    expect(movesAsText.length, 4);
  });
}
