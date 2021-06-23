import '../configs/board_config.dart';
import '../extensions/board_piece_extensions.dart';
import '../extensions/list_board_pieces_extensions.dart';
import '../utils/dart_utils.dart';
import 'board_piece.dart';

/// A model representing a shogi game board
class GameBoard {
  /// A list of board pieces
  final List<BoardPiece> boardPieces;

  /// A list of sente's pieces in hand
  final List<BoardPiece> sentePiecesInHand;

  /// A list of sente's pieces in hand
  final List<BoardPiece> gotePiecesInHand;

  /// Creates a [GameBoard] with a list of board pieces
  /// and sente's and gote's pieces in hand
  ///
  /// If [boardPieces], [sentePiecesInHand] or [gotePiecesInHand]
  /// are null, they are defaulted to empty
  const GameBoard({
    required List<BoardPiece>? boardPieces,
    required List<BoardPiece>? sentePiecesInHand,
    required List<BoardPiece>? gotePiecesInHand,
  })  : boardPieces = boardPieces ?? const [],
        sentePiecesInHand = sentePiecesInHand ?? const [],
        gotePiecesInHand = gotePiecesInHand ?? const [];

  /// Creates an empty [GameBoard]
  const GameBoard.empty()
      : boardPieces = const [],
        sentePiecesInHand = const [],
        gotePiecesInHand = const [];

  /// Returns whether the [GameBoard] is empty
  bool get isEmpty =>
      boardPieces.isEmpty &&
      sentePiecesInHand.isEmpty &&
      gotePiecesInHand.isEmpty;

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

  @override
  bool operator ==(dynamic other) =>
      other is GameBoard &&
      DartUtils.listEquals(boardPieces, other.boardPieces) &&
      DartUtils.listEquals(sentePiecesInHand, other.sentePiecesInHand) &&
      DartUtils.listEquals(gotePiecesInHand, other.gotePiecesInHand);

  @override
  int get hashCode =>
      boardPieces.hashCode ^
      sentePiecesInHand.hashCode ^
      gotePiecesInHand.hashCode;

  @override
  String toString() =>
      '{boardPieces: $boardPieces, sentePiecesInHand: $sentePiecesInHand, gotePiecesInHand: $gotePiecesInHand}';
}
