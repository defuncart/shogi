# shogi

A simple shogi engine for Dart and Flutter. This engine can be combined with [flutter_shogi_board](https://github.com/defuncart/flutter_shogi_board) to render static game board positions, tsume problems or shogi castles.

Presently the package is very basic in which it can determine the static board position for a given game and move pieces from one position to another. As it is still highly experimental, 0.0.x versioning is used.

## Getting Started

### Import the package

To import this package, simply add `shogi` as a dependency in `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  shogi:
```

Note that this package requires dart >= 2.3.0.

### Example

```dart
import 'package:shogi/shogi.dart';

void main() {
  final gameBoard = ShogiUtils.initialBoard;
  print(gameBoard.boardPieces);
  print(gameBoard.sentePiecesInHand);
  print(gameBoard.gotePiecesInHand);
}
```

## Importing a Game Board

A board position is notated using `{PieceType}-{Row}{Column}`, i.e. `K-59`. Note that 11 is the top right board cell as per japanese notation.

```dart
final yagura = ['L-99', 'N-89', 'K-88', 'G-78', 'P-97', 'P-87', 'S-77', 'G-67', 'P-76', 'P-66', 'P-56'];

final boardPieces = ShogiUtils.stringArrayToBoardPiecesArray(yagura);
```

If Sente or Gote aren't specified, then Sente is chosen by default. To import pieces for both players, use the notation `{Player}:{PieceType}-{Row}{Column}`, where `☗` and `☖` denote Sente and Gote respectively.

```dart
final tsume1 = ['☖:K-51', '☖:S-61', '☖:S-41', '☗:+P-53', '☗:+B-25'];
```

If a position isn't given, then the piece is inferred as being in hand for that player: `{PieceType}` for sente or `{Player}:{PieceType}` to choose specific player.

## Piece Movement

Piece movement is denoted by `{Player}{PieceType}{CurrentPosition}{Movement}{TargetPosition}{Promotion}`. 

`{Promotion}` is optional, while if `{Player}` isn't specified, Sente is chosen by default. `{CurrentPosition}` is needed for all movement types, except drops. Movement is denoted by `-`, `x` and `*`, that is, simple movement, capture and drop respectfully. Some examples:
 
| Type            | Example  | Explanation                                                                   |
|-----------------|----------|-------------------------------------------------------------------------------|
| Simple movement | ☗P77-76  | Sente's pawn moves from 77 to 76.                                             |
| Capture         | ☗P75x74  | Sente's pawn moves from 77 to 74 and captures the piece at 74.                |
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

Note that presently only piece movement is considered, drops and captures are not yet implemented.

## Future Plans

The packages `shogi` and `flutter_shogi_board` grew out of my desired to visualize shogi castles in Flutter, and with no game board widget or even a shogi engine available, I decided to roll my own.

In the future I would like to utilize these packages not just for displaying static game boards, but also for tsume problems, thus user interaction may be considered.

The notation `☗P77-76` is currently utilized to denote moves, however `KIF` may be more suitable for future versions:

```
1 ７六歩(77)
2 ３四歩(33)
3 ７五歩(76)
```

## Raising Issues and Contributing

Please report bugs and issues, and raise feature requests on [GitHub](https://github.com/defuncart/flutter_shogi_board/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
