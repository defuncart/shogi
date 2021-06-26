import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  test('Ensure piecesInHandOrder cannot be modified', () {
    expect(
      () => ShogiUtils.piecesInHandOrder[0] = PieceType.pawn,
      throwsA(isA<UnsupportedError>()),
    );
    expect(
      () => ShogiUtils.piecesInHandOrder.add(PieceType.pawn),
      throwsA(isA<UnsupportedError>()),
    );
    expect(
      () => ShogiUtils.piecesInHandOrder.removeLast(),
      throwsA(isA<UnsupportedError>()),
    );
  });
}
