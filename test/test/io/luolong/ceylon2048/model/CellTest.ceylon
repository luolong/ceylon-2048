import ceylon.test {
    assertEquals,
    test
}
import info.tepp.ceylon2048.model {
    Position,
    Tile
}

class CellTest() {

    """Two cells with same position and integer value are equal"""
    test shared void cellEquality() => assertEquals(Tile(Position(1, 1), 2), Tile(Position(1, 1), 2));

    """Cell is empty by default"""
    test shared void cellIsEmptyByDefault() { assert(Tile(Position(1,1)).empty); }

    """Cell with integer value is non-empty"""
    test shared void cellWithValueIsNonEmpty() { assert(!Tile(Position(1, 1), 2).empty); }

}