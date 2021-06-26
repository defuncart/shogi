import 'package:collection/collection.dart' show IterableExtension;

import '../../enums/piece_type.dart';
import '../../enums/player_type.dart';
import '../../models/game_board.dart';
import '../../models/move.dart';
import '../../models/position.dart';
import '../../utils/package_utils.dart';
import '../game_engine.dart';
import 'i_move_notation_converter.dart';

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
class KIFNotationConverter implements IMoveNotationConverter {
  /// The symbol used when to coords are same as last move
  static const _sameSymbol = '同';

  /// The symbol used to represent a drop
  static const _dropSymbol = '打';

  /// The symbol used to represent promotion
  static const _promotionSymbol = '成';

  /// Maps PieceType to String
  ///
  /// Note that this is different from [PackageUtils.pieceTypeToString(pieceType)]
  /// due to `成香`, `成桂`, `成銀` kif-specific notation
  static const _mapPieceString = {
    PieceType.king: '玉',
    PieceType.rook: '飛',
    PieceType.bishop: '角',
    PieceType.gold: '金',
    PieceType.silver: '銀',
    PieceType.knight: '桂',
    PieceType.lance: '香',
    PieceType.pawn: '歩',
    PieceType.rookPromoted: '龍',
    PieceType.bishopPromoted: '馬',
    PieceType.silverPromoted: '成銀',
    PieceType.knightPromoted: '成桂',
    PieceType.lancePromoted: '成香',
    PieceType.pawnPromoted: 'と',
  };

  /// Maps String to PieceType
  final _mapStringPiece = _mapPieceString.map((k, v) => MapEntry(v, k));

  /// Converts a file of the form
  ///
  /// ```
  /// 1 ７六歩(77)
  /// 2 ３四歩(33)
  /// ```
  ///
  /// to a list of game moves.
  ///
  /// Assumes that Sente and Gote alternate moves.
  @override
  List<Move> movesFromFile(String file, {GameBoard? initialBoard}) {
    assert(initialBoard != null && !initialBoard.isEmpty);

    var player = PlayerType.sente;
    final lines = _determineMoves(file);
    final moves = <Move>[];
    if (lines != null) {
      for (final line in lines) {
        final components = _convertMoveAsTextIntoComponents(line);
        if (components != null) {
          if (components[_CaptureGroup.to.index] == null) {
            break;
          }
          if (components[_CaptureGroup.piece.index] == null) {
            break;
          }
          if (components[_CaptureGroup.movement.index] == null &&
              components[_CaptureGroup.from.index] == null) {
            break;
          }

          int row, column;
          var isCapture = false;
          if (components[_CaptureGroup.to.index]![0] == _sameSymbol) {
            column = moves.last.to.column;
            row = moves.last.to.row;
            isCapture = true;
          } else {
            column = PackageUtils.japaneseDigitToArabic(
                components[_CaptureGroup.to.index]![0]);
            row = PackageUtils.japaneseKaniToArabic(
                components[_CaptureGroup.to.index]![1]);
            isCapture = _determineCapture(
              initialBoard,
              moves,
              Position(column: column, row: row),
            );
          }

          // parse each component
          final piece =
              _mapStringPiece[components[_CaptureGroup.piece.index]!]!;
          final isDrop =
              components[_CaptureGroup.movement.index] == _dropSymbol;
          final from = isDrop
              ? null
              : Position.fromString(
                  components[_CaptureGroup.from.index]!
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
              asKif: _cleanKif(line),
            ),
          );
        }

        player = player.flip();
      }
    }

    return moves;
  }

  /// Returns the moves from a KIFu by parsing out metadata
  List<String>? _determineMoves(String file) {
    var lines = file.split('\n');
    final headerIndex =
        lines.indexWhere((line) => RegExp(r'手数-+指手-+消費時間-+').hasMatch(line));
    if (headerIndex != -1) {
      return lines.sublist(headerIndex + 1);
    }

    return null;
  }

  /// Determines if the move results in a capture
  bool _determineCapture(
    GameBoard? initialBoard,
    List<Move> moves,
    Position postion,
  ) {
    var gameBoard = initialBoard;
    for (final move in moves) {
      gameBoard = GameEngine.makeMove(gameBoard!, move);
    }

    return gameBoard!.boardPieces
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
      r'([１２３４５６７８９][一二三四五六七八九]|同\s)(歩|香|桂|銀|金|角|飛|玉|王|と|成香|成桂|成銀|馬|龍)(成)*(打)*(\((\d\d)\))*');

  /// The number of groups captured by `_regExp`
  static int get _numberCaptureGroups => _CaptureGroup.values.length;

  /// A list of group indeces from 1 to 6, used to get all matched groups from `_regExp`
  static final _groupIndeces =
      List.generate(_numberCaptureGroups, (index) => index + 1);

  /// Converts a move `７七角成(22)` into `[７七, 角, 成, (22)]`
  List<String?>? _convertMoveAsTextIntoComponents(String moveAsText) {
    if (_regExp.hasMatch(moveAsText)) {
      final matches = _regExp.allMatches(moveAsText);
      return matches.first.groups(_groupIndeces);
    }

    return null;
  }

  @override
  PlayerType? determineWinner(String? file) {
    if (file != null) {
      final line = file.split('\n').firstWhereOrNull(
            (element) => element.contains('投了'),
          );
      if (line != null) {
        final lineNumber = int.tryParse(line.trimLeft().split(' ').first);
        if (lineNumber != null) {
          return lineNumber % 2 == 1 ? PlayerType.gote : PlayerType.sente;
        }
      }
    }

    return null;
  }

  /// Cleans a line of the form `   1 ７六歩(77) (00:00:00)` into `1 ７六歩(77)`
  String? _cleanKif(String line) {
    final moveRegex = RegExp(
        r'\d+\s[１２３４５６７８９一二三四五六七八九同\s]+[歩香桂銀金角飛玉王と成馬龍]*成*[打引寄上右左直行入]*(?:\((\d\d)\))*');
    return moveRegex.firstMatch(line)?.group(0);
  }
}
