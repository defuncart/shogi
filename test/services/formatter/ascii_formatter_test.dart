import 'package:shogi/shogi.dart';
import 'package:shogi/src/services/formatter/ascii_formatter.dart';
import 'package:shogi/src/utils/shogi_utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('AsciiFormatter', () {
    group('gameboardToAscii', () {
      test('when initial board, expect correct format', () {
        expect(
          AsciiFormatter.gameBoardToAscii(ShogiUtils.initialBoard),
          '''

|l |n |s |g |k |g |s |n |l |
|  |r |  |  |  |  |  |b |  |
|p |p |p |p |p |p |p |p |p |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|P |P |P |P |P |P |P |P |P |
|  |B |  |  |  |  |  |R |  |
|L |N |S |G |K |G |S |N |L |

''',
        );
      });

      test('when empty board, expect correct format', () {
        expect(
          AsciiFormatter.gameBoardToAscii(GameBoard.empty()),
          '''

|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |

''',
        );
      });
    });
  });
}
