import 'dart:async';

import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  group('GameBoard', () {
    test('Null', () {
      final gameBoard = GameBoard(
        boardPieces: null,
        sentePiecesInHand: null,
        gotePiecesInHand: null,
      );
      expect(gameBoard, isNotNull);
      expect(gameBoard.boardPieces, isNotNull);
      expect(gameBoard.boardPieces, isEmpty);
      expect(gameBoard.sentePiecesInHand, isNotNull);
      expect(gameBoard.sentePiecesInHand, isEmpty);
      expect(gameBoard.gotePiecesInHand, isNotNull);
      expect(gameBoard.gotePiecesInHand, isEmpty);
      expect(gameBoard.isEmpty, isTrue);
    });

    test('Empty', () {
      final gameBoard = GameBoard(
        boardPieces: [],
        sentePiecesInHand: [],
        gotePiecesInHand: [],
      );
      expect(gameBoard, isNotNull);
      expect(gameBoard.boardPieces, isEmpty);
      expect(gameBoard.sentePiecesInHand, isEmpty);
      expect(gameBoard.gotePiecesInHand, isEmpty);
      expect(gameBoard.isEmpty, isTrue);
    });

    test('Empty named constructor', () {
      final gameBoard = GameBoard.empty();
      expect(gameBoard, isNotNull);
      expect(gameBoard.boardPieces, isEmpty);
      expect(gameBoard.sentePiecesInHand, isEmpty);
      expect(gameBoard.gotePiecesInHand, isEmpty);
      expect(gameBoard.isEmpty, isTrue);
    });

    test('Equality', () {
      final gameBoard1 = GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.sente,
            position: Position.fromString('97'),
          ),
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.gote,
            position: Position.fromString('13'),
          ),
        ],
        sentePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.sente,
            position: null,
          ),
        ],
        gotePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.gote,
            position: null,
          ),
        ],
      );
      final gameBoard2 = GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.sente,
            position: Position.fromString('97'),
          ),
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.gote,
            position: Position.fromString('13'),
          ),
        ],
        sentePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.sente,
            position: null,
          ),
        ],
        gotePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.gote,
            position: null,
          ),
        ],
      );
      expect(gameBoard1, isNotNull);
      expect(gameBoard2, isNotNull);
      expect(gameBoard1, gameBoard2);
      expect(gameBoard1.isEmpty, isFalse);
      expect(gameBoard2.isEmpty, isFalse);
    });
  });

  group('GameBoardExtensions', () {
    group('printToConsole', () {
      final gameboard = ShogiUtils.initialBoard;

      // gameboard.printToConsole(useJapanese: true);

      test('when useJapanese is true, expect bod output', overridePrint(() {
        gameboard.printToConsole(useJapanese: true);
        expect(
          log,
          '''
後手の持駒：なし
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
|v香v桂v銀v金v玉v金v銀v桂v香|一
| ・v飛 ・ ・ ・ ・ ・v角 ・|二
|v歩v歩v歩v歩v歩v歩v歩v歩v歩|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ ・ ・ ・ ・ ・ ・ ・ ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| 歩 歩 歩 歩 歩 歩 歩 歩 歩|七
| ・ 角 ・ ・ ・ ・ ・ 飛 ・|八
| 香 桂 銀 金 玉 金 銀 桂 香|九
+---------------------------+
先手の持駒：なし
''',
        );
      }));

      test('when useJapanese is false, expect asciioutput', overridePrint(() {
        gameboard.printToConsole(useJapanese: false);
        expect(log, '''

|l |n |s |g |k |g |s |n |l |
|  |r |  |  |  |  |  |b |  |
|p |p |p |p |p |p |p |p |p |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|P |P |P |P |P |P |P |P |P |
|  |B |  |  |  |  |  |R |  |
|L |N |S |G |K |G |S |N |L |

''');
      }));
    });
  });
}

// Taken from https://stackoverflow.com/a/38709440
var log = '';
void Function() overridePrint(void Function() testFn) => () {
      var spec = ZoneSpecification(print: (_, __, ___, String msg) {
        // instead of printing to console, update log var
        log = msg;
      });
      return Zone.current.fork(specification: spec).run<void>(testFn);
    };
