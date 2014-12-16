import ceylon.test {
    assertEquals,
    assertTrue,
    test
}

import info.tepp.ceylon2048.model {
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
        actual = board.rows.sequence();
        expected = [for (row in 1..4) [for (column in 1..4) tile([row, column])]];
    };

    """Board has 4 columns"""
    test shared void has4ColumnsOfCells() => assertEquals {
        actual = board.columns.sequence();
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
                 tile([1, 1], 1), tile([1, 2], 0), tile([1, 3], 0), tile([1, 4], 0),
                 tile([2, 1], 0), tile([2, 2], 1), tile([2, 3], 0), tile([2, 4], 0),
                 tile([3, 1], 0), tile([3, 2], 0), tile([3, 3], 1), tile([3, 4], 0),
                 tile([4, 1], 0), tile([4, 2], 0), tile([4, 3], 0), tile([4, 4], 1)
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
      expected = [tile([1, 1]), tile([2, 2]), tile([3, 3]), tile([4, 4])];
    };
}