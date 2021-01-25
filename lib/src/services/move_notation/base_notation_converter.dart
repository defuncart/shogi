import 'package:meta/meta.dart';

import '../../enums/player_type.dart';
import '../../models/game_board.dart';
import '../../models/move.dart';
import '../../models/parsed_game.dart';
import 'i_notation_converter.dart';

abstract class BaseNotationConverter implements INotationConverter {
  @override
  ParsedGame parseGame(String file) => ParsedGame(
        initalGameBoard: determineInitialBoard(file),
        moves: movesFromFile(file),
        winner: determineWinner(file),
      );

  /// Determines the initial board from a given file
  @visibleForTesting
  GameBoard determineInitialBoard(String file);

  /// Determines the list of moves from a given file
  @visibleForTesting
  List<Move> movesFromFile(String file);

  /// Determines the game's winner from a given file
  @visibleForTesting
  PlayerType determineWinner(String file);
}
