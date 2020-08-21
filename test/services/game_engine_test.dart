import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('GameEngine.makeMove()', () {
    const initialBoard = [
      '☖:K-51',
      '☖:S-52',
      '☗:P-53',
    ];

    final movesFile = '''
☗P53x52+
☖K51x52
''';

    final converter = CustomNotationConverter();
    var gameBoard = ShogiUtils.stringArrayToGameBoard(initialBoard);
    expect(gameBoard.boardPieces, [
      BoardPiece(
        player: PlayerType.gote,
        pieceType: PieceType.king,
        position: Position(column: 5, row: 1),
      ),
      BoardPiece(
        player: PlayerType.gote,
        pieceType: PieceType.silver,
        position: Position(column: 5, row: 2),
      ),
      BoardPiece(
        player: PlayerType.sente,
        pieceType: PieceType.pawn,
        position: Position(column: 5, row: 3),
      )
    ]);
    expect(gameBoard.sentePiecesInHand, []);
    expect(gameBoard.gotePiecesInHand, []);

    final moves = converter.movesFromFile(movesFile);
    expect(moves, [
      Move(
        player: PlayerType.sente,
        piece: PieceType.pawn,
        from: Position(column: 5, row: 3),
        to: Position(column: 5, row: 2),
        isDrop: false,
        isCapture: true,
        isPromotion: true,
      ),
      Move(
        player: PlayerType.gote,
        piece: PieceType.king,
        from: Position(column: 5, row: 1),
        to: Position(column: 5, row: 2),
        isDrop: false,
        isCapture: true,
        isPromotion: false,
      ),
    ]);

    final gameBoards = [];
    for (final move in moves) {
      gameBoard = GameEngine.makeMove(gameBoard, move);
      gameBoards.add(gameBoard);
    }

    gameBoard = gameBoards[0];
    expect(gameBoard.boardPieces, [
      BoardPiece(
        player: PlayerType.gote,
        pieceType: PieceType.king,
        position: Position(column: 5, row: 1),
      ),
      BoardPiece(
        player: PlayerType.sente,
        pieceType: PieceType.pawnPromoted,
        position: Position(column: 5, row: 2),
      )
    ]);
    expect(gameBoard.sentePiecesInHand, [
      BoardPiece(
        player: PlayerType.sente,
        pieceType: PieceType.silver,
        position: null,
      ),
    ]);
    expect(gameBoard.gotePiecesInHand, []);

    gameBoard = gameBoards[1];
    expect(gameBoard.boardPieces, [
      BoardPiece(
        player: PlayerType.gote,
        pieceType: PieceType.king,
        position: Position(column: 5, row: 2),
      ),
    ]);
    expect(gameBoard.sentePiecesInHand, [
      BoardPiece(
        player: PlayerType.sente,
        pieceType: PieceType.silver,
        position: null,
      ),
    ]);
    expect(gameBoard.gotePiecesInHand, [
      BoardPiece(
        player: PlayerType.gote,
        pieceType: PieceType.pawn,
        position: null,
      ),
    ]);
  });
}
