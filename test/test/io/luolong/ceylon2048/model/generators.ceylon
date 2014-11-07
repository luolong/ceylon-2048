import io.luolong.ceylon2048.model {
    Cell,
    Direction,
    Position
}

interface Generator{
    shared formal Cell next(Integer content);
}

Generator generator(Integer size, Direction direction) {
    value positions = {for (row in 1..size) for (col in 1..size) Position(row, col)}.iterator();

    object gen satisfies Generator{
        shared actual Cell next(Integer content) {
            assert(is Position nextPosition = positions.next());
            return Cell(nextPosition, content);
        }
    }

    return gen;
}