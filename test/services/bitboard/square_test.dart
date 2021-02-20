import 'package:shogi/src/enums/player_type.dart';
import 'package:shogi/src/services/bitboard/square.dart';
import 'package:test/test.dart';

void main() {
  group('${File.one}', () {
    test('${Square.oneA}', () {
      expect(Square.oneA.file, File.one);
      expect(Square.oneA.rank, Rank.a);
    });

    test('${Square.oneB}', () {
      expect(Square.oneB.file, File.one);
      expect(Square.oneB.rank, Rank.b);
    });

    test('${Square.oneC}', () {
      expect(Square.oneC.file, File.one);
      expect(Square.oneC.rank, Rank.c);
    });

    test('${Square.oneD}', () {
      expect(Square.oneD.file, File.one);
      expect(Square.oneD.rank, Rank.d);
    });

    test('${Square.oneE}', () {
      expect(Square.oneE.file, File.one);
      expect(Square.oneE.rank, Rank.e);
    });

    test('${Square.oneF}', () {
      expect(Square.oneF.file, File.one);
      expect(Square.oneF.rank, Rank.f);
    });

    test('${Square.oneG}', () {
      expect(Square.oneG.file, File.one);
      expect(Square.oneG.rank, Rank.g);
    });

    test('${Square.oneH}', () {
      expect(Square.oneH.file, File.one);
      expect(Square.oneH.rank, Rank.h);
    });

    test('${Square.oneI}', () {
      expect(Square.oneI.file, File.one);
      expect(Square.oneI.rank, Rank.i);
    });
  });

  group('${File.two}', () {
    test('${Square.twoA}', () {
      expect(Square.twoA.file, File.two);
      expect(Square.twoA.rank, Rank.a);
    });

    test('${Square.twoB}', () {
      expect(Square.twoB.file, File.two);
      expect(Square.twoB.rank, Rank.b);
    });

    test('${Square.twoC}', () {
      expect(Square.twoC.file, File.two);
      expect(Square.twoC.rank, Rank.c);
    });

    test('${Square.twoD}', () {
      expect(Square.twoD.file, File.two);
      expect(Square.twoD.rank, Rank.d);
    });

    test('${Square.twoE}', () {
      expect(Square.twoE.file, File.two);
      expect(Square.twoE.rank, Rank.e);
    });

    test('${Square.twoF}', () {
      expect(Square.twoF.file, File.two);
      expect(Square.twoF.rank, Rank.f);
    });

    test('${Square.twoG}', () {
      expect(Square.twoG.file, File.two);
      expect(Square.twoG.rank, Rank.g);
    });

    test('${Square.twoH}', () {
      expect(Square.twoH.file, File.two);
      expect(Square.twoH.rank, Rank.h);
    });

    test('${Square.twoI}', () {
      expect(Square.twoI.file, File.two);
      expect(Square.twoI.rank, Rank.i);
    });
  });

  group('${File.three}', () {
    test('${Square.threeA}', () {
      expect(Square.threeA.file, File.three);
      expect(Square.threeA.rank, Rank.a);
    });

    test('${Square.threeB}', () {
      expect(Square.threeB.file, File.three);
      expect(Square.threeB.rank, Rank.b);
    });

    test('${Square.threeC}', () {
      expect(Square.threeC.file, File.three);
      expect(Square.threeC.rank, Rank.c);
    });

    test('${Square.threeD}', () {
      expect(Square.threeD.file, File.three);
      expect(Square.threeD.rank, Rank.d);
    });

    test('${Square.threeE}', () {
      expect(Square.threeE.file, File.three);
      expect(Square.threeE.rank, Rank.e);
    });

    test('${Square.threeF}', () {
      expect(Square.threeF.file, File.three);
      expect(Square.threeF.rank, Rank.f);
    });

    test('${Square.threeG}', () {
      expect(Square.threeG.file, File.three);
      expect(Square.threeG.rank, Rank.g);
    });

    test('${Square.threeH}', () {
      expect(Square.threeH.file, File.three);
      expect(Square.threeH.rank, Rank.h);
    });

    test('${Square.threeI}', () {
      expect(Square.threeI.file, File.three);
      expect(Square.threeI.rank, Rank.i);
    });
  });

  group('${File.four}', () {
    test('${Square.fourA}', () {
      expect(Square.fourA.file, File.four);
      expect(Square.fourA.rank, Rank.a);
    });

    test('${Square.fourB}', () {
      expect(Square.fourB.file, File.four);
      expect(Square.fourB.rank, Rank.b);
    });

    test('${Square.fourC}', () {
      expect(Square.fourC.file, File.four);
      expect(Square.fourC.rank, Rank.c);
    });

    test('${Square.fourD}', () {
      expect(Square.fourD.file, File.four);
      expect(Square.fourD.rank, Rank.d);
    });

    test('${Square.fourE}', () {
      expect(Square.fourE.file, File.four);
      expect(Square.fourE.rank, Rank.e);
    });

    test('${Square.fourF}', () {
      expect(Square.fourF.file, File.four);
      expect(Square.fourF.rank, Rank.f);
    });

    test('${Square.fourG}', () {
      expect(Square.fourG.file, File.four);
      expect(Square.fourG.rank, Rank.g);
    });

    test('${Square.fourH}', () {
      expect(Square.fourH.file, File.four);
      expect(Square.fourH.rank, Rank.h);
    });

    test('${Square.fourI}', () {
      expect(Square.fourI.file, File.four);
      expect(Square.fourI.rank, Rank.i);
    });
  });

  group('${File.five}', () {
    test('${Square.fiveA}', () {
      expect(Square.fiveA.file, File.five);
      expect(Square.fiveA.rank, Rank.a);
    });

    test('${Square.fiveB}', () {
      expect(Square.fiveB.file, File.five);
      expect(Square.fiveB.rank, Rank.b);
    });

    test('${Square.fiveC}', () {
      expect(Square.fiveC.file, File.five);
      expect(Square.fiveC.rank, Rank.c);
    });

    test('${Square.fiveD}', () {
      expect(Square.fiveD.file, File.five);
      expect(Square.fiveD.rank, Rank.d);
    });

    test('${Square.fiveE}', () {
      expect(Square.fiveE.file, File.five);
      expect(Square.fiveE.rank, Rank.e);
    });

    test('${Square.fiveF}', () {
      expect(Square.fiveF.file, File.five);
      expect(Square.fiveF.rank, Rank.f);
    });

    test('${Square.fiveG}', () {
      expect(Square.fiveG.file, File.five);
      expect(Square.fiveG.rank, Rank.g);
    });

    test('${Square.fiveH}', () {
      expect(Square.fiveH.file, File.five);
      expect(Square.fiveH.rank, Rank.h);
    });

    test('${Square.fiveI}', () {
      expect(Square.fiveI.file, File.five);
      expect(Square.fiveI.rank, Rank.i);
    });
  });

  group('${File.six}', () {
    test('${Square.sixA}', () {
      expect(Square.sixA.file, File.six);
      expect(Square.sixA.rank, Rank.a);
    });

    test('${Square.sixB}', () {
      expect(Square.sixB.file, File.six);
      expect(Square.sixB.rank, Rank.b);
    });

    test('${Square.sixC}', () {
      expect(Square.sixC.file, File.six);
      expect(Square.sixC.rank, Rank.c);
    });

    test('${Square.sixD}', () {
      expect(Square.sixD.file, File.six);
      expect(Square.sixD.rank, Rank.d);
    });

    test('${Square.sixE}', () {
      expect(Square.sixE.file, File.six);
      expect(Square.sixE.rank, Rank.e);
    });

    test('${Square.sixF}', () {
      expect(Square.sixF.file, File.six);
      expect(Square.sixF.rank, Rank.f);
    });

    test('${Square.sixG}', () {
      expect(Square.sixG.file, File.six);
      expect(Square.sixG.rank, Rank.g);
    });

    test('${Square.sixH}', () {
      expect(Square.sixH.file, File.six);
      expect(Square.sixH.rank, Rank.h);
    });

    test('${Square.sixI}', () {
      expect(Square.sixI.file, File.six);
      expect(Square.sixI.rank, Rank.i);
    });
  });

  group('${File.seven}', () {
    test('${Square.sevenA}', () {
      expect(Square.sevenA.file, File.seven);
      expect(Square.sevenA.rank, Rank.a);
    });

    test('${Square.sevenB}', () {
      expect(Square.sevenB.file, File.seven);
      expect(Square.sevenB.rank, Rank.b);
    });

    test('${Square.sevenC}', () {
      expect(Square.sevenC.file, File.seven);
      expect(Square.sevenC.rank, Rank.c);
    });

    test('${Square.sevenD}', () {
      expect(Square.sevenD.file, File.seven);
      expect(Square.sevenD.rank, Rank.d);
    });

    test('${Square.sevenE}', () {
      expect(Square.sevenE.file, File.seven);
      expect(Square.sevenE.rank, Rank.e);
    });

    test('${Square.sevenF}', () {
      expect(Square.sevenF.file, File.seven);
      expect(Square.sevenF.rank, Rank.f);
    });

    test('${Square.sevenG}', () {
      expect(Square.sevenG.file, File.seven);
      expect(Square.sevenG.rank, Rank.g);
    });

    test('${Square.sevenH}', () {
      expect(Square.sevenH.file, File.seven);
      expect(Square.sevenH.rank, Rank.h);
    });

    test('${Square.sevenI}', () {
      expect(Square.sevenI.file, File.seven);
      expect(Square.sevenI.rank, Rank.i);
    });
  });

  group('${File.eight}', () {
    test('${Square.eightA}', () {
      expect(Square.eightA.file, File.eight);
      expect(Square.eightA.rank, Rank.a);
    });

    test('${Square.eightB}', () {
      expect(Square.eightB.file, File.eight);
      expect(Square.eightB.rank, Rank.b);
    });

    test('${Square.eightC}', () {
      expect(Square.eightC.file, File.eight);
      expect(Square.eightC.rank, Rank.c);
    });

    test('${Square.eightD}', () {
      expect(Square.eightD.file, File.eight);
      expect(Square.eightD.rank, Rank.d);
    });

    test('${Square.eightE}', () {
      expect(Square.eightE.file, File.eight);
      expect(Square.eightE.rank, Rank.e);
    });

    test('${Square.eightF}', () {
      expect(Square.eightF.file, File.eight);
      expect(Square.eightF.rank, Rank.f);
    });

    test('${Square.eightG}', () {
      expect(Square.eightG.file, File.eight);
      expect(Square.eightG.rank, Rank.g);
    });

    test('${Square.eightH}', () {
      expect(Square.eightH.file, File.eight);
      expect(Square.eightH.rank, Rank.h);
    });

    test('${Square.eightI}', () {
      expect(Square.eightI.file, File.eight);
      expect(Square.eightI.rank, Rank.i);
    });
  });

  group('${File.nine}', () {
    test('${Square.nineA}', () {
      expect(Square.nineA.file, File.nine);
      expect(Square.nineA.rank, Rank.a);
    });

    test('${Square.nineB}', () {
      expect(Square.nineB.file, File.nine);
      expect(Square.nineB.rank, Rank.b);
    });

    test('${Square.nineC}', () {
      expect(Square.nineC.file, File.nine);
      expect(Square.nineC.rank, Rank.c);
    });

    test('${Square.nineD}', () {
      expect(Square.nineD.file, File.nine);
      expect(Square.nineD.rank, Rank.d);
    });

    test('${Square.nineE}', () {
      expect(Square.nineE.file, File.nine);
      expect(Square.nineE.rank, Rank.e);
    });

    test('${Square.nineF}', () {
      expect(Square.nineF.file, File.nine);
      expect(Square.nineF.rank, Rank.f);
    });

    test('${Square.nineG}', () {
      expect(Square.nineG.file, File.nine);
      expect(Square.nineG.rank, Rank.g);
    });

    test('${Square.nineH}', () {
      expect(Square.nineH.file, File.nine);
      expect(Square.nineH.rank, Rank.h);
    });

    test('${Square.nineI}', () {
      expect(Square.nineI.file, File.nine);
      expect(Square.nineI.rank, Rank.i);
    });
  });

  test('squaresWithFile(${File.one})', () {
    expect(squaresWithFile(File.one), [
      Square.oneA,
      Square.oneB,
      Square.oneC,
      Square.oneD,
      Square.oneE,
      Square.oneF,
      Square.oneG,
      Square.oneH,
      Square.oneI,
    ]);
  });

  test('squaresWithFile(${File.two})', () {
    expect(squaresWithFile(File.two), [
      Square.twoA,
      Square.twoB,
      Square.twoC,
      Square.twoD,
      Square.twoE,
      Square.twoF,
      Square.twoG,
      Square.twoH,
      Square.twoI,
    ]);
  });

  test('squaresWithFile(${File.three})', () {
    expect(squaresWithFile(File.three), [
      Square.threeA,
      Square.threeB,
      Square.threeC,
      Square.threeD,
      Square.threeE,
      Square.threeF,
      Square.threeG,
      Square.threeH,
      Square.threeI,
    ]);
  });

  test('squaresWithFile(${File.four})', () {
    expect(squaresWithFile(File.four), [
      Square.fourA,
      Square.fourB,
      Square.fourC,
      Square.fourD,
      Square.fourE,
      Square.fourF,
      Square.fourG,
      Square.fourH,
      Square.fourI,
    ]);
  });

  test('squaresWithFile(${File.five})', () {
    expect(squaresWithFile(File.five), [
      Square.fiveA,
      Square.fiveB,
      Square.fiveC,
      Square.fiveD,
      Square.fiveE,
      Square.fiveF,
      Square.fiveG,
      Square.fiveH,
      Square.fiveI,
    ]);
  });

  test('squaresWithFile(${File.six})', () {
    expect(squaresWithFile(File.six), [
      Square.sixA,
      Square.sixB,
      Square.sixC,
      Square.sixD,
      Square.sixE,
      Square.sixF,
      Square.sixG,
      Square.sixH,
      Square.sixI,
    ]);
  });

  test('squaresWithFile(${File.seven})', () {
    expect(squaresWithFile(File.seven), [
      Square.sevenA,
      Square.sevenB,
      Square.sevenC,
      Square.sevenD,
      Square.sevenE,
      Square.sevenF,
      Square.sevenG,
      Square.sevenH,
      Square.sevenI,
    ]);
  });

  test('squaresWithFile(${File.eight})', () {
    expect(squaresWithFile(File.eight), [
      Square.eightA,
      Square.eightB,
      Square.eightC,
      Square.eightD,
      Square.eightE,
      Square.eightF,
      Square.eightG,
      Square.eightH,
      Square.eightI,
    ]);
  });

  test('squaresWithFile(${File.nine})', () {
    expect(squaresWithFile(File.nine), [
      Square.nineA,
      Square.nineB,
      Square.nineC,
      Square.nineD,
      Square.nineE,
      Square.nineF,
      Square.nineG,
      Square.nineH,
      Square.nineI,
    ]);
  });

  test('squaresWithRank(${Rank.a})', () {
    expect(squaresWithRank(Rank.a), [
      Square.oneA,
      Square.twoA,
      Square.threeA,
      Square.fourA,
      Square.fiveA,
      Square.sixA,
      Square.sevenA,
      Square.eightA,
      Square.nineA,
    ]);
  });

  test('squaresWithRank(${Rank.b})', () {
    expect(squaresWithRank(Rank.b), [
      Square.oneB,
      Square.twoB,
      Square.threeB,
      Square.fourB,
      Square.fiveB,
      Square.sixB,
      Square.sevenB,
      Square.eightB,
      Square.nineB,
    ]);
  });

  test('squaresWithRank(${Rank.c})', () {
    expect(squaresWithRank(Rank.c), [
      Square.oneC,
      Square.twoC,
      Square.threeC,
      Square.fourC,
      Square.fiveC,
      Square.sixC,
      Square.sevenC,
      Square.eightC,
      Square.nineC,
    ]);
  });

  test('squaresWithRank(${Rank.d})', () {
    expect(squaresWithRank(Rank.d), [
      Square.oneD,
      Square.twoD,
      Square.threeD,
      Square.fourD,
      Square.fiveD,
      Square.sixD,
      Square.sevenD,
      Square.eightD,
      Square.nineD,
    ]);
  });

  test('squaresWithRank(${Rank.e})', () {
    expect(squaresWithRank(Rank.e), [
      Square.oneE,
      Square.twoE,
      Square.threeE,
      Square.fourE,
      Square.fiveE,
      Square.sixE,
      Square.sevenE,
      Square.eightE,
      Square.nineE,
    ]);
  });

  test('squaresWithRank(${Rank.f})', () {
    expect(squaresWithRank(Rank.f), [
      Square.oneF,
      Square.twoF,
      Square.threeF,
      Square.fourF,
      Square.fiveF,
      Square.sixF,
      Square.sevenF,
      Square.eightF,
      Square.nineF,
    ]);
  });

  test('squaresWithRank(${Rank.g})', () {
    expect(squaresWithRank(Rank.g), [
      Square.oneG,
      Square.twoG,
      Square.threeG,
      Square.fourG,
      Square.fiveG,
      Square.sixG,
      Square.sevenG,
      Square.eightG,
      Square.nineG,
    ]);
  });

  test('squaresWithRank(${Rank.h})', () {
    expect(squaresWithRank(Rank.h), [
      Square.oneH,
      Square.twoH,
      Square.threeH,
      Square.fourH,
      Square.fiveH,
      Square.sixH,
      Square.sevenH,
      Square.eightH,
      Square.nineH,
    ]);
  });

  test('squaresWithRank(${Rank.i})', () {
    expect(squaresWithRank(Rank.i), [
      Square.oneI,
      Square.twoI,
      Square.threeI,
      Square.fourI,
      Square.fiveI,
      Square.sixI,
      Square.sevenI,
      Square.eightI,
      Square.nineI,
    ]);
  });

  test('promotableSquaresForPlayer(${PlayerType.sente})', () {
    expect(promotableSquaresForPlayer(PlayerType.sente), [
      Square.oneA,
      Square.twoA,
      Square.threeA,
      Square.fourA,
      Square.fiveA,
      Square.sixA,
      Square.sevenA,
      Square.eightA,
      Square.nineA,
      Square.oneB,
      Square.twoB,
      Square.threeB,
      Square.fourB,
      Square.fiveB,
      Square.sixB,
      Square.sevenB,
      Square.eightB,
      Square.nineB,
      Square.oneC,
      Square.twoC,
      Square.threeC,
      Square.fourC,
      Square.fiveC,
      Square.sixC,
      Square.sevenC,
      Square.eightC,
      Square.nineC,
    ]);
  });

  test('promotableSquaresForPlayer(${PlayerType.gote})', () {
    expect(promotableSquaresForPlayer(PlayerType.gote), [
      Square.oneG,
      Square.twoG,
      Square.threeG,
      Square.fourG,
      Square.fiveG,
      Square.sixG,
      Square.sevenG,
      Square.eightG,
      Square.nineG,
      Square.oneH,
      Square.twoH,
      Square.threeH,
      Square.fourH,
      Square.fiveH,
      Square.sixH,
      Square.sevenH,
      Square.eightH,
      Square.nineH,
      Square.oneI,
      Square.twoI,
      Square.threeI,
      Square.fourI,
      Square.fiveI,
      Square.sixI,
      Square.sevenI,
      Square.eightI,
      Square.nineI,
    ]);
  });
}
