import '../configs/static_game_boards.dart';
import '../enums/piece_type.dart';
import '../models/game_board.dart';
import '../services/board_notation/bod_converter.dart';
import '../services/board_notation/sfen_converter.dart';

/// A class of utils methods used when constructing a shogi board
class ShogiUtils {
  /// Converts a SFEN ascii string into a `GameBoard`
  static GameBoard sfenStringToGameBoard(String string) =>
      SFENConverter.sfenToGameBoard(string);

  /// Converts a BOD string into a `GameBoard`
  static GameBoard bodStringToGameBoard(String string) =>
      BODConverter.bodToGameBoard(string);

  /// A list of the order in which pieces in hand are displayed (sente's perspective)
  static const piecesInHandOrder = [
    PieceType.rook,
    PieceType.bishop,
    PieceType.gold,
    PieceType.silver,
    PieceType.knight,
    PieceType.lance,
    PieceType.pawn,
  ];

  /// The initial board
  static final initialBoard =
      sfenStringToGameBoard(StaticGameBoards.sfenInitialBoardString);
}
