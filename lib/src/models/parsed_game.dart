import 'package:meta/meta.dart';

import '../enums/player_type.dart';
import '../utils/dart_utils.dart';
import 'game_board.dart';
import 'move.dart';

/// A model representing a game parsed from an input file
class ParsedGame {
  /// The initial game board
  final GameBoard initalGameBoard;

  /// A list of moves
  final List<Move> moves;

  /// The game's winner
  ///
  /// This can be null
  final PlayerType winner;

  /// Sente's name
  ///
  /// This can be null
  final String senteName;

  /// Gote's name
  ///
  /// This can be null
  final String goteName;

  ParsedGame({
    @required this.initalGameBoard,
    @required this.moves,
    this.winner,
    this.senteName,
    this.goteName,
  });

  @override
  bool operator ==(dynamic other) =>
      other is ParsedGame &&
      initalGameBoard == other.initalGameBoard &&
      DartUtils.listEquals(moves, other.moves) &&
      winner == other.winner;

  @override
  int get hashCode => initalGameBoard.hashCode ^ moves.hashCode;

  @override
  String toString() => 'Game with ${moves.length} moves.';
}
