import 'package:meta/meta.dart';

import '../enums/player_type.dart';
import 'board_piece.dart';

/// A model representing a shogi game board
class GameBoard {
  /// A list of board pieces
  final List<BoardPiece> boardPieces;

  /// A list of sente's pieces in hand
  final List<BoardPiece> sentePiecesInHand;

  /// A list of sente's pieces in hand
  final List<BoardPiece> gotePiecesInHand;

  const GameBoard({
    @required this.boardPieces,
    this.sentePiecesInHand = const [],
    this.gotePiecesInHand = const [],
  })  : assert(boardPieces != null),
        assert(sentePiecesInHand != null),
        assert(gotePiecesInHand != null);

  /// Returns a string representation of the model
  @override
  String toString() =>
      '{boardPieces: $boardPieces, sentePiecesInHand: $sentePiecesInHand, gotePiecesInHand: $gotePiecesInHand';
}
