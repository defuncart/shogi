import '../../models/move.dart';

/// An interface which different notations (kifu, custom) can implement
abstract class INotationConverter {
  /// Converts a game from text into a list of moves
  List<Move> movesFromFile(String file);
}
