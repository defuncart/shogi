# Example

## Import the package

To import this package, simply add `shogi` as a dependency in `pubspec.yaml`

```yaml
dependencies:
  shogi:
```

## Example

```dart
import 'package:shogi/shogi.dart';

void main() {
  final gameBoard = ShogiUtils.initialBoard;
  gameBoard.printToConsole();
}
```