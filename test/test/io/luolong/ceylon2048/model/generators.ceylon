import io.luolong.ceylon2048.model {
    Tile,
    Direction,
    Position,
    left,
    right,
    up,
    down
}

interface Generator{
    shared formal Tile next(Integer content);
}

Generator generator(Integer size, Direction direction) {
    function positions(Integer size, Direction direction) {
        switch (direction)
        case (left)  { return {for (row in 1..size) for (col in 1..size) Position(row, col)}; }
        case (right) { return {for (row in 1..size) for (col in size..1) Position(row, col)}; }
        case (up)    { return {for (col in 1..size) for (row in 1..size) Position(row, col)}; }
        case (down)  { return {for (col in 1..size) for (row in size..1) Position(row, col)}; }
    }

    value iterator = positions(size, direction).iterator();
    object gen satisfies Generator{
        shared actual Tile next(Integer content) {
            assert(is Position nextPosition = iterator.next());
            return Tile(nextPosition, content);
        }
    }

    return gen;
}