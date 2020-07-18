/// An enum describing the types of player
enum PlayerType {
  sente,
  gote,
}

/// A class of extensions for PlayerType
extension PlayerTypeExtensions on PlayerType {
  /// Whether the player type is sente
  bool get isSente => this == PlayerType.sente;

  /// Whether the player type is gote
  bool get isGote => this == PlayerType.gote;

  /// Flips the player type, i.e. `PlayerType.sente` => `PlayerType.gote`
  PlayerType flip() => isSente ? PlayerType.gote : PlayerType.sente;
}
