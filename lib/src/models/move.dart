import 'package:meta/meta.dart';

import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../utils/dart_utils.dart';
import 'position.dart';

/// A model representing a shogi game move
@immutable
class Move {
  /// The player
  final PlayerType player;

  /// The piece
  final PieceType piece;

  /// The original position
  ///
  /// `null` if piece is dropped onto the board
  final Position? from;

  /// The new position
  final Position to;

  /// Whether the move promotes the piece
  final bool isPromotion;

  /// Whether the move captures an oppenent's piece
  final bool isCapture;

  /// Whether the move drops a piece onto the board
  final bool isDrop;

  /// A representation of the move in kif notation
  final String? asKif;

  const Move({
    required this.player,
    required this.piece,
    required this.from,
    required this.to,
    this.isPromotion = false,
    this.isCapture = false,
    this.isDrop = false,
    this.asKif,
  })  : assert(!(isPromotion &&
            isDrop)), //a move cannot have isDrop and isPromotion
        assert(isDrop
            ? from == null
            : from !=
                null); //if isDrop, from should not be null otherwise should be null

  @override
  bool operator ==(dynamic other) =>
      other is Move &&
      player == other.player &&
      from == other.from &&
      to == other.to &&
      isPromotion == other.isPromotion &&
      isCapture == other.isCapture &&
      isDrop == other.isDrop &&
      asKif == other.asKif;

  @override
  int get hashCode => player.hashCode ^ from.hashCode ^ to.hashCode;

  @override
  String toString() =>
      asKif ??
      '${DartUtils.describeEnum(player)} with ${DartUtils.describeEnum(piece)} from $from to $to. isPromotion: $isPromotion, isCapture: $isCapture, isDrop: $isDrop.';
}
