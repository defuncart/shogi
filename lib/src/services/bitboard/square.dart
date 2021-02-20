import 'package:shogi/shogi.dart';

import '../../utils/dart_utils.dart';

enum File {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
}

enum Rank {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
}

enum Square {
  oneA,
  oneB,
  oneC,
  oneD,
  oneE,
  oneF,
  oneG,
  oneH,
  oneI,
  twoA,
  twoB,
  twoC,
  twoD,
  twoE,
  twoF,
  twoG,
  twoH,
  twoI,
  threeA,
  threeB,
  threeC,
  threeD,
  threeE,
  threeF,
  threeG,
  threeH,
  threeI,
  fourA,
  fourB,
  fourC,
  fourD,
  fourE,
  fourF,
  fourG,
  fourH,
  fourI,
  fiveA,
  fiveB,
  fiveC,
  fiveD,
  fiveE,
  fiveF,
  fiveG,
  fiveH,
  fiveI,
  sixA,
  sixB,
  sixC,
  sixD,
  sixE,
  sixF,
  sixG,
  sixH,
  sixI,
  sevenA,
  sevenB,
  sevenC,
  sevenD,
  sevenE,
  sevenF,
  sevenG,
  sevenH,
  sevenI,
  eightA,
  eightB,
  eightC,
  eightD,
  eightE,
  eightF,
  eightG,
  eightH,
  eightI,
  nineA,
  nineB,
  nineC,
  nineD,
  nineE,
  nineF,
  nineG,
  nineH,
  nineI,
}

extension SquareExtensions on Square {
  File get file {
    final fileIndex = (index / File.values.length).floor();

    return File.values[fileIndex];
  }

  Rank get rank {
    final rankIndex = index % Rank.values.length;

    return Rank.values[rankIndex];
  }
}

List<Square> squaresWithFile(File file) => Square.values
    .where(
      (square) => DartUtils.describeEnum(square).contains(
        DartUtils.describeEnum(file),
      ),
    )
    .toList();

List<Square> squaresWithRank(Rank rank) => Square.values
    .where(
      (square) => DartUtils.describeEnum(square).contains(
        DartUtils.describeEnum(rank).toUpperCase(),
      ),
    )
    .toList();

List<Square> promotableSquaresForPlayer(PlayerType player) => player.isSente
    ? [
        ...squaresWithRank(Rank.a),
        ...squaresWithRank(Rank.b),
        ...squaresWithRank(Rank.c),
      ]
    : [
        ...squaresWithRank(Rank.g),
        ...squaresWithRank(Rank.h),
        ...squaresWithRank(Rank.i),
      ];
