import 'package:shogi/shogi.dart';
import 'package:shogi/src/services/board_notation/bod_converter.dart';
import 'package:test/test.dart';

void main() {
  final tsume = '''
後手の持駒：飛二　角　金四　銀二　桂四　香四　歩十七　
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・v銀v玉v銀 ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ と ・ ・ ・ ・|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ ・ ・ ・ ・ ・ ・ 馬 ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| ・ ・ ・ ・ ・ ・ ・ ・ ・|七
| ・ ・ ・ ・ ・ ・ ・ ・ ・|八
| ・ ・ ・ ・ ・ ・ ・ ・ ・|九
+---------------------------+
先手の持駒：なし
''';

  final initialBoard = '''
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
''';

  final empty = '''
後手の持駒：なし
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・ ・ ・ ・ ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ ・ ・ ・ ・ ・|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ ・ ・ ・ ・ ・ ・ ・ ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| ・ ・ ・ ・ ・ ・ ・ ・ ・|七
| ・ ・ ・ ・ ・ ・ ・ ・ ・|八
| ・ ・ ・ ・ ・ ・ ・ ・ ・|九
+---------------------------+
先手の持駒：なし
''';

  final tsume2 = '''
後手の持駒：飛二　角二　金二　銀四　桂四　香四　歩十八　
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・ ・v玉 ・ ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ 金 ・ ・ ・ ・|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ ・ ・ ・ ・ ・ ・ ・ ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| ・ ・ ・ ・ ・ ・ ・ ・ ・|七
| ・ ・ ・ ・ ・ ・ ・ ・ ・|八
| ・ ・ ・ ・ ・ ・ ・ ・ ・|九
+---------------------------+
先手の持駒：金　
''';

  test('Ensure from bod as expected', () {
    final gameBoard = BODConverter.bodToGameBoard(tsume);
    expect(gameBoard, isNotNull);
    expect(
      gameBoard,
      GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.silver,
            player: PlayerType.gote,
            position: Position.fromString('61'),
          ),
          BoardPiece(
            pieceType: PieceType.king,
            player: PlayerType.gote,
            position: Position.fromString('51'),
          ),
          BoardPiece(
            pieceType: PieceType.silver,
            player: PlayerType.gote,
            position: Position.fromString('41'),
          ),
          BoardPiece(
            pieceType: PieceType.pawnPromoted,
            player: PlayerType.sente,
            position: Position.fromString('53'),
          ),
          BoardPiece(
            pieceType: PieceType.bishopPromoted,
            player: PlayerType.sente,
            position: Position.fromString('25'),
          ),
        ],
        sentePiecesInHand: [],
        gotePiecesInHand: [
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.rook,
              player: PlayerType.gote,
              position: null,
            ),
          BoardPiece(
            pieceType: PieceType.bishop,
            player: PlayerType.gote,
            position: null,
          ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.gold,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.silver,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.knight,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.lance,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 17; i++)
            BoardPiece(
              pieceType: PieceType.pawn,
              player: PlayerType.gote,
              position: null,
            ),
        ],
      ),
    );
  });

  test('Ensure from bod as expected', () {
    final gameboard = BODConverter.bodToGameBoard(initialBoard);
    expect(gameboard, isNotNull);
    expect(gameboard, ShogiUtils.initialBoard);
  });

  test('Ensure from bod as expected', () {
    final gameBoard = BODConverter.bodToGameBoard(tsume2);
    expect(gameBoard, isNotNull);
    expect(
      gameBoard,
      GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.king,
            player: PlayerType.gote,
            position: Position.fromString('51'),
          ),
          BoardPiece(
            pieceType: PieceType.gold,
            player: PlayerType.sente,
            position: Position.fromString('53'),
          ),
        ],
        sentePiecesInHand: [
          BoardPiece(
            pieceType: PieceType.gold,
            player: PlayerType.sente,
            position: null,
          ),
        ],
        gotePiecesInHand: [
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.rook,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.bishop,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 2; i++)
            BoardPiece(
              pieceType: PieceType.gold,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.silver,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.knight,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 4; i++)
            BoardPiece(
              pieceType: PieceType.lance,
              player: PlayerType.gote,
              position: null,
            ),
          for (var i = 0; i < 18; i++)
            BoardPiece(
              pieceType: PieceType.pawn,
              player: PlayerType.gote,
              position: null,
            ),
        ],
      ),
    );
  });

  test('fromBOD null', () {
    final gameboard = BODConverter.bodToGameBoard(null);
    expect(gameboard, isNotNull);
    expect(gameboard, GameBoard.empty());
  });

  test('fromBOD, gameboard empty', () {
    final gameboard = BODConverter.bodToGameBoard('');
    expect(gameboard, isNotNull);
    expect(gameboard, GameBoard.empty());
  });

  test('fromBOD, invalid bod (board length)', () {
    final invalid = '''
後手の持駒：なし
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・ ・ ・ ・ ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ ・ ・ ・ ・ ・|九
+---------------------------+
先手の持駒：なし
''';
    final gameboard = BODConverter.bodToGameBoard(invalid);
    expect(gameboard, isNotNull);
    expect(gameboard, GameBoard.empty());
  });

  test('fromBOD, invalid bod (symbols)', () {
    final invalid = '''
後手の持駒：なし
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・ ・v玉 ・ ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ ・ ・ ・ ・ ・|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ ・ ・ ・ ・ ・ ・ ・ ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| ・ ・ ・ ・ ・ ・ ・ ・ ・|七
| ・ ・ ・ ・ ・ ・ ・ ・ ・|八
| ・ ・ ・ ・ K ・ ・ ・ ・|九
+---------------------------+
先手の持駒：なし
''';
    final gameboard = BODConverter.bodToGameBoard(invalid);
    expect(gameboard, isNotNull);
    expect(
      gameboard,
      GameBoard(
        boardPieces: [
          BoardPiece(
            pieceType: PieceType.king,
            player: PlayerType.gote,
            position: Position.fromString('51'),
          ),
        ],
        sentePiecesInHand: [],
        gotePiecesInHand: [],
      ),
    );
  });

  test('Ensure to bod as expected', () {
    final gameBoard = GameBoard(boardPieces: [
      BoardPiece(
        pieceType: PieceType.king,
        player: PlayerType.gote,
        position: Position.fromString('51'),
      ),
      BoardPiece(
        pieceType: PieceType.silver,
        player: PlayerType.gote,
        position: Position.fromString('41'),
      ),
      BoardPiece(
        pieceType: PieceType.silver,
        player: PlayerType.gote,
        position: Position.fromString('61'),
      ),
      BoardPiece(
        pieceType: PieceType.pawnPromoted,
        player: PlayerType.sente,
        position: Position.fromString('53'),
      ),
      BoardPiece(
        pieceType: PieceType.bishopPromoted,
        player: PlayerType.sente,
        position: Position.fromString('25'),
      ),
    ], sentePiecesInHand: [], gotePiecesInHand: [
      for (var i = 0; i < 2; i++)
        BoardPiece(
          pieceType: PieceType.rook,
          player: PlayerType.gote,
          position: null,
        ),
      BoardPiece(
        pieceType: PieceType.bishop,
        player: PlayerType.gote,
        position: null,
      ),
      for (var i = 0; i < 4; i++)
        BoardPiece(
          pieceType: PieceType.gold,
          player: PlayerType.gote,
          position: null,
        ),
      for (var i = 0; i < 2; i++)
        BoardPiece(
          pieceType: PieceType.silver,
          player: PlayerType.gote,
          position: null,
        ),
      for (var i = 0; i < 4; i++)
        BoardPiece(
          pieceType: PieceType.knight,
          player: PlayerType.gote,
          position: null,
        ),
      for (var i = 0; i < 4; i++)
        BoardPiece(
          pieceType: PieceType.lance,
          player: PlayerType.gote,
          position: null,
        ),
      for (var i = 0; i < 17; i++)
        BoardPiece(
          pieceType: PieceType.pawn,
          player: PlayerType.gote,
          position: null,
        ),
    ]);
    final string = BODConverter.fromGameBoardToBod(gameBoard);
    expect(string, tsume);
  });

  test('Ensure to bod as expected', () {
    final string = BODConverter.fromGameBoardToBod(ShogiUtils.initialBoard);
    expect(string, initialBoard);
  });

  test('Ensure to bod as expected', () {
    final gameBoard = GameBoard(
      boardPieces: [
        BoardPiece(
          pieceType: PieceType.king,
          player: PlayerType.gote,
          position: Position.fromString('51'),
        ),
        BoardPiece(
          pieceType: PieceType.gold,
          player: PlayerType.sente,
          position: Position.fromString('53'),
        ),
      ],
      sentePiecesInHand: [
        BoardPiece(
          pieceType: PieceType.gold,
          player: PlayerType.sente,
          position: null,
        ),
      ],
      gotePiecesInHand: [
        for (var i = 0; i < 2; i++)
          BoardPiece(
            pieceType: PieceType.rook,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 2; i++)
          BoardPiece(
            pieceType: PieceType.bishop,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 2; i++)
          BoardPiece(
            pieceType: PieceType.gold,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 4; i++)
          BoardPiece(
            pieceType: PieceType.silver,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 4; i++)
          BoardPiece(
            pieceType: PieceType.knight,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 4; i++)
          BoardPiece(
            pieceType: PieceType.lance,
            player: PlayerType.gote,
            position: null,
          ),
        for (var i = 0; i < 18; i++)
          BoardPiece(
            pieceType: PieceType.pawn,
            player: PlayerType.gote,
            position: null,
          ),
      ],
    );
    final string = BODConverter.fromGameBoardToBod(gameBoard);
    expect(string, tsume2);
  });

  test('toBOD, gameboard null', () {
    final bod = BODConverter.fromGameBoardToBod(null);
    expect(bod, isEmpty);
  });

  test('toBOD, gameboard empty', () {
    final bod = BODConverter.fromGameBoardToBod(GameBoard.empty());
    expect(bod, empty);
  });
}
