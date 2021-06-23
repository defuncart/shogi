import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import '../models/board_piece.dart';
import '../utils/package_utils.dart';
import 'list_extensions.dart';

extension ListBoardPiecesExtensionsInternal on List<BoardPiece> {
  String toSFEN() {
    final buffer = StringBuffer();

    if (length > 0) {
      final mapPieceCount = map((piece) => piece.pieceType)
          .toList()
          .convertToMapWithCountUniqueElements<PieceType>();
      final player = first.player;

      for (final kvp in mapPieceCount.entries) {
        final pieceText =
            PackageUtils.pieceTypeToString(kvp.key, usesJapanese: false);
        if (kvp.value > 1) {
          buffer.write(kvp.value);
        }
        buffer.write(player.isSente ? pieceText : pieceText.toLowerCase());
        buffer.write(' ');
      }
    }

    buffer.writeln();
    return buffer.toString();
  }
}
