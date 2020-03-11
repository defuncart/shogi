## [0.0.3] - 11/03/2020

* Breaking changes: A game board is now represented by `GameBoard`, not simply by `List<BoardPiece>`.
* Adds the ability to have pieces in hand.
* Adds ability to drop pieces or capture pieces.
* Adds ability to import a GameBoard from a SFEN ascii string.

## [0.0.2] - 10/02/2020

* Breaking Changes: indices range [1, 9] is now used instead of [0, 8] to denote board position.
* Adds basic move capability so that, for instance, the building of castle could be animated or a simple 1 move Tsume could be shown.
* Removes the dependency on Flutter Foundation.

## [0.0.1] - 13/10/2019

* Initial release of shogi package, based on business logic components from flutter_shogi_board.
