import ceylon.test {
    assertEquals,
    test
}

import io.luolong.ceylon2048.model {
    Game,
    Board,
    move,
    left,
    right,
    up,
    down
}

class GameTest() {

    Game game = Game(Board(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]));

    test shared void leftMovesAllCellsLeft() => assertEquals {
        actual = game.moves(left);
        expected = [
            move(1, [1, 1] -> [1, 1]),
            move(1, [2, 2] -> [2, 1]),
            move(1, [3, 3] -> [3, 1]),
            move(1, [4, 4] -> [4, 1])];
    };

    test shared void rightMovesAllCellsRight() => assertEquals {
        actual = game.moves(right);
        expected = [
            move(1, [1, 1] -> [1, 4]),
            move(1, [2, 2] -> [2, 4]),
            move(1, [3, 3] -> [3, 4]),
            move(1, [4, 4] -> [4, 4])];
    };

    test shared void upMovesAllCellsUp() => assertEquals {
        actual = game.moves(up);
        expected = [
            move(1, [1, 1] -> [1, 1]),
            move(1, [2, 2] -> [1, 2]),
            move(1, [3, 3] -> [1, 3]),
            move(1, [4, 4] -> [1, 4])];
    };

    test shared void downMovesAllCellsDown() => assertEquals {
        actual = game.moves(down);
        expected = [
            move(1, [1, 1] -> [4, 1]),
            move(1, [2, 2] -> [4, 2]),
            move(1, [3, 3] -> [4, 3]),
            move(1, [4, 4] -> [4, 4])];
    };

}