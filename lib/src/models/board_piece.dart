import 'package:meta/meta.dart';

import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../models/position.dart';
import '../utils/package_utils.dart';
import '../utils/dart_utils.dart';

/// A model representing a shogi board piece
class BoardPiece {
  /// The piece's board position
  ///
  /// `null` implies that the piece is in hand
  final Position position;

  /// The board piece type
  final PieceType pieceType;

  /// Which player the piece belongs to
  final PlayerType player;

  const BoardPiece({
    @required this.position,
    @required this.pieceType,
    this.player = PlayerType.sente,
  })  : assert(
          position != null
              ? true
              : (pieceType == PieceType.pawn ||
                  pieceType == PieceType.lance ||
                  pieceType == PieceType.knight ||
                  pieceType == PieceType.silver ||
                  pieceType == PieceType.gold ||
                  pieceType == PieceType.bishop ||
                  pieceType == PieceType.rook),
        ), // a promoted piece should not be possible if piece is in hand
        assert(pieceType != null),
        assert(player != null);

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

  @override
  bool operator ==(dynamic other) =>
      other is BoardPiece && position == other.position && player == other.player && pieceType == other.pieceType;

  @override
  int get hashCode => player.hashCode ^ pieceType.hashCode ^ position.hashCode;

  /// Returns a string representation of the model
  @override
  String toString() =>
      (position == null ? 'InHand' : position.toString()) +
      ' ${DartUtils.describeEnum(player)} ${DartUtils.describeEnum(pieceType)}';
}
