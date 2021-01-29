import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('Null', () {
    final gameBoard = GameBoard(
      boardPieces: null,
      sentePiecesInHand: null,
      gotePiecesInHand: null,
    );
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isNull);
    expect(gameBoard.sentePiecesInHand, isNull);
    expect(gameBoard.gotePiecesInHand, isNull);
  });

  test('Empty', () {
    final gameBoard = GameBoard(
      boardPieces: [],
      sentePiecesInHand: [],
      gotePiecesInHand: [],
    );
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isEmpty);
    expect(gameBoard.sentePiecesInHand, isEmpty);
    expect(gameBoard.gotePiecesInHand, isEmpty);
  });

  test('Equality', () {
    final gameBoard1 = GameBoard(
      boardPieces: [
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
      ],
      sentePiecesInHand: [
        BoardPiece(
          pieceType: PieceType.pawn,
          player: PlayerType.sente,
          position: null,
        ),
      ],
      gotePiecesInHand: [
        BoardPiece(
          pieceType: PieceType.pawn,
          player: PlayerType.gote,
          position: null,
        ),
      ],
    );
    final gameBoard2 = GameBoard(
      boardPieces: [
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
      ],
      sentePiecesInHand: [
        BoardPiece(
          pieceType: PieceType.pawn,
          player: PlayerType.sente,
          position: null,
        ),
      ],
      gotePiecesInHand: [
        BoardPiece(
          pieceType: PieceType.pawn,
          player: PlayerType.gote,
          position: null,
        ),
      ],
    );
    expect(gameBoard1, isNotNull);
    expect(gameBoard2, isNotNull);
    expect(gameBoard1, gameBoard2);
  });
}
