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
  static String pieceTypeToString(
    PieceType pieceType, {
    bool usesJapanese = true,
    bool isSente = true,
  }) {
    if (usesJapanese && !isSente && pieceType == PieceType.king) {
      return _kingGoteJP;
    } else {
      return usesJapanese ? _piecesJP[pieceType]! : _piecesEN[pieceType]!;
    }
  }

  /// Converts a piece type to a display string
  ///
  /// The difference from `pieceTypeToString` is that gote display strings for latin are in lowercase
  static String pieceTypeToDisplayString(
    PieceType pieceType, {
    bool usesJapanese = true,
    bool isSente = true,
  }) {
    if (usesJapanese) {
      return !isSente && pieceType == PieceType.king
          ? _kingGoteJP
          : _piecesJP[pieceType]!;
    } else {
      return isSente
          ? _piecesEN[pieceType]!
          : _piecesEN[pieceType]!.toLowerCase();
    }
  }

  /// Converts a string to piece type
  ///
  /// `usesJapanese` is optional and default to `false`
  /// Returns null if the piece doesn't exist
  static PieceType pieceStringToType(
    String pieceString, {
    bool usesJapanese = false,
  }) {
    final map = usesJapanese ? _piecesJP : _piecesEN;
    if (!map.containsValue(pieceString)) {
      throw ArgumentError(
          '$pieceString is not valid when usesJapanese = $usesJapanese');
    }

    return map.entries
        .firstWhere(
          (kvp) => kvp.value == pieceString,
        )
        .key;
  }

  static const _mapArabicJapaneseDigits = {
    1: '１',
    2: '２',
    3: '３',
    4: '４',
    5: '５',
    6: '６',
    7: '７',
    8: '８',
    9: '９',
  };

  static final _mapArabicJapaneseDigitsInverse =
      _mapArabicJapaneseDigits.map((k, v) => MapEntry(v, k));

  static const _mapArabicJapaneseKanji = {
    1: '一',
    2: '二',
    3: '三',
    4: '四',
    5: '五',
    6: '六',
    7: '七',
    8: '八',
    9: '九',
    10: '十',
    11: '十一',
    12: '十二',
    13: '十三',
    14: '十四',
    15: '十五',
    16: '十六',
    17: '十七',
    18: '十八',
  };

  static final _mapArabicJapaneseKanjiInverse =
      _mapArabicJapaneseKanji.map((k, v) => MapEntry(v, k));

  /// Returns a japanese digit for a given arabic number (i.e. 1 -> １)
  static String arabicToJapaneseDigit(int number) {
    if (number < 1 || number > 9) {
      throw ArgumentError('$number isn\'t a valid argument');
    }

    return _mapArabicJapaneseDigits[number]!;
  }

  /// Returns an arabic number for a given japanese digit (i.e. １ -> 1)
  static int japaneseDigitToArabic(String digit) {
    if (!_mapArabicJapaneseDigits.containsValue(digit)) {
      throw ArgumentError('$digit isn\'t a valid argument');
    }

    return _mapArabicJapaneseDigitsInverse[digit]!;
  }

  /// Returns an japanese kanji for a given arabic number (i.e. １ -> 一)
  static String arabicToJapaneseKanji(int number) {
    if (number < 1 || number > 18) {
      throw ArgumentError('$number isn\'t a valid argument');
    }

    return _mapArabicJapaneseKanji[number]!;
  }

  /// Returns an arabic number for a given japanese kanji (i.e. 一 -> 1)
  static int japaneseKaniToArabic(String digit) {
    if (!_mapArabicJapaneseKanji.containsValue(digit)) {
      throw ArgumentError('$digit isn\'t a valid argument');
    }

    return _mapArabicJapaneseKanjiInverse[digit]!;
  }
}
