import io.luolong.ceylon2048.model {
    Board
}

shared class Game(board) {
    variable Board board;

    """Returns a sequence of cell moves in the given direction"""
    shared [Move*] moves(Direction direction) {
        value slider = Slider(direction, ClassicMergeStrategy());
        return direction.reorder(board.cells)
                        .fold(slider, (Slider it, Cell cell) => it.move(cell))
                        .moves;
    }
}

"""Vector (i.e. direction) of the movement in terms of rows and columns"""
shared alias Vector => [Integer, Integer];

"""The gravitational direction of the move.
   It can be considered as a direction of the gravitational force that
   moves all cells on the board to the side of the board."""
shared abstract class Direction(string, direction) of Vertical | Horizontal {

    shared actual String string;

    Vector direction;

    """Advances position to the next position, which points
       _away_ from the gravitational direction (i.e. _"up"_ if you will)."""
    shared Position next(Position position) => Position(
        position.row - direction[0],
        position.column - direction[1]);

    shared formal Comparison(Cell, Cell) ordering;
    shared [Cell+] reorder([Cell+] cells) => cells.sort(ordering);
}
shared abstract class Horizontal(String string, Vector direction) of left | right
                extends Direction(string, direction) {}

shared abstract class Vertical(String string, Vector direction) of up | down
                extends Direction(string, direction) {}

shared object up extends Vertical("up", [-1, 0]) {
    ordering = comparing(
        byIncreasing(Cell.column),
        byIncreasing(Cell.row)
    );
}
shared object down extends Vertical("down", [1, 0]) {
    ordering = comparing(
        byIncreasing(Cell.column),
        byDecreasing(Cell.row)
    );
}

shared object right extends Horizontal("right", [0, 1]) {
    ordering = comparing(
        byIncreasing(Cell.row),
        byDecreasing(Cell.column)
    );
}
shared object left extends Horizontal("left", [0, -1]) {
    ordering = comparing(
        byIncreasing(Cell.row),
        byIncreasing(Cell.column)
    );
}

