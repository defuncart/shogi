import '../../models/parsed_game.dart';
import '../board_notation/bod_converter.dart';
import '../move_notation/kif_notation_converter.dart';

abstract class GameParser {
  /// Parses a game from a text file
  static ParsedGame fromKif(String file) {
    final initialBoard = BODConverter.bodToGameBoard(file);
    final moves =
        KIFNotationConverter().movesFromFile(file, initialBoard: initialBoard);
    final winner = KIFNotationConverter().determineWinner(file);

    if (initialBoard != null && moves != null && moves.isNotEmpty) {
      return ParsedGame(
        initalBoard: initialBoard,
        moves: moves,
        winner: winner,
      );
    }

    return null;
  }
}
