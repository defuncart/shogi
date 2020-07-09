import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

main() {
  test('PieceType.pawn', () {
    final pieceType = PieceType.pawn;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.pawnPromoted);
    expect(pieceType.normalize(), PieceType.pawn);
  });

  test('PieceType.lance', () {
    final pieceType = PieceType.lance;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.lancePromoted);
    expect(pieceType.normalize(), PieceType.lance);
  });

  test('PieceType.knight', () {
    final pieceType = PieceType.knight;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.knightPromoted);
    expect(pieceType.normalize(), PieceType.knight);
  });

  test('PieceType.silver', () {
    final pieceType = PieceType.silver;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.silverPromoted);
    expect(pieceType.normalize(), PieceType.silver);
  });

  test('PieceType.gold', () {
    final pieceType = PieceType.gold;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.gold);
  });

  test('PieceType.king', () {
    final pieceType = PieceType.king;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.king);
  });

  test('PieceType.bishop', () {
    final pieceType = PieceType.bishop;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.bishopPromoted);
    expect(pieceType.normalize(), PieceType.bishop);
  });

  test('PieceType.rook', () {
    final pieceType = PieceType.rook;
    expect(pieceType.canBePromoted, true);
    expect(pieceType.isPromoted, false);
    expect(pieceType.promote(), PieceType.rookPromoted);
    expect(pieceType.normalize(), PieceType.rook);
  });

  test('PieceType.pawnPromoted', () {
    final pieceType = PieceType.pawnPromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.pawn);
  });

  test('PieceType.lancePromoted', () {
    final pieceType = PieceType.lancePromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.lance);
  });

  test('PieceType.knightPromoted', () {
    final pieceType = PieceType.knightPromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.knight);
  });

  test('PieceType.silverPromoted', () {
    final pieceType = PieceType.silverPromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.silver);
  });

  test('PieceType.bishopPromoted', () {
    final pieceType = PieceType.bishopPromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.bishop);
  });

  test('PieceType.rookPromoted', () {
    final pieceType = PieceType.rookPromoted;
    expect(pieceType.canBePromoted, false);
    expect(pieceType.isPromoted, true);
    expect(pieceType.promote(), null);
    expect(pieceType.normalize(), PieceType.rook);
  });
}
