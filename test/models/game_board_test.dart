import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

main() {
  test('Null', () {
    final gameBoard = GameBoard(boardPieces: null);
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isEmpty);
    expect(gameBoard.sentePiecesInHand, isEmpty);
    expect(gameBoard.gotePiecesInHand, isEmpty);
  });

  test('Empty', () {
    final gameBoard = GameBoard(boardPieces: []);
    expect(gameBoard, isNotNull);
    expect(gameBoard.boardPieces, isEmpty);
    expect(gameBoard.sentePiecesInHand, isEmpty);
    expect(gameBoard.gotePiecesInHand, isEmpty);
  });
}
