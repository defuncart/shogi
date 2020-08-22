import '../configs/board_config.dart';
import '../configs/static_game_boards.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../models/game_board.dart';
import '../models/position.dart';
import '../services/sfen_converter.dart';
import '../utils/package_utils.dart';

/// A class of utils methods used when constructing a shogi board
class ShogiUtils {
  /// Converts a SFEN ascii string into a `GameBoard`
  static GameBoard sfenStringToGameBoard(String string) =>
      SFENConverter.sfenToGameBoard(string);

  /// Converts an array of strings [K-59, ...] into a `GameBoard`
  static GameBoard stringArrayToGameBoard(
    List<String> strPieces, {
    PlayerType player = PlayerType.sente,
  }) =>
      GameBoard(
        boardPieces: stringArrayToBoardPiecesArray(strPieces, player: player),
      );

  /// Converts an array of strings [K-59, ...] into an array of board pieces
  static List<BoardPiece> stringArrayToBoardPiecesArray(
    List<String> strPieces, {
    PlayerType player = PlayerType.sente,
  }) {
    final boardPieces = <BoardPiece>[];
    for (var strPiece in strPieces) {
      // split string ☗:K-59 into [☗, K-59], if applicable
      var components = strPiece.split(':');
      if (components.length > 1) {
        player = components[0] == BoardConfig.gote
            ? PlayerType.gote
            : PlayerType.sente;
        strPiece = components[1];
      }

      // split string K-59 into [K, 59]
      components = strPiece.split('-');

      // convert components into piece type and position
      final pieceType = PackageUtils.pieceStringToType(components[0]);
      Position position;
      if (components.length == 2) {
        final column = int.tryParse(components[1][0]);
        final row = int.tryParse(components[1][1]);
        position = Position(
          column: column,
          row: row,
        );
      }

      boardPieces.add(
        BoardPiece(
          position: position,
          pieceType: pieceType,
          player: player,
        ),
      );
    }

    return boardPieces;
  }

  /// Flips a list of board pieces to another player
  ///
  /// Thus sente K-59 would be gote K-51 etc.
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
