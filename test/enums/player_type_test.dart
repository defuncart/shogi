import 'package:flutter_test/flutter_test.dart';
import 'package:shogi/shogi.dart';

main() {
  test('PlayerType.sente', () {
    final playerType = PlayerType.sente;
    expect(playerType.isSente, true);
    expect(playerType.isGote, false);
    expect(playerType.flip(), PlayerType.gote);
  });

  test('PlayerType.gote', () {
    final playerType = PlayerType.gote;
    expect(playerType.isSente, false);
    expect(playerType.isGote, true);
    expect(playerType.flip(), PlayerType.sente);
  });
}
