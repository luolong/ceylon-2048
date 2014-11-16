import ceylon.test {
    test,
    ignore
}

import io.luolong.ceylon2048.model {
    Game,
    Grid,
    move
}

class GameTest() {

    Grid board = Grid(4);
    Game game = Game(board);

    ignore test shared void applyingMovesUpdatesBoard() => game.apply([move(1, [1,1] -> [1,1])]);

}