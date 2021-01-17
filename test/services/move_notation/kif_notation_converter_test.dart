import 'package:shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  final converter = KIFNotationConverter();

  test('Valid format', () {
    final kifu = '''
手合割：平手
先手：
後手：

手数----指手----消費時間--
   1 ７六歩(77)
   2 ３四歩(33)
   3 ２二角成(88)
   4 同　銀(31)
   5 １五角打
''';
    final moves = converter.movesFromFile(kifu);
    expect(moves, isNotNull);
    expect(moves.length, 5);
    expect(moves, [
      Move(
        player: PlayerType.sente,
        piece: PieceType.pawn,
        from: Position.fromString('77'),
        to: Position.fromString('76'),
        isCapture: false,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.gote,
        piece: PieceType.pawn,
        from: Position.fromString('33'),
        to: Position.fromString('34'),
        isCapture: false,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.sente,
        piece: PieceType.bishop,
        from: Position.fromString('88'),
        to: Position.fromString('22'),
        isCapture: true,
        isDrop: false,
        isPromotion: true,
      ),
      Move(
        player: PlayerType.gote,
        piece: PieceType.silver,
        from: Position.fromString('31'),
        to: Position.fromString('22'),
        isCapture: true,
        isDrop: false,
        isPromotion: false,
      ),
      Move(
        player: PlayerType.sente,
        piece: PieceType.bishop,
        from: null,
        to: Position.fromString('15'),
        isCapture: false,
        isDrop: true,
        isPromotion: false,
      ),
    ]);
  });

  test('Invalid format', () {
    final kifu = '''
初期局面
1: ☗７六歩
    2 歩(33)
    3 ２二成(88)
4: ☖同銀
''';
    final moves = converter.movesFromFile(kifu);
    expect(moves, isEmpty);
  });

  test('determineWinner', () {
    final kifu = '''
手合割：平手
先手
後手　

手数----指手----消費時間--
   1 ７六歩(77)
   2 ３四歩(33)
   3 ２二角成(88)
   4 同　銀(31)
   5 投了
''';
    final winner = converter.determineWinner(kifu);
    expect(winner, PlayerType.gote);
  });

  test('movesAsText', () {
    final kifu = '''
手合割：平手
先手
後手　

手数----指手----消費時間--
   1 ７六歩(77)
   2 ３四歩(33)
   3 ２二角成(88)
   4 同　銀(31)
   5 投了
''';
    final k2 = '''
手合割：平手
先手：Haruto+Takahashi
後手：Marco+Dietmayer　

手数----指手----消費時間--
*6th+International+Shogi+Tournament
*A+class+Quarterfinal+Takahashi-Dietmayer
   1 ７六歩(77)
   2 ３四歩(33)
   3 ７五歩(76)
   4 ６二銀(71)
   5 ７八飛(28)
   6 ６四歩(63)
   7 ６六歩(67)
   8 ４二玉(51)
   9 ５八金(69)
  10 ６三銀(62)
  11 ４八玉(59)
  12 ３二玉(42)
  13 ３八銀(39)
  14 １四歩(13)
  15 １六歩(17)
  16 ５二金(61)
  17 ３九玉(48)
  18 ３三角(22)
  19 ９六歩(97)
  20 ９四歩(93)
  21 ６八銀(79)
  22 ８四歩(83)
  23 ６七銀(68)
  24 ８五歩(84)
  25 ７六飛(78)
  26 ６五歩(64)
  27 ７七桂(89)
  28 ６六歩(65)
  29 同　銀(67)
  30 ６四歩打
  31 ９七角(88)
  32 ５一角(33)
  33 ２八玉(39)
  34 ２二玉(32)
  35 ６五歩打
  36 同　歩(64)
  37 同　銀(66)
  38 ６四歩打
  39 ５六銀(65)
  40 ４四歩(43)
  41 ５五銀(56)
  42 ５四歩(53)
  43 ４四銀(55)
  44 ６二角(51)
  45 ４六飛(76)
  46 ９五歩(94)
  47 ３三銀成(44)
  48 同　桂(21)
  49 ４一飛成(46)
  50 ５一金(52)
  51 ４三龍(41)
  52 ５二金(51)
  53 ３四龍(43)
  54 ９六歩(95)
  55 ８八角(97)
  56 ９七歩成(96)
  57 同　香(99)
  58 同　香成(91)
  59 同　角(88)
  60 ４五銀打
  61 同　龍(34)
  62 同　桂(33)
  63 ７四歩(75)
  64 ４四角(62)
  65 ７三歩成(74)
  66 同　桂(81)
  67 ７四歩打
  68 同　銀(63)
  69 ６四角(97)
  70 ６三金(52)
  71 ４三金打
  72 ７七角成(44)
  73 ３三銀打
  74 同　馬(77)
  75 同　金(43)
  76 同　玉(22)
  77 ３一角成(64)
  78 ９一飛打
  79 ３六香打
  80 ３五歩打
  81 同　香(36)
  82 ３四歩打
  83 ４二銀打
  84 ４三玉(33)
  85 ６四歩打
  86 ３一飛(91)
  87 同　銀(42)
  88 ６四金(63)
  89 ７一角打
  90 ５三角打
  91 ８二角成(71)
  92 ３一角(53)
  93 ７三馬(82)
  94 ６三金(64)
  95 ４一飛打
  96 ４二銀打
  97 ４六馬(73)
  98 ５一金打
  99 ３一飛成(41)
 100 同　銀(42)
 101 ４五馬(46)
 102 ５三玉(43)
 103 ３三飛打
 104 ６四玉(53)
 105 ８四角打
 106 ４一金(51)
 107 ７六桂打
 108 ６五玉(64)
 109 ６三飛成(33)
 110 同　銀(74)
 111 ７五金打
''';
    final movesAsText = converter.movesAsText(k2);
    expect(movesAsText, isNotNull);
    expect(movesAsText.length, 111);
  });
}
