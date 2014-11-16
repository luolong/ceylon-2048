import io.luolong.ceylon2048.model {
    Grid
}

shared alias Score => Integer;

shared class Game(board, score = 0, mergeStrategy = Classic2048()) {

    variable Grid board;
    variable Score score;

    MergeStrategy mergeStrategy;

    """Returns a sequence of cell moves in the given direction"""
    shared [Move*] moves(Direction direction) {
        value slider = Slider(direction, mergeStrategy);
        return direction.reorder(board.cells)
                        .fold(slider, (Slider it, Tile cell) => it.move(cell))
                        .moves;
    }

    shared void apply([Move*] moves) {

    }
}
