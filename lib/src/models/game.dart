import 'package:meta/meta.dart';

import '../enums/player_type.dart';
import '../services/game_engine.dart';
import '../services/move_notation/kif_notation_converter.dart';
import '../utils/shogi_utils.dart';
import 'game_board.dart';

/// A model representing a shogi game
class Game {
  /// A list of game positions
  final List<GameBoard> gameBoards;

  /// A list of moves (in text format)
  final List<String> movesAsText;

  /// The game's winner
  ///
  /// This can be null
  final PlayerType winner;

  const Game({
    @required this.gameBoards,
    @required this.movesAsText,
    this.winner,
  }) : assert(gameBoards != null);

  /// Constructs a [Game] from a kif file
  factory Game.fromKif(String file) {
    final converter = KIFNotationConverter();
    final moves = converter.movesFromFile(file);
    final movesAsText = converter.movesAsText(file);
    final winner = converter.determineWinner(file);

    if (moves != null &&
        moves.isNotEmpty &&
        movesAsText != null &&
        moves.length == movesAsText.length) {
      final _gameBoards = [ShogiUtils.initialBoard];
      for (final move in moves) {
        _gameBoards.add(
          GameEngine.makeMove(_gameBoards.last, move),
        );
      }

      return Game(
        gameBoards: _gameBoards,
        movesAsText: movesAsText,
        winner: winner,
      );
    }

    return null;
  }
}
