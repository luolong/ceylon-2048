
"""Unit vector (i.e. direction) of the movement in terms of rows and columns"""
shared alias Vector => [Integer, Integer];


"""The direction of the move."""
shared abstract class Direction(string, Vector direction) of Vertical | Horizontal {

    shared actual String string;

    "Returns previous position _away_ from this direction."
    shared Position previous(Position position) => Position {
        row = position.row - direction[0];
        column = position.column - direction[1];
    };

    "Return next position according to this direction."
    shared Position next(Position position) => Position {
        row = position.row + direction[0];
        column = position.column + direction[1];
    };

    shared formal Comparison(Tile, Tile) orderBy;
    shared [Tile+] reorder([Tile+] cells) => cells.sort(orderBy);

}

shared abstract class Horizontal(String string, Vector direction) of left | right
        extends Direction(string, direction) {}

shared abstract class Vertical(String string, Vector direction) of up | down
        extends Direction(string, direction) {}

shared object up extends Vertical("up", [-1, 0]) {
    orderBy = comparing(
        byIncreasing(Tile.column),
        byIncreasing(Tile.row)
    );
}
shared object down extends Vertical("down", [1, 0]) {
    orderBy = comparing(
        byIncreasing(Tile.column),
        byDecreasing(Tile.row)
    );
}

shared object right extends Horizontal("right", [0, 1]) {
    orderBy = comparing(
        byIncreasing(Tile.row),
        byDecreasing(Tile.column)
    );
}
shared object left extends Horizontal("left", [0, -1]) {
    orderBy = comparing(
        byIncreasing(Tile.row),
        byIncreasing(Tile.column)
    );
}
