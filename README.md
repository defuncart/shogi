# shogi

A simple shogi engine for Dart and Flutter. This engine can be combined with [flutter_shogi_board](https://github.com/defuncart/flutter_shogi_board) to render static game board positions, tsume problems or shogi castles.

Presently the package is very basic in which it can determine the static board position for a given game. In future versions, dynamic games will be considered

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
import 'package:flutter/material.dart';
import 'package:shogi/shogi.dart';

void main() {
  final boardPieces = ShogiUtils.initialBoard;
  boardPieces.forEach((p) => print(p));
}
```

## Importing a Game Board

As the game board is presently static, a board position can be notated by `{PieceType}-{Row}{Column}`, i.e. `K-59`. Note that 11 is the top left board cell as per japanese notation.

```dart
final yagura = ['L-99', 'N-89', 'K-88', 'G-78', 'P-97', 'P-87', 'S-77', 'G-67', 'P-76', 'P-66', 'P-56'];

final boardPieces = ShogiUtils.stringArrayToBoardPiecesArray(yagura);
```

If sente or gote aren't specified, then sente is chosen by default. To import pieces for both players, use the notation `{Player}:{PieceType}-{Row}{Column}`.

```dart
final tsume1 = ['G:K-51', 'G:S-61', 'G:S-41', 'S:+P-53', 'S:+B-25'];
```

## Future Plans

The packages `shogi` and `flutter_shogi_board` grew out of my desired to visualize shogi castles in Flutter, and with no game board widget or even a shogi engine available, I decided to roll my own.

Presently the package contains the business logic components from `flutter_shogi_board`. For the future I would like to utilize these packages not just for displaying static game boards, but also for tsume problems, thus user interaction may be considered.

As the game board is static, the notation `G:K-51` is currently utilized to import game boards, however `KIF` may be more suitable for future versions:

```
1 ７六歩(77)
2 ３四歩(33)
3 ７五歩(76)
```

## Raising Issues and Contributing

Please report bugs and issues, and raise feature requests on [GitHub](https://github.com/defuncart/flutter_shogi_board/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
