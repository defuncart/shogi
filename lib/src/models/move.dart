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
  final Position from;

  /// The new position
  final Position to;

  const Move({
    @required this.player,
    @required this.piece,
    @required this.from,
    @required this.to,
  })  : assert(player != null),
        assert(piece != null),
        assert(from != null),
        assert(to != null);

  @override
  String toString() => '${DartUtils.describeEnum(player)} with ${DartUtils.describeEnum(piece)} from $from to $to';
}
