import 'package:shogi/shogi.dart';
import 'package:shogi/src/models/board_piece.dart';
import 'package:test/test.dart';

void main() {
  group('ListBoardPieceExtensions', () {
    test(
        'When List<BoardPiece> contains piece at 11,'
        'expect that piece is returned', () {
      final pieces = [
        BoardPiece(
          pieceType: PieceType.king,
          position: Position.fromString('11'),
        ),
      ];

      expect(pieces.pieceAtPosition(column: 1, row: 1), isNotNull);
    });

    test(
        'When List<BoardPiece> contains no piece at 11,'
        'expect that piece is returned', () {
      final pieces = [
        BoardPiece(
          pieceType: PieceType.king,
          position: Position.fromString('99'),
        ),
      ];

      expect(pieces.pieceAtPosition(column: 1, row: 1), isNull);
    });
  });
}
