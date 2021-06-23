import '../enums/player_type.dart';
import '../services/game_engine.dart';
import '../services/parser/game_parser.dart';
import '../utils/dart_utils.dart';
import 'game_board.dart';
import 'move.dart';

/// A model representing a shogi game
class Game {
  /// A list of game positions
  final List<GameBoard> gameBoards;

  /// A list of moves
  final List<Move> moves;

  /// The game's winner
  final PlayerType? winner;

  const Game({
    required this.gameBoards,
    required this.moves,
    this.winner,
  });

  /// Constructs a [Game] from a kif file
  factory Game.fromKif(String file) {
    final parsedGame = GameParser.fromKif(file);

    final _gameBoards = [parsedGame.initalBoard];
    for (final move in parsedGame.moves) {
      _gameBoards.add(
        GameEngine.makeMove(_gameBoards.last, move),
      );
    }

    return Game(
      gameBoards: _gameBoards,
      moves: parsedGame.moves,
      winner: parsedGame.winner,
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other is Game &&
      DartUtils.listEquals(gameBoards, other.gameBoards) &&
      DartUtils.listEquals(moves, other.moves) &&
      winner == other.winner;

  @override
  int get hashCode => gameBoards.hashCode ^ winner.hashCode;

  @override
  String toString() => 'Game with ${moves.length} moves.';
}
