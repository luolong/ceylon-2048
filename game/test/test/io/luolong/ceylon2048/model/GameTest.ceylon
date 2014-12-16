import ceylon.test {
    test,
    assertEquals,
    assertFalse,
    assertTrue,
    fail
}

import info.tepp.ceylon2048.model {
    Game,
    Grid,
    left,
    tile
}

class GameTest() {

    value game = Game(Grid(3, [1, 1, 0, 0, 1, 1, 1, 0, 1]));
    value moveLeft = game.moves(left);

    test shared void applyingMovesUpdatesGrid() => assertEquals(
        game.apply(moveLeft).grid.state,
        [2, 0, 0, 2, 0, 0, 2, 0, 0]
    );

    test shared void applyingMovesUpdatesScore() => assertEquals(
        game.apply(moveLeft).score, 6
    );

    test shared void gameWithAvailableTilesIsNotOver() => assertFalse(
        Game(Grid(4, [1,2,1,0,2,1,2,1,1,2,1,2,2,1,2,1])).over
    );

    test shared void gameWithOneAvailableMoveIsNotOver() => assertFalse(
        Game(Grid(4, [2,1,1,2,1,2,4,1,2,1,2,4,4,2,4,2])).over
    );

    test shared void gameWithOneAvailableMoveIsNotOver2() => assertFalse(
        Game(Grid(4, [2,1,2,1,1,2,4,2,2,1,2,4,4,2,1,4])).over
    );

    test shared void gameWithNoAvailableMovesIsOver() => assertTrue(
        Game(Grid(4, [2,1,2,1,1,2,1,2,2,1,2,1,1,2,1,2])).over
    );

    test shared void puttingItemToAvailableTile() => assertEquals(
        game.put(tile([1,3],1)).grid.state,
        [1, 1, 1, 0, 1, 1, 1, 0, 1]
    );

    test shared void puttingItemToUnavailableTile() {
        try {
            game.put(tile([1,2],1));
        }
        catch (AssertionError error) {
            return; // this is expected
        }

        fail("Should have thrown AssertionError");
    }
}