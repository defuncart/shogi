import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../utils/package_utils.dart';

/// A model representing a shogi board piece
class BoardPiece {
  /// The row index
  final int row;

  /// The column index
  final int column;

  /// The board piece type
  final PieceType pieceType;

  /// Which player the piece belongs to
  final PlayerType player;

  const BoardPiece({
    @required this.row,
    @required this.column,
    @required this.pieceType,
    this.player = PlayerType.sente,
  });

  /// Whether the piece belongs to sente
  bool get isSente => player == PlayerType.sente;

  /// The pieces display string
  String displayString({bool usesJapanese = true}) =>
      PackageUtils.pieceTypeToString(pieceType, usesJapanese: usesJapanese, isSente: isSente);

  /// Whether the piece is promoted
  bool get isPromoted =>
      pieceType == PieceType.rookPromoted ||
      pieceType == PieceType.bishopPromoted ||
      pieceType == PieceType.silverPromoted ||
      pieceType == PieceType.knightPromoted ||
      pieceType == PieceType.lancePromoted ||
      pieceType == PieceType.pawnPromoted;

  /// Returns a string representation of the model
  @override
  String toString() => '($column, $row): ${describeEnum(player)} ${describeEnum(pieceType)}';
}
