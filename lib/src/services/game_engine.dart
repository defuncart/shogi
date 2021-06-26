import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../models/game_board.dart';
import '../models/move.dart';

/// A simple shogi game engine
///
/// Presently only moving pieces is supported
abstract class GameEngine {
  /// Makes a given move for a given game board
  static GameBoard makeMove(GameBoard gameBoard, Move move) {
    final boardPieces = List<BoardPiece>.from(gameBoard.boardPieces);
    final sentePiecesInHand =
        List<BoardPiece>.from(gameBoard.sentePiecesInHand);
    final gotePiecesInHand = List<BoardPiece>.from(gameBoard.gotePiecesInHand);

    if (move.isDrop) {
      final list = move.player.isSente ? sentePiecesInHand : gotePiecesInHand;
      final droppedPiece =
          list.firstWhere((piece) => piece.pieceType == move.piece);
      list.remove(droppedPiece);
    } else {
      if (move.isCapture) {
        final capturedPiece =
            boardPieces.firstWhere((piece) => piece.position == move.to);
        boardPieces.remove(capturedPiece);

        final list = move.player.isSente ? sentePiecesInHand : gotePiecesInHand;
        list.add(
          BoardPiece(
            player: move.player,
            pieceType: capturedPiece.pieceType.normalize(),
            position: null,
          ),
        );
      }

      final oldPiece =
          boardPieces.firstWhere((piece) => piece.position == move.from);
      boardPieces.remove(oldPiece);
    }

    final newPiece = BoardPiece(
      player: move.player,
      pieceType: move.isPromotion ? move.piece.promote() : move.piece,
      position: move.to,
    );
    boardPieces.add(newPiece);

    return GameBoard(
      boardPieces: boardPieces,
      sentePiecesInHand: sentePiecesInHand,
      gotePiecesInHand: gotePiecesInHand,
    );
  }
}
