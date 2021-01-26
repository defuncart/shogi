import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('canBePromoted', () {
    expect(PieceType.king.canBePromoted, isFalse);
    expect(PieceType.rook.canBePromoted, isTrue);
    expect(PieceType.bishop.canBePromoted, isTrue);
    expect(PieceType.gold.canBePromoted, isFalse);
    expect(PieceType.silver.canBePromoted, isTrue);
    expect(PieceType.knight.canBePromoted, isTrue);
    expect(PieceType.lance.canBePromoted, isTrue);
    expect(PieceType.pawn.canBePromoted, isTrue);
    expect(PieceType.rookPromoted.canBePromoted, isFalse);
    expect(PieceType.bishopPromoted.canBePromoted, isFalse);
    expect(PieceType.silverPromoted.canBePromoted, isFalse);
    expect(PieceType.lancePromoted.canBePromoted, isFalse);
    expect(PieceType.pawnPromoted.canBePromoted, isFalse);
  });

  test('promote', () {
    expect(PieceType.king.promote(), isNull);
    expect(PieceType.rook.promote(), PieceType.rookPromoted);
    expect(PieceType.bishop.promote(), PieceType.bishopPromoted);
    expect(PieceType.gold.promote(), isNull);
    expect(PieceType.silver.promote(), PieceType.silverPromoted);
    expect(PieceType.knight.promote(), PieceType.knightPromoted);
    expect(PieceType.lance.promote(), PieceType.lancePromoted);
    expect(PieceType.pawn.promote(), PieceType.pawnPromoted);
    expect(PieceType.rookPromoted.promote(), isNull);
    expect(PieceType.bishopPromoted.promote(), isNull);
    expect(PieceType.silverPromoted.promote(), isNull);
    expect(PieceType.lancePromoted.promote(), isNull);
    expect(PieceType.pawnPromoted.promote(), isNull);
  });

  test('isPromoted', () {
    expect(PieceType.king.isPromoted, isFalse);
    expect(PieceType.rook.isPromoted, isFalse);
    expect(PieceType.bishop.isPromoted, isFalse);
    expect(PieceType.gold.isPromoted, isFalse);
    expect(PieceType.silver.isPromoted, isFalse);
    expect(PieceType.knight.isPromoted, isFalse);
    expect(PieceType.lance.isPromoted, isFalse);
    expect(PieceType.pawn.isPromoted, isFalse);
    expect(PieceType.rookPromoted.isPromoted, isTrue);
    expect(PieceType.bishopPromoted.isPromoted, isTrue);
    expect(PieceType.silverPromoted.isPromoted, isTrue);
    expect(PieceType.lancePromoted.isPromoted, isTrue);
    expect(PieceType.pawnPromoted.isPromoted, isTrue);
  });

  test('normalize', () {
    expect(PieceType.king.normalize(), PieceType.king);
    expect(PieceType.rook.normalize(), PieceType.rook);
    expect(PieceType.bishop.normalize(), PieceType.bishop);
    expect(PieceType.gold.normalize(), PieceType.gold);
    expect(PieceType.silver.normalize(), PieceType.silver);
    expect(PieceType.knight.normalize(), PieceType.knight);
    expect(PieceType.lance.normalize(), PieceType.lance);
    expect(PieceType.pawn.normalize(), PieceType.pawn);
    expect(PieceType.rookPromoted.normalize(), PieceType.rook);
    expect(PieceType.bishopPromoted.normalize(), PieceType.bishop);
    expect(PieceType.silverPromoted.normalize(), PieceType.silver);
    expect(PieceType.lancePromoted.normalize(), PieceType.lance);
    expect(PieceType.pawnPromoted.normalize(), PieceType.pawn);
  });

  test('canBeInHand', () {
    expect(PieceType.king.canBeInHand, isFalse);
    expect(PieceType.rook.canBeInHand, isTrue);
    expect(PieceType.bishop.canBeInHand, isTrue);
    expect(PieceType.gold.canBeInHand, isTrue);
    expect(PieceType.silver.canBeInHand, isTrue);
    expect(PieceType.knight.canBeInHand, isTrue);
    expect(PieceType.lance.canBeInHand, isTrue);
    expect(PieceType.pawn.canBeInHand, isTrue);
    expect(PieceType.rookPromoted.canBeInHand, isFalse);
    expect(PieceType.bishopPromoted.canBeInHand, isFalse);
    expect(PieceType.silverPromoted.canBeInHand, isFalse);
    expect(PieceType.lancePromoted.canBeInHand, isFalse);
    expect(PieceType.pawnPromoted.canBeInHand, isFalse);
  });
}
