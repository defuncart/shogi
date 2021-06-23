import 'package:shogi/shogi.dart';
import 'package:shogi/src/utils/package_utils.dart';
import 'package:test/test.dart';

void main() {
  test('pieceTypeToString', () {
    expect(
      PackageUtils.pieceTypeToString(PieceType.king, usesJapanese: false),
      'K',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.rook, usesJapanese: false),
      'R',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.bishop, usesJapanese: false),
      'B',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.gold, usesJapanese: false),
      'G',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.silver, usesJapanese: false),
      'S',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.knight, usesJapanese: false),
      'N',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.lance, usesJapanese: false),
      'L',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.pawn, usesJapanese: false),
      'P',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.rookPromoted,
          usesJapanese: false),
      '+R',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.bishopPromoted,
          usesJapanese: false),
      '+B',
    );
    expect(
        PackageUtils.pieceTypeToString(PieceType.silverPromoted,
            usesJapanese: false),
        '+S');
    expect(
        PackageUtils.pieceTypeToString(PieceType.knightPromoted,
            usesJapanese: false),
        '+N');
    expect(
        PackageUtils.pieceTypeToString(PieceType.lancePromoted,
            usesJapanese: false),
        '+L');
    expect(
        PackageUtils.pieceTypeToString(PieceType.pawnPromoted,
            usesJapanese: false),
        '+P');

    expect(
      PackageUtils.pieceTypeToString(PieceType.king, usesJapanese: true),
      '玉',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.rook, usesJapanese: true),
      '飛',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.bishop, usesJapanese: true),
      '角',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.gold, usesJapanese: true),
      '金',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.silver, usesJapanese: true),
      '銀',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.knight, usesJapanese: true),
      '桂',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.lance, usesJapanese: true),
      '香',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.pawn, usesJapanese: true),
      '歩',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.rookPromoted,
          usesJapanese: true),
      '龍',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.bishopPromoted,
          usesJapanese: true),
      '馬',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.silverPromoted,
          usesJapanese: true),
      '全',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.knightPromoted,
          usesJapanese: true),
      '圭',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.lancePromoted,
          usesJapanese: true),
      '杏',
    );
    expect(
      PackageUtils.pieceTypeToString(PieceType.pawnPromoted,
          usesJapanese: true),
      'と',
    );

    expect(
      PackageUtils.pieceTypeToString(PieceType.king,
          usesJapanese: true, isSente: false),
      '王',
    );
  });

  test('pieceStringToType', () {
    expect(
      PackageUtils.pieceStringToType('玉', usesJapanese: true),
      PieceType.king,
    );
    expect(
      PackageUtils.pieceStringToType('飛', usesJapanese: true),
      PieceType.rook,
    );
    expect(
      PackageUtils.pieceStringToType('角', usesJapanese: true),
      PieceType.bishop,
    );
    expect(
      PackageUtils.pieceStringToType('金', usesJapanese: true),
      PieceType.gold,
    );
    expect(
      PackageUtils.pieceStringToType('銀', usesJapanese: true),
      PieceType.silver,
    );
    expect(
      PackageUtils.pieceStringToType('桂', usesJapanese: true),
      PieceType.knight,
    );
    expect(
      PackageUtils.pieceStringToType('香', usesJapanese: true),
      PieceType.lance,
    );
    expect(
      PackageUtils.pieceStringToType('歩', usesJapanese: true),
      PieceType.pawn,
    );
    expect(
      PackageUtils.pieceStringToType('龍', usesJapanese: true),
      PieceType.rookPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('馬', usesJapanese: true),
      PieceType.bishopPromoted,
    );

    expect(
      PackageUtils.pieceStringToType('全', usesJapanese: true),
      PieceType.silverPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('圭', usesJapanese: true),
      PieceType.knightPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('杏', usesJapanese: true),
      PieceType.lancePromoted,
    );
    expect(
      PackageUtils.pieceStringToType('と', usesJapanese: true),
      PieceType.pawnPromoted,
    );

    expect(
      PackageUtils.pieceStringToType('K'),
      PieceType.king,
    );
    expect(
      PackageUtils.pieceStringToType('R'),
      PieceType.rook,
    );
    expect(
      PackageUtils.pieceStringToType('B'),
      PieceType.bishop,
    );
    expect(
      PackageUtils.pieceStringToType('G'),
      PieceType.gold,
    );
    expect(
      PackageUtils.pieceStringToType('S'),
      PieceType.silver,
    );
    expect(
      PackageUtils.pieceStringToType('N'),
      PieceType.knight,
    );
    expect(
      PackageUtils.pieceStringToType('L'),
      PieceType.lance,
    );
    expect(
      PackageUtils.pieceStringToType('P'),
      PieceType.pawn,
    );
    expect(
      PackageUtils.pieceStringToType('+R'),
      PieceType.rookPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('+B'),
      PieceType.bishopPromoted,
    );

    expect(
      PackageUtils.pieceStringToType('+S'),
      PieceType.silverPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('+N'),
      PieceType.knightPromoted,
    );
    expect(
      PackageUtils.pieceStringToType('+L'),
      PieceType.lancePromoted,
    );
    expect(
      PackageUtils.pieceStringToType('+P'),
      PieceType.pawnPromoted,
    );
  });

  //TODO tests for pieceTypeToDisplayString

  test('arabicToJapaneseDigit', () {
    expect(PackageUtils.arabicToJapaneseDigit(1), '１');
    expect(PackageUtils.arabicToJapaneseDigit(2), '２');
    expect(PackageUtils.arabicToJapaneseDigit(3), '３');
    expect(PackageUtils.arabicToJapaneseDigit(4), '４');
    expect(PackageUtils.arabicToJapaneseDigit(5), '５');
    expect(PackageUtils.arabicToJapaneseDigit(6), '６');
    expect(PackageUtils.arabicToJapaneseDigit(7), '７');
    expect(PackageUtils.arabicToJapaneseDigit(8), '８');
    expect(PackageUtils.arabicToJapaneseDigit(9), '９');
    expect(
      () => PackageUtils.arabicToJapaneseDigit(-1),
      throwsA(isA<ArgumentError>()),
    );
    expect(
      () => PackageUtils.arabicToJapaneseDigit(10),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('japaneseDigitToArabic', () {
    expect(PackageUtils.japaneseDigitToArabic('１'), 1);
    expect(PackageUtils.japaneseDigitToArabic('２'), 2);
    expect(PackageUtils.japaneseDigitToArabic('３'), 3);
    expect(PackageUtils.japaneseDigitToArabic('４'), 4);
    expect(PackageUtils.japaneseDigitToArabic('５'), 5);
    expect(PackageUtils.japaneseDigitToArabic('６'), 6);
    expect(PackageUtils.japaneseDigitToArabic('７'), 7);
    expect(PackageUtils.japaneseDigitToArabic('８'), 8);
    expect(PackageUtils.japaneseDigitToArabic('９'), 9);
    expect(
      () => PackageUtils.japaneseDigitToArabic('bla'),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('arabicToJapaneseKanji', () {
    expect(PackageUtils.arabicToJapaneseKanji(1), '一');
    expect(PackageUtils.arabicToJapaneseKanji(2), '二');
    expect(PackageUtils.arabicToJapaneseKanji(3), '三');
    expect(PackageUtils.arabicToJapaneseKanji(4), '四');
    expect(PackageUtils.arabicToJapaneseKanji(5), '五');
    expect(PackageUtils.arabicToJapaneseKanji(6), '六');
    expect(PackageUtils.arabicToJapaneseKanji(7), '七');
    expect(PackageUtils.arabicToJapaneseKanji(8), '八');
    expect(PackageUtils.arabicToJapaneseKanji(9), '九');
    expect(PackageUtils.arabicToJapaneseKanji(10), '十');
    expect(PackageUtils.arabicToJapaneseKanji(11), '十一');
    expect(PackageUtils.arabicToJapaneseKanji(12), '十二');
    expect(PackageUtils.arabicToJapaneseKanji(13), '十三');
    expect(PackageUtils.arabicToJapaneseKanji(14), '十四');
    expect(PackageUtils.arabicToJapaneseKanji(15), '十五');
    expect(PackageUtils.arabicToJapaneseKanji(16), '十六');
    expect(PackageUtils.arabicToJapaneseKanji(17), '十七');
    expect(PackageUtils.arabicToJapaneseKanji(18), '十八');
    expect(
      () => PackageUtils.arabicToJapaneseDigit(-1),
      throwsA(isA<ArgumentError>()),
    );
    expect(
      () => PackageUtils.arabicToJapaneseDigit(19),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('japaneseKaniToArabic', () {
    expect(PackageUtils.japaneseKaniToArabic('一'), 1);
    expect(PackageUtils.japaneseKaniToArabic('二'), 2);
    expect(PackageUtils.japaneseKaniToArabic('三'), 3);
    expect(PackageUtils.japaneseKaniToArabic('四'), 4);
    expect(PackageUtils.japaneseKaniToArabic('五'), 5);
    expect(PackageUtils.japaneseKaniToArabic('六'), 6);
    expect(PackageUtils.japaneseKaniToArabic('七'), 7);
    expect(PackageUtils.japaneseKaniToArabic('八'), 8);
    expect(PackageUtils.japaneseKaniToArabic('九'), 9);
    expect(PackageUtils.japaneseKaniToArabic('十'), 10);
    expect(PackageUtils.japaneseKaniToArabic('十一'), 11);
    expect(PackageUtils.japaneseKaniToArabic('十二'), 12);
    expect(PackageUtils.japaneseKaniToArabic('十三'), 13);
    expect(PackageUtils.japaneseKaniToArabic('十四'), 14);
    expect(PackageUtils.japaneseKaniToArabic('十五'), 15);
    expect(PackageUtils.japaneseKaniToArabic('十六'), 16);
    expect(PackageUtils.japaneseKaniToArabic('十七'), 17);
    expect(PackageUtils.japaneseKaniToArabic('十八'), 18);
    expect(
      () => PackageUtils.japaneseKaniToArabic('bla'),
      throwsA(isA<ArgumentError>()),
    );
  });
}
