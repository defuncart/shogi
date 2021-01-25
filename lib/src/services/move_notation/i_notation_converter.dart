import 'package:meta/meta.dart';

import '../../enums/player_type.dart';
import '../../models/move.dart';
import '../../models/parsed_game.dart';

/// An interface which different notations (kifu, custom) can implement
abstract class INotationConverter {
  /// Parses a game from a text file
  ParsedGame parseGame(String file);

  /// Converts a text file into a list of moves
  @visibleForTesting
  List<Move> movesFromFile(String file);

  /// Determines the game's winner
  @visibleForTesting
  PlayerType determineWinner(String file);
}
