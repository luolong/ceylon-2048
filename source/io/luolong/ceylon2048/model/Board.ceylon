
shared alias Row => [Cell+];
shared alias Column => [Cell+];

shared class Board(size, state = [for (row in 1..size * size) 0]) {

    """Number of rows and columns on the board."""
    shared Integer size;

    """Initial state of the board.

       All cells must be properly initialized. This means that the state size,
       if provided must be exactly `size x size` elements long.

       Each value represents a cell on a board:
       * Positive number in a cell is it's integer value
       * Integer value zero (`0`) represents an empty cell
       * Negative values are not allowed
       """
    shared [Integer+] state;

    "State must initialize exactly all cells on the board!"
    assert(state.size == size*size);

    "Negative state values are not allowed!"
    assert(state.every((Integer element) => element >= 0));

    value positions = [for (row in 1..size) for (column in 1..size) Position(row, column)];

    "All cells on the board. Each cell has a position on the board (row and column)"
    shared [Cell+] cells = [for (pair in zipPairs(positions, state)) Cell(pair[0], pair[1])];

    "Sequence of rows. There are exactly `size` rows, containing a cell for each column."
    shared [Row+] rows => [*cells.partition(size)];

    "Sequence of columns. There are exactly `size` columns, containing a cell for each row."
    shared [Column+] columns => [ for (columnNumber in 1..size) column(columnNumber)];

    "Select a single column of cells"
    shared [Cell+] column(Integer columnNumber) {
        assert(nonempty sequence = cells.skip(columnNumber - 1).by(size).sequence());
        return sequence;
    }

    "Select a single row of cells"
    shared [Cell+] row(Integer rowNumber) {
        assert(nonempty sequence = cells.skip((rowNumber - 1) * size).take(size).sequence());
        return sequence;
    }

    "Select all available cells on the board. Cells are available when they are _empty_ (i.e. their integer value is `0`)"
    see (`value Cell.empty`)
    shared [Cell*] available => [for (cell in cells) if (cell.empty) cell];

    shared actual String string => "\n".join(cells.partition(size).map(([Cell+] row) => ";".join(row)));
}
