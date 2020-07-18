import 'package:meta/meta.dart';

import '../configs/board_config.dart';
import '../enums/player_type.dart';
import '../extensions/board_piece_extensions.dart';
import '../extensions/list_board_pieces_extensions.dart';
import 'board_piece.dart';

/// A model representing a shogi game board
class GameBoard {
  /// A list of board pieces
  final List<BoardPiece> boardPieces;

  /// A list of sente's pieces in hand
  final List<BoardPiece> sentePiecesInHand;

  /// A list of sente's pieces in hand
  final List<BoardPiece> gotePiecesInHand;

  GameBoard({@required List<BoardPiece> boardPieces})
      : boardPieces = boardPieces?.where((piece) => piece.position != null)?.toList() ?? const [],
        sentePiecesInHand =
            boardPieces?.where((piece) => piece.position == null && piece.player.isSente)?.toList() ?? const [],
        gotePiecesInHand =
            boardPieces?.where((piece) => piece.position == null && piece.player.isGote)?.toList() ?? const [];

  /// Returns a string representation of the model
  @override
  String toString() =>
      '{boardPieces: $boardPieces, sentePiecesInHand: $sentePiecesInHand, gotePiecesInHand: $gotePiecesInHand}';

  /// Prints the game board to console using lower case for gote and upper case for sente
  void printToConsole() {
    const space = ' ';
    const delimiter = '|';
    final buffer = StringBuffer();

    buffer.write(gotePiecesInHand.toSFEN());
    for (var row = 1; row <= BoardConfig.numberRows; row++) {
      for (var column = 9; column >= 1; column--) {
        buffer.write(delimiter);
        final piece = boardPieces.pieceAtPosition(column: column, row: row);
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
    buffer.write(sentePiecesInHand.toSFEN());

    print(buffer.toString());
  }
}
