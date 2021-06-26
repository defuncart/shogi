import '../services/board_notation/bod_converter.dart';
import '../services/formatter/ascii_formatter.dart';
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

extension GameBordExtensions on GameBoard {
  /// Prints the game board to console
  ///
  /// When [useJapanese] is true, BOD notation is used
  /// When [useJapanese] is false, ASCII notation is used
  void printToConsole({bool useJapanese = true}) {
    final string = useJapanese
        ? BODConverter.gameBoardToBod(this)
        : AsciiFormatter.gameBoardToAscii(this);
    print(string);
  }
}
