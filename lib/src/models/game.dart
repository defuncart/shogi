import 'package:meta/meta.dart';

import '../enums/player_type.dart';
import '../services/game_engine.dart';
import '../services/move_notation/kif_notation_converter.dart';
import '../utils/shogi_utils.dart';
import 'game_board.dart';
import 'move.dart';

/// A model representing a shogi game
class Game {
  /// A list of game positions
  final List<GameBoard> gameBoards;

  /// The game's winner
  ///
  /// This can be null
  final PlayerType winner;

  const Game({
    @required this.gameBoards,
    this.winner,
  }) : assert(gameBoards != null);

  /// Constructs a [Game] from a list of moves
  ///
  /// [winner] is optional
  factory Game._fromMoves(List<Move> moves, {PlayerType winner}) {
    if (moves != null && moves.isNotEmpty) {
      final _gameBoards = [ShogiUtils.initialBoard];
      for (final move in moves) {
        _gameBoards.add(
          GameEngine.makeMove(_gameBoards.last, move),
        );
      }

      return Game(
        gameBoards: _gameBoards,
        winner: winner,
      );
    }

    return null;
  }

  /// Constructs a [Game] from a kif file
  factory Game.fromKif(String file) {
    final converter = KIFNotationConverter();
    final moves = converter.movesFromFile(file);
    final winner = converter.determineWinner(file);

    return Game._fromMoves(moves, winner: winner);
  }
}
