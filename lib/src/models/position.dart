import 'package:meta/meta.dart';

import '../configs/board_config.dart';

/// A class representing a position on a shogi game board
@immutable
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
    required this.column,
    required this.row,
  })  : assert(column >= 1 && column <= BoardConfig.numberColumns),
        assert(row >= 1 && row <= BoardConfig.numberRows);

  /// Constructs a `Position` from a string `11`
  factory Position.fromString(String position) {
    if (position.length != 2) {
      throw ArgumentError('$position is invalid position');
    }
    final column = int.tryParse(position[0]);
    if (column == null || column < 1 || column > BoardConfig.numberColumns) {
      throw ArgumentError('$column is invalid in $position');
    }
    final row = int.tryParse(position[1]);
    if (row == null || row < 1 && row > BoardConfig.numberRows) {
      throw ArgumentError('$column is invalid in $position');
    }

    return Position(
      column: column,
      row: row,
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other is Position && row == other.row && column == other.column;

  @override
  int get hashCode => row.hashCode ^ column.hashCode;

  @override
  String toString() => '$column$row';
}
