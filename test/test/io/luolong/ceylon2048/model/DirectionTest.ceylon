import ceylon.test {
    assertEquals,
    test
}
import io.luolong.ceylon2048.model {
    Position,
    down,
    left,
    right,
    up
}

class DirectionTest() {

    test shared void nextLeftIncreasesColumn() => assertEquals(left.next(Position(1,1)), Position(1,2));
    test shared void nextRightDecreasesColumn() => assertEquals(right.next(Position(1,1)), Position(1,0));
    test shared void nextUpIncreasesRow() => assertEquals(up.next(Position(1,1)), Position(2,1));
    test shared void nextDownDecreasesRow() => assertEquals(down.next(Position(1,1)), Position(0,1));

}