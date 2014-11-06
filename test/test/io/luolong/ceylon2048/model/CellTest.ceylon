import ceylon.test {
    assertEquals,
    test
}
import io.luolong.ceylon2048.model {
    Position,
    Cell
}

class CellTest() {

    """Two cells with same position and integer value are equal"""
    test shared void cellEquality() => assertEquals(Cell(Position(1, 1), 2), Cell(Position(1, 1), 2));

    """Cell is empty by default"""
    test shared void cellIsEmptyByDefault() { assert(Cell(Position(1,1)).empty); }

    """Cell with integer value is non-empty"""
    test shared void cellWithValueIsNonEmpty() { assert(!Cell(Position(1, 1), 2).empty); }

}