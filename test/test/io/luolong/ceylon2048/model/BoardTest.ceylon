import ceylon.test {
    assertEquals,
    assertTrue,
    test
}
import io.luolong.ceylon2048.model {
    Position,
    Board,
    Cell
}

class BoardTest() {

    Board board = Board(4);

    """New board has 16 cells"""
    test shared void has16Cells() => assertEquals(board.cells.size, 4*4);

    """New board is empty by default"""
    test shared void defaultBoardIsEmpty() => assertTrue(every(board.cells*.empty));

    """Board has 4 rows"""
    test shared void has4RowsOfCells() => assertEquals {
        actual = board.rows;
        expected = [for (row in 1..4) [for (column in 1..4) Cell(Position(row, column))]];
    };

    """Board has 4 columns"""
    test shared void has4ColumnsOfCells() => assertEquals {
        actual = board.columns;
        expected = [for (column in 1..4) [for (row in 1..4) Cell(Position(row, column))]];
    };

    """Can ask for a column of cells"""
    test shared void canAskForASingleColumnOfCells() => assertEquals {
        actual = board.column(2);
        expected = [for (row in 1..4) Cell(Position(row, 2))];
    };

    """Can ask for a row of cells"""
    test shared void canAskForASingleRowOfCells() => assertEquals {
        actual = board.row(2);
        expected = [for (column in 1..4) Cell(Position(2, column))];
    };

    """Can instantiate board with cell values"""
    test shared void canInstantiateWithState() {
        assertEquals {
             actual = Board(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]).cells;
             expected = [
                 Cell(Position(1, 1), 1), Cell(Position(1, 2), 0), Cell(Position(1, 3), 0), Cell(Position(1, 4), 0),
                 Cell(Position(2, 1), 0), Cell(Position(2, 2), 1), Cell(Position(2, 3), 0), Cell(Position(2, 4), 0),
                 Cell(Position(3, 1), 0), Cell(Position(3, 2), 0), Cell(Position(3, 3), 1), Cell(Position(3, 4), 0),
                 Cell(Position(4, 1), 0), Cell(Position(4, 2), 0), Cell(Position(4, 3), 0), Cell(Position(4, 4), 1)
             ];
      };
    }

    """Can instantiate board with cell values"""
    test shared void canReturnState() {
        assertEquals(Board(4, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]).state,
            [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
    }

    test shared void itReturnsAvailableCells() => assertEquals{
      actual = Board(4, [0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0]).available;
      expected = [Cell(Position(1, 1)), Cell(Position(2, 2)), Cell(Position(3, 3)), Cell(Position(4, 4))];
    };
}