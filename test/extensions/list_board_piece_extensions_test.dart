import 'package:meta/meta.dart';
import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

main() {
  final boardPieces = ShogiUtils.initialBoard.boardPieces;

  void _testPosition({
    @required int column,
    @required int row,
    @required PieceType pieceType,
    playerType = PlayerType.sente,
  }) {
    final boardPiece = boardPieces.pieceAtPosition(column: column, row: row);
    expect(
      boardPiece,
      BoardPiece(pieceType: pieceType, player: playerType, position: Position(column: column, row: row)),
    );
  }

  test('99', () => _testPosition(column: 9, row: 9, playerType: PlayerType.sente, pieceType: PieceType.lance));
  test('89', () => _testPosition(column: 8, row: 9, playerType: PlayerType.sente, pieceType: PieceType.knight));
  test('79', () => _testPosition(column: 7, row: 9, playerType: PlayerType.sente, pieceType: PieceType.silver));
  test('69', () => _testPosition(column: 6, row: 9, playerType: PlayerType.sente, pieceType: PieceType.gold));
  test('59', () => _testPosition(column: 5, row: 9, playerType: PlayerType.sente, pieceType: PieceType.king));
  test('49', () => _testPosition(column: 4, row: 9, playerType: PlayerType.sente, pieceType: PieceType.gold));
  test('39', () => _testPosition(column: 3, row: 9, playerType: PlayerType.sente, pieceType: PieceType.silver));
  test('29', () => _testPosition(column: 2, row: 9, playerType: PlayerType.sente, pieceType: PieceType.knight));
  test('19', () => _testPosition(column: 1, row: 9, playerType: PlayerType.sente, pieceType: PieceType.lance));

  test('no piece', () {
    final boardPiece = boardPieces.pieceAtPosition(column: 5, row: 5);
    expect(boardPiece, isNull);
  });

  test('out of bounds', () {
    final boardPiece = boardPieces.pieceAtPosition(column: 10, row: 10);
    expect(boardPiece, isNull);
  });
}
