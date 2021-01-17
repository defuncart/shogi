import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('Null', () {
    final gameBoard = GameBoard(boardPieces: null);
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isEmpty);
    expect(gameBoard.sentePiecesInHand, isEmpty);
    expect(gameBoard.gotePiecesInHand, isEmpty);
  });

  test('Empty', () {
    final gameBoard = GameBoard(boardPieces: []);
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isEmpty);
    expect(gameBoard.sentePiecesInHand, isEmpty);
    expect(gameBoard.gotePiecesInHand, isEmpty);
  });

  test('Equality', () {
    final gameBoard1 = GameBoard(boardPieces: [
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.sente,
        position: Position.fromString('97'),
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.gote,
        position: Position.fromString('13'),
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.sente,
        position: null,
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.gote,
        position: null,
      ),
    ]);
    final gameBoard2 = GameBoard(boardPieces: [
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.sente,
        position: Position.fromString('97'),
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.gote,
        position: Position.fromString('13'),
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.sente,
        position: null,
      ),
      BoardPiece(
        pieceType: PieceType.pawn,
        player: PlayerType.gote,
        position: null,
      ),
    ]);
    expect(gameBoard1, isNotNull);
    expect(gameBoard2, isNotNull);
    expect(gameBoard1, gameBoard2);
  });
}
