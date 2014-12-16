import ceylon.test {
    assertEquals,
    test
}

import info.tepp.ceylon2048.model {
    tile
}

class CellTest() {

    """Two cells with same position and integer value are equal"""
    test shared void cellEquality() => assertEquals(tile([1, 1], 2), tile([1, 1], 2));

    """Cell is empty by default"""
    test shared void cellIsEmptyByDefault() { assert(tile([1,1]).empty); }

    """Cell with integer value is non-empty"""
    test shared void cellWithValueIsNonEmpty() { assert(!tile([1, 1], 2).empty); }

}