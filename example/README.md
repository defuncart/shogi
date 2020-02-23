# Example

## Import the package

To import this package, simply add `shogi` as a dependency in `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  shogi:
```

Note that this package requires dart >= 2.3.0.

## Example

```dart
import 'package:shogi/shogi.dart';

void main() {
  final gameBoard = ShogiUtils.initialBoard;
  print(gameBoard.boardPieces);
  print(gameBoard.sentePiecesInHand);
  print(gameBoard.gotePiecesInHand);
}
```