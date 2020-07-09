import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

main() {
  final converter = CustomNotationConverter();

  test('movesFromFile: test against null input', () {
    final moves = converter.movesFromFile(null);
    expect(moves, isNull);
  });

  test('movesFromFile: test against empty input', () {
    final moves = converter.movesFromFile('');
    expect(moves, isNotNull);
    expect(moves, []);
    // expect(moves.length, 0);
  });

  test('movesFromFile: test against incorrect input', () {
    final moves = converter.movesFromFile('bla');
    expect(moves, isNotNull);
    expect(moves, []);
    // expect(moves.length, 0);
  });

  test('movesFromFile: test against incorrect & correct input', () {
    final game = """
1: ☗P77-76
bla
""";
    final moves = converter.movesFromFile(game);
    expect(moves, isNotNull);
    expect(moves.length, 1);
    final move = moves.first;
    expect(move.player, PlayerType.sente);
    expect(move.piece, PieceType.pawn);
    expect(move.from, Position(column: 7, row: 7));
    expect(move.to, Position(column: 7, row: 6));
  });
}
