import 'i_notation_converter.dart';
import '../enums/player_type.dart';
import '../models/move.dart';
import '../models/position.dart';
import '../utils/package_utils.dart';

/// A service which uses a custom notation developed for this package
class CustomNotationConverter implements INotationConverter {
  /// Converts a game of the form
  ///
  /// ```
  /// 1: ☗P77-76
  /// 2: ☗S79-68
  /// ```
  ///
  /// to a format that the game engine can understand.
  @override
  List<Move> movesFromFile(String file) {
    if (file != null) {
      final movesAsText = file.replaceAll(RegExp(r'\d+\:\s'), '').split('\n');
      movesAsText.remove(''); // remove any empty strings

      final moves = <Move>[];
      for (final moveAsText in movesAsText) {
        try {
          final player = moveAsText[0] == '☗' ? PlayerType.sente : PlayerType.gote;
          final piece = PackageUtils.pieceStringToType(moveAsText[1]);

          final from = Position(column: int.parse(moveAsText[2]), row: int.parse(moveAsText[3]));
          final to = Position(column: int.parse(moveAsText[5]), row: int.parse(moveAsText[6]));

          moves.add(
            Move(
              player: player,
              piece: piece,
              from: from,
              to: to,
            ),
          );
        } catch (_) {}
      }

      return moves;
    }

    return null;
  }
}
