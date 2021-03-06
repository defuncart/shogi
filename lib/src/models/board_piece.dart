import 'package:collection/collection.dart' show IterableExtension;
import 'package:meta/meta.dart';

import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../models/position.dart';
import '../utils/dart_utils.dart';
import '../utils/package_utils.dart';

/// A model representing a shogi board piece
@immutable
class BoardPiece {
  /// The piece's board position
  ///
  /// `null` implies that the piece is in hand
  final Position? position;

  /// The board piece type
  final PieceType pieceType;

  /// Which player the piece belongs to
  final PlayerType player;

  const BoardPiece({
    this.player = PlayerType.sente,
    required this.pieceType,
    this.position,
  }) : assert(
          position != null
              ? true
              : (pieceType == PieceType.pawn ||
                  pieceType == PieceType.lance ||
                  pieceType == PieceType.knight ||
                  pieceType == PieceType.silver ||
                  pieceType == PieceType.gold ||
                  pieceType == PieceType.bishop ||
                  pieceType == PieceType.rook),
        ); // a promoted piece should not be possible if piece is in hand

  /// Whether the piece belongs to sente
  bool get isSente => player.isSente;

  /// The pieces display string
  String displayString({bool usesJapanese = true}) =>
      PackageUtils.pieceTypeToDisplayString(pieceType,
          usesJapanese: usesJapanese, isSente: isSente);

  /// Whether the piece is promoted
  bool get isPromoted => pieceType.isPromoted;

  @override
  bool operator ==(dynamic other) =>
      other is BoardPiece &&
      position == other.position &&
      player == other.player &&
      pieceType == other.pieceType;

  @override
  int get hashCode => player.hashCode ^ pieceType.hashCode ^ position.hashCode;

  /// Returns a string representation of the model
  @override
  String toString() =>
      '${position == null ? 'InHand' : position.toString()} ${DartUtils.describeEnum(player)} ${DartUtils.describeEnum(pieceType)}';
}

/// A class of extension methods for List<BoardPiece>
extension ListBoardPieceExtensions on List<BoardPiece> {
  /// Returns the piece at position (column, row). Returns `null` if no piece exists.
  BoardPiece? pieceAtPosition({required int column, required int row}) =>
      firstWhereOrNull(
        (piece) =>
            piece.position?.column == column && piece.position?.row == row,
      );
}
