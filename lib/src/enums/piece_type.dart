/// An enum describing the types of board pieces
enum PieceType {
  king,
  rook,
  bishop,
  gold,
  silver,
  knight,
  lance,
  pawn,
  rookPromoted,
  bishopPromoted,
  silverPromoted,
  knightPromoted,
  lancePromoted,
  pawnPromoted,
}

/// A class of extensions for PieceType
extension PieceTypeExtensions on PieceType {
  /// A list of piece types which can be promoted
  static const piecesWhichCanBePromoted = [
    PieceType.pawn,
    PieceType.lance,
    PieceType.knight,
    PieceType.silver,
    PieceType.bishop,
    PieceType.rook,
  ];

  /// A list of promoted piece types
  static const promotedPieces = [
    PieceType.pawnPromoted,
    PieceType.lancePromoted,
    PieceType.knightPromoted,
    PieceType.silverPromoted,
    PieceType.bishopPromoted,
    PieceType.rookPromoted,
  ];

  /// A map of piece type and their promoted equivalents
  static const convertPieceTypeToPromotedPieceType = {
    PieceType.pawn: PieceType.pawnPromoted,
    PieceType.lance: PieceType.lancePromoted,
    PieceType.knight: PieceType.knightPromoted,
    PieceType.silver: PieceType.silverPromoted,
    PieceType.bishop: PieceType.bishopPromoted,
    PieceType.rook: PieceType.rookPromoted,
  };

  /// A map of promoted piece types and their standard equivalents
  static final convertPromotedPieceTypeToPieceType =
      convertPieceTypeToPromotedPieceType.map((k, v) => MapEntry(v, k));

  /// Whether the piece type can be promoted
  bool get canBePromoted => piecesWhichCanBePromoted.contains(this);

  /// Returns a promoted equivalent for the piece type. Returns `null` if the piece type cannot be promoted.
  PieceType promote() =>
      canBePromoted ? convertPieceTypeToPromotedPieceType[this] : null;

  /// Whether the piece type is promoted
  bool get isPromoted => promotedPieces.contains(this);

  /// Returns a normalized equivalent for the piece type (i.e. PieceType.pawnPromoted => PieceType.pawn).
  PieceType normalize() =>
      isPromoted ? convertPromotedPieceTypeToPieceType[this] : this;
}
