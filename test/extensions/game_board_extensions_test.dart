import 'package:shogi/shogi.dart';
import 'package:shogi/src/extensions/game_board_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('GameBoardExtensions', () {
    group('withPosition', () {
      final gameboard = ShogiUtils.initialBoard;

      test('with initial board, expect to find at 11', () {
        expect(
          gameboard.withPosition(col: 1, row: 1),
          isNotNull,
        );
      });

      test('with initial board, expect to not find at 55', () {
        expect(
          gameboard.withPosition(col: 5, row: 5),
          isNull,
        );
      });
    });

    group('countPiecesInHand', () {
      test('with initial board, expect none', () {
        expect(
          ShogiUtils.initialBoard.countPiecesInHand(
            pieceType: PieceType.pawn,
            playerType: PlayerType.gote,
          ),
          0,
        );
      });

      test('with initial board, expect none', () {
        final gameboard = ShogiUtils.sfenStringToGameBoard(
          '8k/5r3/7Lp/9/9/9/9/9/9 b R2b4g4s4n3l17p',
        );
        expect(
          gameboard.countPiecesInHand(
            pieceType: PieceType.pawn,
            playerType: PlayerType.gote,
          ),
          17,
        );
      });
    });
  });
}
