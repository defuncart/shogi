import 'package:shogi/shogi.dart';

import '../../enums/player_type.dart';
import '../../models/move.dart';
import '../../models/position.dart';
import '../../utils/package_utils.dart';
import 'i_notation_converter.dart';

/// An enum describing the types of capture groups
enum _CaptureGroup {
  to,
  piece,
  promotion,
  movement,
  from,
}

/*
打	dropped
引	downward
寄	horizontally
上	upward
右	moving from right (going leftwards)
左	moving from left (going rightwards)
直	perpendicularly vertical (gold/silver only)
行	upward (dragon/horse)
入	upward (dragon/horse)
*/

/// A service which uses a kif notation
class KIFNotationConverter implements INotationConverter {
  /// The symbol used when to coords are same as last move
  static const _sameSymbol = '同';

  /// The symbol used to represent a drop
  static const _dropSymbol = '打';

  /// The symbol used to represent promotion
  static const _promotionSymbol = '成';

  /// Converts a game of the form
  ///
  /// ```
  /// 1 ７六歩(77)
  /// 2 ３四歩(33)
  /// ```
  ///
  /// to a format that the game engine can understand.
  ///
  /// Assumes that Sente and Gote alternate moves.
  @override
  List<Move> movesFromFile(String file) {
    const _cols = ['１', '２', '３', '４', '５', '６', '７', '８', '９'];
    const _rows = ['一', '二', '三', '四', '五', '六', '七', '八', '九'];

    if (file != null) {
      var player = PlayerType.sente;
      final lines = _determineMoves(file);
      final moves = <Move>[];
      for (final line in lines) {
        final components = _convertMoveAsTextIntoComponents(line);
        if (components != null) {
          int row, column;
          var isCapture = false;
          if (components[_CaptureGroup.to.index][0] == _sameSymbol) {
            column = moves.last.to.column;
            row = moves.last.to.row;
            isCapture = true;
          } else {
            column = _cols.indexOf(components[_CaptureGroup.to.index][0]) + 1;
            row = _rows.indexOf(components[_CaptureGroup.to.index][1]) + 1;
            isCapture =
                _determineCapture(moves, Position(column: column, row: row));
          }

          // parse each component
          final piece = PackageUtils.pieceStringToType(
            components[_CaptureGroup.piece.index],
            usesJapanese: true,
          );
          final isDrop =
              components[_CaptureGroup.movement.index] == _dropSymbol;
          final from = isDrop
              ? null
              : Position.fromString(
                  components[_CaptureGroup.from.index]
                      .replaceAll('(', '')
                      .replaceAll(')', ''),
                );
          final to = Position(column: column, row: row);
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

        player = player.flip();
      }

      return moves;
    }

    return null;
  }

  /// Returns the moves from a KIFu by parsing out metadata
  List<String> _determineMoves(String file) {
    var lines = file.split('\n');
    final headerIndex =
        lines.indexWhere((line) => RegExp(r'手数-+指手-+消費時間-+').hasMatch(line));
    if (headerIndex != null) {
      return lines.sublist(headerIndex + 1);
    }

    return null;
  }

  /// Determines if the move results in a capture
  bool _determineCapture(List<Move> moves, Position postion) {
    var gameBoard = ShogiUtils.initialBoard;
    for (final move in moves) {
      gameBoard = GameEngine.makeMove(gameBoard, move);
    }

    return gameBoard.boardPieces
        .where((piece) => piece.position == postion)
        .isNotEmpty;
  }

  /// A regexp used to parse all potential moves
  ///
  /// 1. to, either ７六 or 同
  /// 2. piece type, i.e. 玉, 六, 龍
  /// 3. promotion, 成 (optional)
  /// 4. movement type, i.e. 打 (optional)
  /// 5. from, assumed to be two digits i.e. 11 (optional)
  static final _regExp = RegExp(
      r'([１２３４５６７８９][一二三四五六七八九同]|同\s)([歩香桂銀金角飛玉王と杏圭全馬龍])(成)*(打)*(\((\d\d)\))*');

  /// The number of groups captured by `_regExp`
  static int get _numberCaptureGroups => _CaptureGroup.values.length;

  /// A list of group indeces from 1 to 6, used to get all matched groups from `_regExp`
  static final _groupIndeces =
      List.generate(_numberCaptureGroups, (index) => index + 1);

  /// Converts a move `７七角成(22)` into `[７七, 角, 成, (22)]`
  List<String> _convertMoveAsTextIntoComponents(String moveAsText) {
    if (_regExp.hasMatch(moveAsText)) {
      final matches = _regExp.allMatches(moveAsText);
      return matches?.first?.groups(_groupIndeces);
    }

    return null;
  }
}
