# shogi

A simple shogi engine for Dart and Flutter. This engine can be combined with [flutter_shogi_board](https://github.com/defuncart/flutter_shogi_board) to render static game board positions, tsume problems or shogi castles.

Shogi (将棋) is a two-player strategy board game native to Japan, belonging to the same family as chess and xiangqi.

Presently the package is very basic in which it can determine the static board position for a given game and move pieces from one position to another. As it is still highly experimental, 0.0.x versioning is used.

## Getting Started

### Import the package

To import this package, simply add `shogi` as a dependency in `pubspec.yaml`

```yaml
dependencies:
  shogi:
```

### Example

```dart
import 'package:shogi/shogi.dart';

void main() {
  final gameBoard = ShogiUtils.initialBoard;
  gameBoard.printToConsole(useJapanese: false);
}
```

```
|l |n |s |g |k |g |s |n |l |
|  |r |  |  |  |  |  |b |  |
|p |p |p |p |p |p |p |p |p |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |
|P |P |P |P |P |P |P |P |P |
|  |B |  |  |  |  |  |R |  |
|L |N |S |G |K |G |S |N |L |
```

## Importing a Game Board

### SFEN

A game board can be imported using a SFEN ascii string:

```dart
final sfenString = 'lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b -';
final gameBoard = ShogiUtils.sfenStringToGameBoard(sfenString);
```

### BOD

Alternatively, a game board can be imported using a BOD string:

```dart
final bodString = '''
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
final gameBoard = ShogiUtils.bodStringToGameBoard(bodString);
```

## Piece Movement

### KIF

Piece movement can be specified using KIF notation:

```dart
var gameBoard = ShogiUtils.initialBoard;
final kif = '''
1 ７六歩(77)
2 ３四歩(33)
3 ２二角成(88)
4 同　銀(31)
5 投了
''';
final moves = KIFNotationConverter().movesFromFile(kif);
gameBoard = GameEngine.makeMove(gameBoard, moves.first);
gameBoard.printToConsole();
```


### Custom

Alternatively, piece movement can be specified using the custom notation `{Player}{PieceType}{CurrentPosition}{Movement}{TargetPosition}{Promotion}`. 

`{Promotion}` is optional, while if `{Player}` isn't specified, Sente is chosen by default. `{CurrentPosition}` is needed for all movement types, except drops. Movement is denoted by `-`, `x` and `*`, that is, simple movement, capture and drop respectfully. Some examples:
 
| Type            | Example  | Explanation                                                                   |
|-----------------|----------|-------------------------------------------------------------------------------|
| Simple movement | ☗P77-76  | Sente's pawn moves from 77 to 76.                                             |
| Capture         | ☗P75x74  | Sente's pawn moves from 75 to 74 and captures the piece at 74.                |
| Drop            | ☗S*34    | Sente's drops a silver from in hand onto 34.                                  |
| Combined        | ☗S34x33+ | Sente's silver moves from 34 to 33, captures the piece at 33 and is promoted. |

Thus, given an initial board for Sente, a *Yagura castle* could be build using the following moves:

```
1: ☗P77-76
2: ☗S79-68
3: ☗S68-77
4: ☗G69-78
5: ☗P57-56
6: ☗K59-69
7: ☗G49-58
8: ☗B88-79
9: ☗P67-66
10: ☗G58-67
11: ☗B79-68
12: ☗K69-79
13: ☗K79-88
```

## Future Plans

* Investigate Bitboards
* Determine if a move is valid
* Simple Computer AI

## Raising Issues and Contributing

Please report bugs and issues, and raise feature requests on [GitHub](https://github.com/defuncart/shogi/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
