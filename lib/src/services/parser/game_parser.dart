import '../../models/parsed_game.dart';
import '../../utils/shogi_utils.dart';
import '../board_notation/bod_converter.dart';
import '../move_notation/kif_notation_converter.dart';

abstract class GameParser {
  /// Parses a game from a text file
  static ParsedGame fromKif(String file) {
    var initialBoard = BODConverter.bodToGameBoard(file);
    if (initialBoard.isEmpty) {
      initialBoard = ShogiUtils.initialBoard;
    }
    final moves =
        KIFNotationConverter().movesFromFile(file, initialBoard: initialBoard);
    final winner = KIFNotationConverter().determineWinner(file);

    if (moves.isNotEmpty) {
      return ParsedGame(
        initalBoard: initialBoard,
        moves: moves,
        winner: winner,
      );
    } else {
      throw ArgumentError();
    }
  }
}
