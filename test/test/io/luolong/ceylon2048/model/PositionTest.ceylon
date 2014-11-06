import ceylon.test {
    assertEquals,
    test
}

import io.luolong.ceylon2048.model {
    Position
}
class PositionTest() {

    test shared void canAddPositions() => assertEquals(Position(1, 1) + Position(2, 2), Position(3, 3));

    test shared void canInvertPosition() => assertEquals(-Position(1, -1), Position(-1, 1));

    test shared void canSubtractPositions() => assertEquals(Position(1, 1) - Position(2, 2), Position(-1, -1));

}