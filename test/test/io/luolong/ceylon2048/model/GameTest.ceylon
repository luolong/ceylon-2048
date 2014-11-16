import ceylon.test {
    test,
    assertEquals
}

import io.luolong.ceylon2048.model {
    Game,
    Grid,
    left
}

class GameTest() {

    value game = Game(Grid(3, [1, 1, 0, 0, 1, 1, 1, 0, 1]));
    value moveLeft = game.moves(left);

    test shared void applyingMovesUpdatesGrid() => assertEquals(
        game.apply(moveLeft).grid.state,
        [2, 0, 0, 2, 0, 0, 2, 0, 0]
    );

    test shared void applyingMovesUpdatesScore() => assertEquals(
        game.apply(moveLeft).score,
        6
    );

}