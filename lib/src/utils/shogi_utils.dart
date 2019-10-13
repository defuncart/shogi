import '../configs/board_config.dart';
import '../configs/game_boards.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../utils/package_utils.dart';

/// A class of utils methods used when constructing a shogi board
class ShogiUtils {
  /// Converts an array of strings [K-59, ...] into an array of board pieces
  static List<BoardPiece> stringArrayToBoardPiecesArray(List<String> strPieces, {player = PlayerType.sente}) {
    final boardPieces = List<BoardPiece>();
    for (var strPiece in strPieces) {
      // split string S:K-59 into [S, K-59], if applicable
      var components = strPiece.split(':');
      if (components.length > 1) {
        player = components[0] == 'S' ? PlayerType.sente : PlayerType.gote;
        strPiece = components[1];
      }

      // split string K-59 into [K, 59]
      components = strPiece.split('-');
      assert(components.length == 2);

      // convert components into piece type and (row, column) - note adjusting value to be [0, 8]
      final pieceType = PackageUtils.pieceStringToType(components[0]);
      final row = int.parse(components[1][0]) - 1;
      final column = int.parse(components[1][1]) - 1;

      boardPieces.add(BoardPiece(row: row, column: column, pieceType: pieceType, player: player));
    }
    return boardPieces;
  }

  /// Flips a list of board pieces to another player
  ///
  /// Thus sente K-59 would be gote K-51 etc.
  static List<BoardPiece> flipBoardPieces(List<BoardPiece> originalPieces) {
    final newPieces = List<BoardPiece>();
    for (final piece in originalPieces) {
      final newRow = (piece.row - (BoardConfig.numberRows - 1)).abs();
      final newColumn = (piece.column - (BoardConfig.numberColumns - 1)).abs();
      final newPlayer = piece.player == PlayerType.gote ? PlayerType.sente : PlayerType.gote;

      newPieces.add(BoardPiece(row: newRow, column: newColumn, pieceType: piece.pieceType, player: newPlayer));
    }
    return newPieces;
  }

  /// A backing variable used for sente's initial board pieces
  static List<BoardPiece> _initialBoardSente;

  /// A backing variable used for gote's initial board pieces
  static List<BoardPiece> _initialBoardGote;

  /// A backing variable used for the overall initial board pieces
  static List<BoardPiece> _initialBoard;

  /// The initial board pieces
  static List<BoardPiece> get initialBoard => _initialBoard ??= [
        ...(_initialBoardSente ??= stringArrayToBoardPiecesArray(GameBoards.initialBoardSente)),
        ...(_initialBoardGote ??= flipBoardPieces(_initialBoardSente))
      ];
}
