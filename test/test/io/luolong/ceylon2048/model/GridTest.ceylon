import ceylon.test {
    assertEquals,
    assertTrue,
    test
}

import io.luolong.ceylon2048.model {
    Position,
    Grid,
    Tile,
    tile
}

class GridTest() {

    Grid board = Grid(4);

    """New board has 16 cells"""
    test shared void has16Cells() => assertEquals(board.tiles.size, 4*4);

    """New board is empty by default"""
    test shared void defaultBoardIsEmpty() => assertTrue(every(board.tiles*.empty));

    """Board has 4 rows"""
    test shared void has4RowsOfCells() => assertEquals {
        actual = board.rows;
        expected = [for (row in 1..4) [for (column in 1..4) tile([row, column])]];
    };

    """Board has 4 columns"""
    test shared void has4ColumnsOfCells() => assertEquals {
        actual = board.columns;
        expected = [for (column in 1..4) [for (row in 1..4) tile([row, column])]];
    };

    """Can ask for a column of cells"""
    test shared void canAskForASingleColumnOfCells() => assertEquals {
        actual = board.column(2);
        expected = [for (row in 1..4) Tile(Position(row, 2))];
    };

    """Can ask for a row of cells"""
    test shared void canAskForASingleRowOfCells() => assertEquals {
        actual = board.row(2);
        expected = [for (column in 1..4) Tile(Position(2, column))];
    };

    """Can instantiate board with cell values"""
    test shared void canInstantiateWithState() {
        assertEquals {
             actual = Grid(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]).tiles;
             expected = [
                 Tile(Position(1, 1), 1), Tile(Position(1, 2), 0), Tile(Position(1, 3), 0), Tile(Position(1, 4), 0),
                 Tile(Position(2, 1), 0), Tile(Position(2, 2), 1), Tile(Position(2, 3), 0), Tile(Position(2, 4), 0),
                 Tile(Position(3, 1), 0), Tile(Position(3, 2), 0), Tile(Position(3, 3), 1), Tile(Position(3, 4), 0),
                 Tile(Position(4, 1), 0), Tile(Position(4, 2), 0), Tile(Position(4, 3), 0), Tile(Position(4, 4), 1)
             ];
      };
    }

    """Can instantiate board with cell values"""
    test shared void canReturnState() {
        assertEquals(Grid(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]).state,
            [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
    }

    test shared void itReturnsAvailableCells() => assertEquals{
      actual = Grid(4, [0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0]).available;
      expected = [Tile(Position(1, 1)), Tile(Position(2, 2)), Tile(Position(3, 3)), Tile(Position(4, 4))];
    };
}