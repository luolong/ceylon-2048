
"""A single row of tiles"""
shared alias Row => [Tile+];

"""A single column of tiles"""
shared alias Column => [Tile+];

"""A grid of tiles that makes up a game board

   A grid can be initialized with a state, that has a content"""
shared class Grid(size, state = [for (row in 1..size * size) 0]) {

    """Number of rows and columns on the board."""
    shared Integer size;

    """Initial state of the board described as a `size x size` sequence of tile content values.

       All cells must be properly initialized.
       This means that the state size, if provided must be exactly `size x size` elements long.

       Each value represents a single tile on a board:
       * Positive number represents content value of the tile.
       * `0` represents an empty (available) tile
       * Negative values are not allowed.
       """
    shared [Content+] state;

    "State must initialize exactly all cells on the board!"
    assert(state.size == size*size);

    "Negative state values are not allowed!"
    assert(state.every((Content element) => element >= 0));

    value positions = [for (row in 1..size) for (column in 1..size) Position(row, column)];

    "Sequence containing all tiles on the grid.

     Each cell has a position on the board (row and column) and content value."
    shared [Tile+] cells = [for (pair in zipPairs(positions, state)) Tile(pair[0], pair[1])];

    "Sequence of rows.

     There are exactly `size` rows of `size` tiles - one for each column."
    shared [Row+] rows => [*cells.partition(size)];

    "Sequence of columns.

     There are exactly `size` columns of `size` tiles - one for each row."
    shared [Column+] columns => [ for (columnNumber in 1..size) column(columnNumber)];

    "Select a single column of cells."
    shared Column column(Integer columnNumber) {
        assert(nonempty sequence = cells.skip(columnNumber - 1).by(size).sequence());
        return sequence;
    }

    "Select a single row of cells"
    shared Row row(Integer rowNumber) {
        assert(nonempty sequence = cells.skip((rowNumber - 1) * size).take(size).sequence());
        return sequence;
    }

    "Select all available cells on the board. Cells are available when they are _empty_ (i.e. their integer value is `0`)"
    see (`value Tile.empty`)
    shared [Tile*] available => [for (cell in cells) if (cell.empty) cell];

    shared actual String string => "\n".join(cells.partition(size).map(([Tile+] row) => ";".join(row)));
}
