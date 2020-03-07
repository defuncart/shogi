import 'package:meta/meta.dart';
import 'package:shogi/shogi.dart';

import 'board_piece.dart';
import '../enums/player_type.dart';

/// A model representing a shogi game board
class GameBoard {
  /// A list of board pieces
  final List<BoardPiece> boardPieces;

  /// A list of sente's pieces in hand
  final List<BoardPiece> sentePiecesInHand;

  /// A list of sente's pieces in hand
  final List<BoardPiece> gotePiecesInHand;

  GameBoard({@required List<BoardPiece> boardPieces})
      : this.boardPieces = boardPieces?.where((piece) => piece.position != null)?.toList() ?? const [],
        sentePiecesInHand =
            boardPieces?.where((piece) => piece.position == null && piece.player.isSente)?.toList() ?? const [],
        gotePiecesInHand =
            boardPieces?.where((piece) => piece.position == null && piece.player.isGote)?.toList() ?? const [];

  /// Returns a string representation of the model
  @override
  String toString() =>
      '{boardPieces: $boardPieces, sentePiecesInHand: $sentePiecesInHand, gotePiecesInHand: $gotePiecesInHand}';
}
