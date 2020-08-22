import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  void assertInitalBoardSente(List<BoardPiece> boardPieces) {
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 9 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.lance &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.knight &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 7 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.silver &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 6 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.gold &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 5 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.king &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 4 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.gold &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 3 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.silver &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.knight &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 1 &&
              piece.position.row == 9 &&
              piece.pieceType == PieceType.lance &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 8 &&
              piece.pieceType == PieceType.bishop &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 8 &&
              piece.pieceType == PieceType.rook &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 9 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 7 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 6 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 5 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 4 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 3 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 1 &&
              piece.position.row == 7 &&
              piece.pieceType == PieceType.pawn &&
              !piece.isSente,
        ),
        isNotNull);
  }

  void assertInitalBoardGote(List<BoardPiece> boardPieces) {
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 9 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.lance &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.knight &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 7 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.silver &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 6 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.gold &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 5 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.king &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 4 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.gold &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 3 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.silver &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.knight &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 1 &&
              piece.position.row == 1 &&
              piece.pieceType == PieceType.lance &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 2 &&
              piece.pieceType == PieceType.bishop &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 2 &&
              piece.pieceType == PieceType.rook &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 9 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 8 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 7 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 6 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 5 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 4 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 3 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 2 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
    expect(
        boardPieces.where(
          (piece) =>
              piece.position.column == 1 &&
              piece.position.row == 3 &&
              piece.pieceType == PieceType.pawn &&
              piece.isSente,
        ),
        isNotNull);
  }

  test('flipBoardPieces', () {
    final sentePieces = ShogiUtils.stringArrayToBoardPiecesArray(
        StaticGameBoards.initialBoardSente);
    assertInitalBoardSente(sentePieces);

    final gotePieces = ShogiUtils.flipBoardPieces(sentePieces);
    assertInitalBoardGote(gotePieces);

    final flippedGote = ShogiUtils.flipBoardPieces(gotePieces);
    assertInitalBoardSente(flippedGote);
  });
}
