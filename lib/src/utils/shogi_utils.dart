import '../configs/board_config.dart';
import '../configs/static_game_boards.dart';
import '../models/position.dart';
import '../models/game_board.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../services/sfen_converter.dart';
import '../utils/package_utils.dart';

/// A class of utils methods used when constructing a shogi board
class ShogiUtils {
  /// Converts a SFEN ascii string into a `GameBoard`
  static GameBoard sfenStringToGameBoard(String string) => SFENConverter.sfenToGameBoard(string);

  /// Converts an array of strings [K-59, ...] into a `GameBoard`
  static GameBoard stringArrayToGameBoard(List<String> strPieces, {player = PlayerType.sente}) => GameBoard(
        boardPieces: stringArrayToBoardPiecesArray(strPieces, player: player),
      );

  /// Converts an array of strings [K-59, ...] into an array of board pieces
  static List<BoardPiece> stringArrayToBoardPiecesArray(List<String> strPieces, {player = PlayerType.sente}) {
    final boardPieces = List<BoardPiece>();
    for (var strPiece in strPieces) {
      // split string ☗:K-59 into [☗, K-59], if applicable
      var components = strPiece.split(':');
      if (components.length > 1) {
        player = components[0] == BoardConfig.gote ? PlayerType.gote : PlayerType.sente;
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
    final newPieces = List<BoardPiece>();
    for (final piece in originalPieces) {
      final newRow = (piece.position.row - BoardConfig.numberRows).abs() + 1;
      final newColumn = (piece.position.column - BoardConfig.numberColumns).abs() + 1;

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

  /// A backing variable used for sente's initial board pieces
  static List<BoardPiece> _initialBoardSente;

  /// A backing variable used for gote's initial board pieces
  static List<BoardPiece> _initialBoardGote;

  /// A backing variable used for the overall initial board pieces
  static List<BoardPiece> _initialBoardPieces = [
    ...(_initialBoardSente ??= stringArrayToBoardPiecesArray(StaticGameBoards.initialBoardSente)),
    ...(_initialBoardGote ??= flipBoardPieces(_initialBoardSente))
  ];

  /// The initial board
  static GameBoard initialBoard = GameBoard(boardPieces: _initialBoardPieces);
}
