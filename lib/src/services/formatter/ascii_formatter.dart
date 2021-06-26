import '../../configs/board_config.dart';
import '../../extensions/board_piece_extensions.dart';
import '../../extensions/list_board_pieces_extensions.dart';
import '../../models/board_piece.dart';
import '../../models/game_board.dart';

/// A service which formats [GameBoard] into ascii
abstract class AsciiFormatter {
  /// Converts [gameboard] into human readable ascii board
  static String gameBoardToAscii(GameBoard gameboard) {
    const space = ' ';
    const delimiter = '|';
    final buffer = StringBuffer();

    buffer.write(gameboard.gotePiecesInHand.toSFEN());
    for (var row = 1; row <= BoardConfig.numberRows; row++) {
      for (var column = 9; column >= 1; column--) {
        buffer.write(delimiter);
        final piece = gameboard.boardPieces.pieceAtPosition(
          column: column,
          row: row,
        );
        if (piece == null) {
          buffer.write(space * 2);
        } else {
          buffer.write(piece.toSFEN());
          if (!piece.isPromoted) {
            buffer.write(space);
          }
        }
      }
      buffer.writeln(delimiter);
    }
    buffer.write(gameboard.sentePiecesInHand.toSFEN());

    return buffer.toString();
  }
}
