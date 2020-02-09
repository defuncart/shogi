import 'package:meta/meta.dart';

import '../configs/board_config.dart';

/// A class representing a position on a shogi game board
class Position {
  /// The column index
  ///
  /// This is assumed to be 1 <= column <= BoardConfig.numberColumns
  final int column;

  /// The row index
  ///
  /// This is assumed to be 1 <= row <= BoardConfig.numberRows
  final int row;

  const Position({
    @required this.column,
    @required this.row,
  })  : assert(column >= 1 && column <= BoardConfig.numberColumns),
        assert(row >= 1 && row <= BoardConfig.numberRows);

  @override
  bool operator ==(dynamic otherPosition) =>
      otherPosition is Position && row == otherPosition.row && column == otherPosition.column;

  @override
  int get hashCode => row.hashCode ^ column.hashCode;

  @override
  String toString() => '$column$row';
}
