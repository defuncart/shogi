import '../enums/player_type.dart';
import '../utils/dart_utils.dart';
import 'game_board.dart';
import 'move.dart';

/// A model representing a game parsed from an input file
class ParsedGame {
  /// The initial game board
  final GameBoard initalBoard;

  /// A list of moves
  final List<Move> moves;

  /// The game's winner
  final PlayerType? winner;

  /// Sente's name
  final String? senteName;

  /// Gote's name
  final String? goteName;

  ParsedGame({
    required this.initalBoard,
    required this.moves,
    this.winner,
    this.senteName,
    this.goteName,
  });

  @override
  bool operator ==(dynamic other) =>
      other is ParsedGame &&
      initalBoard == other.initalBoard &&
      DartUtils.listEquals(moves, other.moves) &&
      winner == other.winner;

  @override
  int get hashCode => initalBoard.hashCode ^ moves.hashCode;

  @override
  String toString() => 'Game with ${moves.length} moves.';
}
