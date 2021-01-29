import '../configs/board_config.dart';
import '../configs/static_game_boards.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../models/game_board.dart';
import '../models/position.dart';
import '../services/board_notation/sfen_converter.dart';

/// A class of utils methods used when constructing a shogi board
class ShogiUtils {
  /// Converts a SFEN ascii string into a `GameBoard`
  static GameBoard sfenStringToGameBoard(String string) =>
      SFENConverter.sfenToGameBoard(string);

  /// Flips a list of board pieces to another player
  ///
  /// Thus sente K59 would be gote K51 etc.
  static List<BoardPiece> flipBoardPieces(List<BoardPiece> originalPieces) {
    final newPieces = <BoardPiece>[];
    for (final piece in originalPieces) {
      final newRow = (piece.position.row - BoardConfig.numberRows).abs() + 1;
      final newColumn =
          (piece.position.column - BoardConfig.numberColumns).abs() + 1;

      newPieces.add(
        BoardPiece(
          position: Position(
            row: newRow,
            column: newColumn,
          ),
          pieceType: piece.pieceType,
          player: piece.player.flip(),
        ),
      );
    }
    return newPieces;
  }

  /// The initial board
  static final initialBoard =
      sfenStringToGameBoard(StaticGameBoards.sfenInitialBoardString);
}
