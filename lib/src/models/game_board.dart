import 'package:meta/meta.dart';

import '../models/board_piece.dart';

/// A model representing a shogi game board
class GameBoard {
  /// A list of board positions
  final List<BoardPiece> positions;

  const GameBoard({
    @required this.positions,
  });

  /// Returns a string representation of the model
  @override
  String toString() => '{$positions}';
}
