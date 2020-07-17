import '../enums/piece_type.dart';

/// A class of util methods used in the package
class PackageUtils {
  /// Maps piece type to Japanese characters
  static const Map<PieceType, String> _piecesJP = {
    PieceType.king: '玉',
    PieceType.rook: '飛',
    PieceType.bishop: '角',
    PieceType.gold: '金',
    PieceType.silver: '銀',
    PieceType.knight: '桂',
    PieceType.lance: '香',
    PieceType.pawn: '歩',
    PieceType.rookPromoted: '龍',
    PieceType.bishopPromoted: '馬',
    PieceType.silverPromoted: '全',
    PieceType.knightPromoted: '圭',
    PieceType.lancePromoted: '杏',
    PieceType.pawnPromoted: 'と',
  };

  /// The japanese character for gote's king
  static const _kingGoteJP = '王';

  /// Maps piece type to English letters
  static const Map<PieceType, String> _piecesEN = {
    PieceType.king: 'K',
    PieceType.rook: 'R',
    PieceType.bishop: 'B',
    PieceType.gold: 'G',
    PieceType.silver: 'S',
    PieceType.knight: 'N',
    PieceType.lance: 'L',
    PieceType.pawn: 'P',
    PieceType.rookPromoted: '+R',
    PieceType.bishopPromoted: '+B',
    PieceType.silverPromoted: '+S',
    PieceType.knightPromoted: '+N',
    PieceType.lancePromoted: '+L',
    PieceType.pawnPromoted: '+P',
  };

  /// Converts a piece type to string
  ///
  /// `usesJapanese` and `isSente` are both optional and default to `true`
  static String pieceTypeToString(PieceType pieceType, {bool usesJapanese = true, bool isSente = true}) {
    if (usesJapanese && !isSente && pieceType == PieceType.king) {
      return _kingGoteJP;
    } else {
      return usesJapanese ? _piecesJP[pieceType] : _piecesEN[pieceType];
    }
  }

  /// Converts a piece type to a display string
  ///
  /// The difference from `pieceTypeToString` is that gote display strings for latin are in lowercase
  static String pieceTypeToDisplayString(PieceType pieceType, {bool usesJapanese = true, bool isSente = true}) {
    if (usesJapanese) {
      return !isSente && pieceType == PieceType.king ? _kingGoteJP : _piecesJP[pieceType];
    } else {
      return isSente ? _piecesEN[pieceType] : _piecesEN[pieceType].toLowerCase();
    }
  }

  /// Converts a string to piece type
  ///
  /// `usesJapanese` is optional and default to `false`
  static PieceType pieceStringToType(String pieceString, {bool usesJapanese = false}) =>
      (usesJapanese ? _piecesJP : _piecesEN).entries.where((p) => p.value == pieceString).first.key;
}
