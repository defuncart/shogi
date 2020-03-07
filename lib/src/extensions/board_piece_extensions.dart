import '../models/board_piece.dart';
import '../utils/package_utils.dart';

/// A class of internal extension methods for BoardPiece
extension BoardPieceExtensionsInternal on BoardPiece {
  String toSFEN() {
    if (this != null) {
      final pieceText = PackageUtils.pieceTypeToString(this.pieceType, usesJapanese: false);
      return this.isSente ? pieceText : pieceText.toLowerCase();
    }

    return null;
  }
}