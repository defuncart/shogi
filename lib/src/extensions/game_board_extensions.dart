import 'package:collection/collection.dart' show IterableExtension;

import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../models/game_board.dart';

extension GameBoardExtensions on GameBoard {
  /// Returns a [BoardPiece] for [col], [row] on [GameBoard] instance
  ///
  /// If piece does not exist, `null` is returned
  BoardPiece? withPosition({
    required int col,
    required int row,
  }) =>
      boardPieces.firstWhereOrNull(
        (piece) => piece.position?.column == col && piece.position?.row == row,
      );

  /// Returns the count of [pieceType] in hand for [playerType] on [GameBoard] instance
  int countPiecesInHand({
    required PieceType pieceType,
    required PlayerType playerType,
  }) {
    final piecesInHand =
        playerType.isSente ? sentePiecesInHand : gotePiecesInHand;
    return piecesInHand
        .where((piece) => piece.pieceType == pieceType)
        .toList()
        .length;
  }
}
