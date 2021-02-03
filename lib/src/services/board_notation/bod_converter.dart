import 'package:meta/meta.dart';

import '../../configs/board_config.dart';
import '../../enums/piece_type.dart';
import '../../enums/player_type.dart';
import '../../models/board_piece.dart';
import '../../models/game_board.dart';
import '../../models/position.dart';
import '../../utils/package_utils.dart';
import '../../utils/shogi_utils.dart';

/// A service which converts to/from BOD notation for a static game position
class BODConverter {
  static const _gotePieces = '後手の持駒：';

  static const _noPieces = 'なし';

  static const _horizontalBorder = '+---------------------------+';

  static const _verticalBorder = '|';

  static const _sentePieces = '先手の持駒：';

  static const _emptySquare = '・';

  static const _space = '　';

  static const _gotePieceSymbol = 'v';

  /// Converts a board notated using BOD notation into a `GameBoard`
  static GameBoard bodToGameBoard(String string) {
    if (string != null && string.isNotEmpty) {
      string = string.replaceAll('\r\n', '\n'); // windows
      var lines = string.split('\n');
      var index1 = lines.indexWhere((element) => element == _horizontalBorder);
      if (index1 != -1 && index1 < lines.length - 1) {
        index1++;
        final index2 = lines.indexWhere(
          (element) => element == _horizontalBorder,
          index1,
        );
        if (index2 != -1 && index2 - index1 == BoardConfig.numberRows) {
          final gotePiecesInHand = _inHand(lines, PlayerType.gote);

          final boardPieces = <BoardPiece>[];
          final parsedBoard = _parseBoard(lines.sublist(index1, index2));
          for (var r = 0; r < 9; r++) {
            for (var c = 0; c < 9; c++) {
              final pieceType = PackageUtils.pieceStringToType(
                parsedBoard[r][c][1],
                usesJapanese: true,
              );
              if (pieceType != null) {
                final player = parsedBoard[r][c][0] == _gotePieceSymbol
                    ? PlayerType.gote
                    : PlayerType.sente;
                boardPieces.add(
                  BoardPiece(
                    pieceType: pieceType,
                    player: player,
                    position: Position(row: r + 1, column: 9 - c),
                  ),
                );
              }
            }
          }

          final sentePiecesInHand = _inHand(lines, PlayerType.sente);

          return GameBoard(
            boardPieces: boardPieces,
            sentePiecesInHand: sentePiecesInHand,
            gotePiecesInHand: gotePiecesInHand,
          );
        }
      }
    }

    return GameBoard.empty();
  }

  static List<BoardPiece> _inHand(List<String> lines, PlayerType playerType) {
    final senteGotePieces = playerType.isSente ? _sentePieces : _gotePieces;

    final pieces = <BoardPiece>[];

    var line = lines.firstWhere(
      (line) => line.startsWith(senteGotePieces),
      orElse: () => null,
    );
    if (line != null) {
      line = line.replaceAll(senteGotePieces, '');
      line.trim();
      if (line != _noPieces) {
        final components =
            line.split(_space).where((element) => element.isNotEmpty);
        for (final component in components) {
          if (component.isNotEmpty) {
            final pieceType = PackageUtils.pieceStringToType(component[0],
                usesJapanese: true);
            final count = component.length > 1
                ? PackageUtils.japaneseKaniToArabic(component.substring(1))
                : 1;
            for (var i = 0; i < count; i++) {
              pieces.add(BoardPiece(
                pieceType: pieceType,
                player: PlayerType.gote,
              ));
            }
          }
        }
      }
    }

    return pieces;
  }

  static List<List<String>> _parseBoard(List<String> lines) {
    final parsedBoard = <List<String>>[];
    for (final line in lines) {
      if (line.length >= 21 &&
          line.substring(0, 1) == _verticalBorder &&
          line.substring(19, 20) == _verticalBorder) {
        final a = line.substring(1, 19);
        final row = <String>[];
        for (var i = 0; i < 9; i++) {
          row.add(a.substring(i * 2, i * 2 + 2));
        }
        parsedBoard.add(row);
      }
    }
    return parsedBoard;
  }

  /// Converts a board notated using SFEN notation into a `GameBoard`
  static String fromGameBoardToBod(GameBoard gameboard) {
    final sb = StringBuffer();
    if (gameboard != null) {
      // gote pieces in hand
      sb.write(_gotePieces);
      if (gameboard.gotePiecesInHand.isEmpty) {
        sb.writeln(_noPieces);
      } else {
        for (final piece in ShogiUtils.piecesInHandOrder) {
          final count = gameboard.countPiecesInHand(
              pieceType: piece, playerType: PlayerType.gote);
          if (count > 0) {
            sb.write(PackageUtils.pieceTypeToString(piece, usesJapanese: true));
            if (count > 1) {
              sb.write(PackageUtils.arabicToJapaneseKanji(count));
            }
            sb.write(_space);
          }
        }
        sb.writeln();
      }

      // board
      sb.writeln('  ９ ８ ７ ６ ５ ４ ３ ２ １');
      sb.writeln(_horizontalBorder);
      for (var row = 1; row <= BoardConfig.numberRows; row++) {
        sb.write(_verticalBorder);
        for (var col = BoardConfig.numberColumns; col > 0; col--) {
          final boardPiece = gameboard.withPosition(col: col, row: row);
          if (boardPiece != null) {
            sb.write(boardPiece.isSente ? ' ' : _gotePieceSymbol);
            sb.write(PackageUtils.pieceTypeToString(
              boardPiece.pieceType,
              usesJapanese: true,
              isSente: true, // sente's king is always used
            ));
          } else {
            sb.write(' $_emptySquare');
          }
        }
        sb.write(_verticalBorder);
        sb.write('${PackageUtils.arabicToJapaneseKanji(row)}');
        sb.writeln();
      }
      sb.writeln(_horizontalBorder);

      // sente pieces in hand
      sb.write(_sentePieces);
      if (gameboard.sentePiecesInHand.isEmpty) {
        sb.writeln(_noPieces);
      } else {
        for (final piece in ShogiUtils.piecesInHandOrder) {
          final count = gameboard.countPiecesInHand(
              pieceType: piece, playerType: PlayerType.sente);
          if (count > 0) {
            sb.write(PackageUtils.pieceTypeToString(piece, usesJapanese: true));
            if (count > 1) {
              sb.write(PackageUtils.arabicToJapaneseKanji(count));
            }
            sb.write(_space);
          }
        }
        sb.writeln();
      }
    }

    return sb.toString();
  }
}

extension GameBoardExtensions on GameBoard {
  BoardPiece withPosition({
    @required int col,
    @required int row,
  }) =>
      this?.boardPieces?.firstWhere(
            (piece) =>
                piece.position.column == col && piece.position.row == row,
            orElse: () => null,
          );

  int countPiecesInHand({
    @required PieceType pieceType,
    @required PlayerType playerType,
  }) {
    final piecesInHand =
        playerType.isSente ? sentePiecesInHand : gotePiecesInHand;
    return piecesInHand
        .where((piece) => piece.pieceType == pieceType)
        .toList()
        .length;
  }
}
