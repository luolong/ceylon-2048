import io.luolong.ceylon2048.model {
    Board
}

shared class Game(board) {
    variable Board board;

    shared [Move+] move(Direction direction) {
        return nothing;
    }
}

"""Vector (i.e. direction) of the movement in terms of rows and columns"""
shared alias Vector => Position;
Vector vector(Integer row, Integer column) {
    return Position(row, column);
}

"""The gravitational direction of the move.
   It can be considered as a direction of the gravitational force that
   moves all cells on the board to the side of the board."""
shared abstract class Direction(string, direction) of Vertical | Horizontal {

    shared actual String string;

    """The _direction_ of the gravitational force"""
    shared Vector direction;

    """Advances position to the next position, which points _away_ from the gravitational direction (i.e. _"up"_ if you will)."""
    shared Position next(Position position) => position - direction;
}
shared abstract class Horizontal(String string, Vector direction) of left | right
                extends Direction(string, direction) {}

shared abstract class Vertical(String string, Vector direction) of up | down
                extends Direction(string, direction) {}

shared object up extends Vertical("up", vector(-1, 0)) {}
shared object down extends Vertical("down", vector(1, 0)) {}

shared object right extends Horizontal("right", vector(0, 1)) {}
shared object left extends Horizontal("left", vector(0, -1)) {}

