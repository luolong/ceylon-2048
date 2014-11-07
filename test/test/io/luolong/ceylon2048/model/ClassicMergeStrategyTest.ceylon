import ceylon.test {
    assertTrue,
    test,
    assertFalse
}

import io.luolong.ceylon2048.model {
    Position,
    Cell,
    Strategy=ClassicMergeStrategy
}

class ClassicMergeStrategyTest() {
    value it = Strategy();

    test shared void canMergeOneCell()
            => assertTrue(it.canBeMerged([Cell(Position(1,1), 1)]));

    test shared void canMergeTwoCellsWithSameContent()
            => assertTrue(it.canBeMerged([Cell(Position(1,1), 1), Cell(Position(1,2), 1)]));

    test shared void canNotMergeTwoCellsWithDifferentContent()
            => assertFalse(it.canBeMerged([Cell(Position(1,1), 1), Cell(Position(1,2), 2)]));

    test shared void canNotMergeThreeCells()
            => assertFalse(it.canBeMerged([Cell(Position(1,1), 1), Cell(Position(1,2), 1), Cell(Position(1,3), 1)]));

}