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
  static const piecesWhichCanBePromoted = const [
    PieceType.pawn,
    PieceType.lance,
    PieceType.knight,
    PieceType.silver,
    PieceType.bishop,
    PieceType.rook,
  ];

  /// A map of piece type and their promoted equivalents
  static const convertPieceTypeToPromotedPieceType = const {
    PieceType.pawn: PieceType.pawnPromoted,
    PieceType.lance: PieceType.lancePromoted,
    PieceType.knight: PieceType.knightPromoted,
    PieceType.silver: PieceType.silverPromoted,
    PieceType.bishop: PieceType.bishopPromoted,
    PieceType.rook: PieceType.rookPromoted,
  };

  /// Whether the piece type can be promoted
  bool get canBePromoted => piecesWhichCanBePromoted.contains(this);

  /// Returns a promoted equivalent for the piece type. Returns `null` if the piece type cannot be promoted.
  PieceType get promoted => this.canBePromoted ? convertPieceTypeToPromotedPieceType[this] : null;
}
