import '../configs/board_config.dart';
import '../extensions/string_extensions.dart';
import '../models/position.dart';
import '../models/game_board.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../utils/package_utils.dart';

/// A service which converts to/from SFEN notation for a static game position
class SFENConverter {
  /// The number of sections expected (9 rows, player to move, pieces in hand)
  static const _numberExpectedSections = 11;

  /// A regexp used to split a SFEN string into sections
  static final _sectionsRegExp = RegExp(r'/|\s');

  /// A regexp used to parse a row using SFEN notation
  static final _sfenRegExp =
      RegExp(r'(P|L|N|S|G|K|B|R|\+P|\+L|\+N|\+S|\+B|\+R|[1-9]|p|l|n|s|g|k|b|r|\+p|\+l|\+n|\+s|\+b|\+r|-)');

  /// A delimited to state that neither player has any pieces in hand
  static const _noPiecesInHand = '-';

  /// A regexp used to parse pieces in hand using SFEN notation
  static final _piecesInHandRegExp = RegExp(r'\d*[P|L|N|S|G|B|R|p|l|n|s|g|b|r]');

  /// Converts a board notated using SFEN notation into a `GameBoard`
  static GameBoard sfenToGameBoard(String string) {
    final sections = string.split(_sectionsRegExp);
    assert(sections.length == _numberExpectedSections);

    final boardPieces = <BoardPiece>[];
    int row = 1; //SFEN notation begins at 91
    int column;
    for (final section in sections.take(BoardConfig.numberRows)) {
      column = BoardConfig.numberColumns;

      final matches = _sfenRegExp.allMatches(section);
      for (final match in matches) {
        final matchText = match.group(0);
        int valueAsInt = int.tryParse(matchText);
        if (valueAsInt != null) {
          assert(valueAsInt <= BoardConfig.numberColumns);
          if (valueAsInt <= BoardConfig.numberColumns) {
            column -= valueAsInt;
          }
        } else {
          final player = matchText.last.isLowerCase ? PlayerType.gote : PlayerType.sente;
          final pieceType = PackageUtils.pieceStringToType(matchText.toUpperCase());
          boardPieces.add(
            BoardPiece(
              player: player,
              pieceType: pieceType,
              position: Position(column: column, row: row),
            ),
          );

          column--;
        }
      }

      row++;
    }

    // TODO presently ignoreing player to move

    final sentePiecesInHand = <BoardPiece>[];
    final gotePiecesInHand = <BoardPiece>[];
    if (sections.last != _noPiecesInHand) {
      final matches = _piecesInHandRegExp.allMatches(sections.last);
      for (final match in matches) {
        final matchText = match.group(0);
        if (matchText != null) {
          final count = int.tryParse(matchText.first) ?? 1;
          final pieceText = matchText.length > 1 ? matchText.last : matchText;
          final player = pieceText.last.isLowerCase ? PlayerType.gote : PlayerType.sente;
          final pieceType = PackageUtils.pieceStringToType(pieceText.toUpperCase());
          final list = player.isGote ? gotePiecesInHand : sentePiecesInHand;
          for (int i = 0; i < count; i++) {
            list.add(
              BoardPiece(
                player: player,
                pieceType: pieceType,
                position: null,
              ),
            );
          }
        }
      }
    }

    return GameBoard(
      boardPieces: boardPieces,
      sentePiecesInHand: sentePiecesInHand,
      gotePiecesInHand: gotePiecesInHand,
    );
  }
}