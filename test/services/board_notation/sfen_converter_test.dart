import 'package:shogi/shogi.dart';
import 'package:shogi/src/services/board_notation/sfen_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Ensure from sfen correct', () {
    final sfen = '9/9/4+R4/7kS/9/8g/9/9/9 b GSr2b2g2s4n4l18p';
    final gameboard = SFENConverter.sfenToGameBoard(sfen);
    expect(
      gameboard,
      GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.rookPromoted,
            player: PlayerType.sente,
            position: Position.fromString('53'),
          ),
          BoardPiece(
            pieceType: PieceType.king,
            player: PlayerType.gote,
            position: Position.fromString('24'),
          ),
          BoardPiece(
            pieceType: PieceType.silver,
            player: PlayerType.sente,
            position: Position.fromString('14'),
          ),
          BoardPiece(
            pieceType: PieceType.gold,
            player: PlayerType.gote,
            position: Position.fromString('16'),
          ),
        ],
        sentePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.gold,
            player: PlayerType.sente,
            position: null,
          ),
          BoardPiece(
            pieceType: PieceType.silver,
            player: PlayerType.sente,
            position: null,
          ),
        ],
        gotePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.rook,
            player: PlayerType.gote,
            position: null,
          ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.bishop,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.gold,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.silver,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.knight,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.lance,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 18; i++)
            BoardPiece(
              pieceType: PieceType.pawn,
              player: PlayerType.gote,
              position: null,
            ),
        ],
      ),
    );
  });
}
