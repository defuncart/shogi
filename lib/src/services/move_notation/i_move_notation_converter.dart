import '../../enums/player_type.dart';
import '../../models/game_board.dart';
import '../../models/move.dart';

/// An interface which different notations (kifu, custom) can implement
abstract class IMoveNotationConverter {
  /// Determines the list of moves from a given file
  List<Move> movesFromFile(String file, {GameBoard initialBoard});

  /// Determines the game's winner from a given file
  PlayerType determineWinner(String file);
}
