import '../models/move.dart';
import '../models/board_piece.dart';

/// A simple shogi game engine
///
/// Presently only moving pieces is supported
class GameEngine {
  /// Makes a given move for a list of given board pieces
  static List<BoardPiece> makeMove(List<BoardPiece> pieces, Move move) {
    final newBoard = List<BoardPiece>.from(pieces);

    final oldPiece = pieces.firstWhere((piece) => piece.position == move.from);
    newBoard.remove(oldPiece);

    final newPiece = BoardPiece(player: move.player, pieceType: move.piece, position: move.to);
    newBoard.add(newPiece);

    return newBoard;
  }
}
