import '../../models/parsed_game.dart';

/// An interface which different notations (kifu, custom) can implement
abstract class INotationConverter {
  /// Parses a game from a text file
  ParsedGame parseGame(String file);
}
