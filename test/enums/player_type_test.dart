import 'package:flutter_test/flutter_test.dart';
import 'package:shogi/shogi.dart';

main() {
  test('PlayerType', () {
    var playerType = PlayerType.sente;
    expect(playerType.isSente, true);
    expect(playerType.isGote, false);
    expect(playerType.flip(), PlayerType.gote);

    playerType = PlayerType.gote;
    expect(playerType.isSente, false);
    expect(playerType.isGote, true);
    expect(playerType.flip(), PlayerType.sente);
  });
}
