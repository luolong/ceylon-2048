import ceylon.test {
    assertTrue,
    test,
    assertFalse
}

import info.tepp.ceylon2048.model {
    Position,
    Tile,
    Strategy=Classic2048
}

class Classic2048Test() {
    value it = Strategy();

    test shared void canMergeOneCell()
            => assertTrue(it.canBeMerged([Tile(Position(1,1), 1)]));

    test shared void canMergeTwoCellsWithSameContent()
            => assertTrue(it.canBeMerged([Tile(Position(1,1), 1), Tile(Position(1,2), 1)]));

    test shared void canNotMergeTwoCellsWithDifferentContent()
            => assertFalse(it.canBeMerged([Tile(Position(1,1), 1), Tile(Position(1,2), 2)]));

    test shared void canNotMergeThreeCells()
            => assertFalse(it.canBeMerged([Tile(Position(1,1), 1), Tile(Position(1,2), 1), Tile(Position(1,3), 1)]));

}