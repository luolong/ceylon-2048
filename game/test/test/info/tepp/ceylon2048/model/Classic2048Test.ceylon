import ceylon.test {
    assertTrue,
    test,
    assertFalse
}

import info.tepp.ceylon2048.model {
    Strategy=Classic2048,
    tile
}

class Classic2048Test() {
    value it = Strategy();

    test shared void canMergeOneCell()
            => assertTrue(it.canBeMerged([tile([1,1], 1)]));

    test shared void canMergeTwoCellsWithSameContent()
            => assertTrue(it.canBeMerged([tile([1,1], 1), tile([1,2], 1)]));

    test shared void canNotMergeTwoCellsWithDifferentContent()
            => assertFalse(it.canBeMerged([tile([1,1], 1), tile([1,2], 2)]));

    test shared void canNotMergeThreeCells()
            => assertFalse(it.canBeMerged([tile([1,1], 1), tile([1,2], 1), tile([1,3], 1)]));

}