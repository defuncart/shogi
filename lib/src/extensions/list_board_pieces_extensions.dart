import 'package:meta/meta.dart';

import '../configs/board_config.dart';
import '../enums/piece_type.dart';
import '../enums/player_type.dart';
import 'list_extensions.dart';
import '../models/board_piece.dart';
import '../utils/package_utils.dart';

extension ListBoardPiecesExtensionsInternal on List<BoardPiece> {
  String toSFEN() {
    if (this != null) {
      final buffer = StringBuffer();

      if (this.length > 0) {
        final mapPieceCount =
            this.map((piece) => piece.pieceType).toList().convertToMapWithCountUniqueElements<PieceType>();
        final player = this.first.player;

        for (final kvp in mapPieceCount.entries) {
          final pieceText = PackageUtils.pieceTypeToString(kvp.key, usesJapanese: false);
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

    return null;
  }
}
