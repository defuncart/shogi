import '../models/board_piece.dart';
import '../utils/package_utils.dart';

/// A class of internal extension methods for BoardPiece
extension BoardPieceExtensionsInternal on BoardPiece {
  String toSFEN() {
    final pieceText =
        PackageUtils.pieceTypeToString(pieceType, usesJapanese: false);
    return isSente ? pieceText : pieceText.toLowerCase();
  }
}
