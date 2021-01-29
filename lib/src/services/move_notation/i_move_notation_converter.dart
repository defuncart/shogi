import '../../enums/player_type.dart';
import '../../models/move.dart';

/// An interface which different notations (kifu, custom) can implement
abstract class IMoveNotationConverter {
  /// Determines the list of moves from a given file
  List<Move> movesFromFile(String file);

  /// Determines the game's winner from a given file
  PlayerType determineWinner(String file);
}
