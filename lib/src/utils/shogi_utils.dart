import '../configs/board_config.dart';
import '../configs/game_boards.dart';
import '../models/position.dart';
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

      // convert components into piece type and position
      final pieceType = PackageUtils.pieceStringToType(components[0]);
      final column = int.parse(components[1][0]);
      final row = int.parse(components[1][1]);

      boardPieces.add(
        BoardPiece(
          position: Position(
            column: column,
            row: row,
          ),
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
      final newPlayer = piece.player == PlayerType.gote ? PlayerType.sente : PlayerType.gote;

      newPieces.add(
        BoardPiece(
          position: Position(
            row: newRow,
            column: newColumn,
          ),
          pieceType: piece.pieceType,
          player: newPlayer,
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
  static List<BoardPiece> _initialBoard;

  /// The initial board pieces
  static List<BoardPiece> get initialBoard => _initialBoard ??= [
        ...(_initialBoardSente ??= stringArrayToBoardPiecesArray(GameBoards.initialBoardSente)),
        ...(_initialBoardGote ??= flipBoardPieces(_initialBoardSente))
      ];
}
