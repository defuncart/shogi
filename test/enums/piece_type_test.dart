import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('PieceType.pawn', () {
    final pieceType = PieceType.pawn;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.pawnPromoted);
    expect(pieceType.normalize(), PieceType.pawn);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.lance', () {
    final pieceType = PieceType.lance;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.lancePromoted);
    expect(pieceType.normalize(), PieceType.lance);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.knight', () {
    final pieceType = PieceType.knight;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.knightPromoted);
    expect(pieceType.normalize(), PieceType.knight);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.silver', () {
    final pieceType = PieceType.silver;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.silverPromoted);
    expect(pieceType.normalize(), PieceType.silver);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.gold', () {
    final pieceType = PieceType.gold;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.gold);
    expect(pieceType.normalize(), PieceType.gold);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.king', () {
    final pieceType = PieceType.king;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.king);
    expect(pieceType.normalize(), PieceType.king);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.bishop', () {
    final pieceType = PieceType.bishop;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.bishopPromoted);
    expect(pieceType.normalize(), PieceType.bishop);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.rook', () {
    final pieceType = PieceType.rook;
    expect(pieceType.canBePromoted, isTrue);
    expect(pieceType.isPromoted, isFalse);
    expect(pieceType.promote(), PieceType.rookPromoted);
    expect(pieceType.normalize(), PieceType.rook);
    expect(pieceType.canBeInHand, isTrue);
  });

  test('PieceType.pawnPromoted', () {
    final pieceType = PieceType.pawnPromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.pawnPromoted);
    expect(pieceType.normalize(), PieceType.pawn);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.lancePromoted', () {
    final pieceType = PieceType.lancePromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.lancePromoted);
    expect(pieceType.normalize(), PieceType.lance);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.knightPromoted', () {
    final pieceType = PieceType.knightPromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.knightPromoted);
    expect(pieceType.normalize(), PieceType.knight);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.silverPromoted', () {
    final pieceType = PieceType.silverPromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.silverPromoted);
    expect(pieceType.normalize(), PieceType.silver);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.bishopPromoted', () {
    final pieceType = PieceType.bishopPromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.bishopPromoted);
    expect(pieceType.normalize(), PieceType.bishop);
    expect(pieceType.canBeInHand, isFalse);
  });

  test('PieceType.rookPromoted', () {
    final pieceType = PieceType.rookPromoted;
    expect(pieceType.canBePromoted, isFalse);
    expect(pieceType.isPromoted, isTrue);
    expect(pieceType.promote(), PieceType.rookPromoted);
    expect(pieceType.normalize(), PieceType.rook);
    expect(pieceType.canBeInHand, isFalse);
  });
}
