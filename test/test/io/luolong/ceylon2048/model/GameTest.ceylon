import ceylon.test {
    assertEquals,
    test,
    ignore
}
import io.luolong.ceylon2048.model {
    Position,
    Game,
    left,
    Board,
    Cell
}

class GameTest() {

    Game game = Game(Board(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]));

    ignore test shared void moveLeftReturnsChanges() => assertEquals {
        actual = game.move(left);
        expected = [
            Cell(Position(1, 1), 1), Cell(Position(1, 2), 0), Cell(Position(1, 3), 0), Cell(Position(1, 4), 0),
            Cell(Position(2, 1), 1), Cell(Position(2, 2), 0), Cell(Position(2, 3), 0), Cell(Position(2, 4), 0),
            Cell(Position(3, 1), 1), Cell(Position(3, 2), 0), Cell(Position(3, 3), 0), Cell(Position(3, 4), 0),
            Cell(Position(4, 1), 1), Cell(Position(4, 2), 0), Cell(Position(4, 3), 0), Cell(Position(4, 4), 0)
        ];
    };

}