import '../../../shogi.dart';
import '../../configs/board_config.dart';
import '../../enums/player_type.dart';
import '../../models/move.dart';
import '../../models/position.dart';
import '../../utils/package_utils.dart';
import 'i_move_notation_converter.dart';

/// An enum describing the types of capture groups
enum _CaptureGroup {
  player,
  piece,
  from,
  movement,
  to,
  promotion,
}

/// A service which uses a custom notation developed for this package
class CustomNotationConverter implements IMoveNotationConverter {
  /// The symbol used to represent simple movement
  /// ignore: unused_field
  static const _moveSymbol = '-';

  /// The symbol used to represent capture
  static const _captureSymbol = 'x';

  /// The symbol used to represent a drop
  static const _dropSymbol = '*';

  /// The symbol used to represent promotion
  static const _promotionSymbol = '+';

  /// Converts a file of the form
  ///
  /// ```
  /// 1: ☗P77-76
  /// 2: ☗S79-68
  /// ```
  ///
  /// to a list of game moves.
  @override
  List<Move> movesFromFile(String file) {
    if (file != null) {
      /// firstly split file into a list of moves, ignoring any prepending number indicators
      final movesAsText = file.replaceAll(RegExp(r'\d+\:\s'), '').split('\n');
      movesAsText.remove(''); // remove any empty strings

      final moves = <Move>[];
      for (final moveAsText in movesAsText) {
        // convert the move into a list of components
        final components = _convertMoveAsTextIntoComponents(moveAsText);
        if (components != null) {
          // parse each component
          final player =
              components[_CaptureGroup.player.index] == BoardConfig.gote
                  ? PlayerType.gote
                  : PlayerType.sente;
          final piece = PackageUtils.pieceStringToType(
              components[_CaptureGroup.piece.index]);
          final from =
              Position.fromString(components[_CaptureGroup.from.index]);
          final isCapture =
              components[_CaptureGroup.movement.index] == _captureSymbol;
          final isDrop =
              components[_CaptureGroup.movement.index] == _dropSymbol;
          final to = Position.fromString(components[_CaptureGroup.to.index]);
          final isPromotion =
              components[_CaptureGroup.promotion.index] == _promotionSymbol;

          moves.add(
            Move(
              player: player,
              piece: piece,
              from: from,
              to: to,
              isCapture: isCapture,
              isDrop: isDrop,
              isPromotion: isPromotion,
            ),
          );
        }
      }

      return moves;
    }

    return null;
  }

  /// A regexp used to parse all potential moves
  ///
  /// 1. player type, either ☗ or ☖
  /// 2. piece type, i.e. K, P, +R
  /// 3. from, assumed to be two digits i.e. 11 (optional)
  /// 4. movement type, i.e. -, * or x
  /// 5. to, assumed to be two digits i.e. 11
  /// 6. promotion, can only match to + (optional)
  static final _regExp = RegExp(
      r'([☗☖])(P|L|N|S|G|K|B|R|\+P|\+L|\+N|\+S|\+B|\+R)(\d{2})?([-\*x])(\d{2})(\+)?');

  /// The number of groups captured by `_regExp`
  static int get _numberCaptureGroups => _CaptureGroup.values.length;

  /// A list of group indeces from 1 to 6, used to get all matched groups from `_regExp`
  static final _groupIndeces =
      List.generate(_numberCaptureGroups, (index) => index + 1);

  /// Converts a move `☗S34x33+` into `[☗, S, 34, x, 33, +]`
  List<String> _convertMoveAsTextIntoComponents(String moveAsText) {
    final matches = _regExp.allMatches(moveAsText);
    return matches.length == 1 ? matches?.first?.groups(_groupIndeces) : null;
  }

  @override
  PlayerType determineWinner(String file) => null;
}
