import 'package:meta/meta.dart';

import 'position.dart';
import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../utils/dart_utils.dart';

/// A model representing a shogi game move
class Move {
  /// The player
  final PlayerType player;

  /// The piece
  final PieceType piece;

  /// The original position
  ///
  /// `null` if piece is dropped onto the board
  final Position from;

  /// The new position
  final Position to;

  /// Whether the move promotes the piece
  final bool isPromotion;

  /// Whether the move captures an oppenent's piece
  final bool isCapture;

  /// Whether the move drops a piece onto the board
  final bool isDrop;

  const Move({
    @required this.player,
    @required this.piece,
    @required this.from,
    @required this.to,
    this.isPromotion = false,
    this.isCapture = false,
    this.isDrop = false,
  })  : assert(player != null),
        assert(piece != null),
        assert(to != null),
        assert(isPromotion != null),
        assert(isCapture != null),
        assert(isDrop != null),
        assert(!(isPromotion && isDrop)), //a move cannot have isDrop and isPromotion
        assert(isDrop ? from == null : from != null); //if isDrop, from should not be null otherwise should be null

  @override
  String toString() =>
      '${DartUtils.describeEnum(player)} with ${DartUtils.describeEnum(piece)} from $from to $to. isPromotion: $isPromotion, isCapture: $isCapture, isDrop: $isDrop.';
}
