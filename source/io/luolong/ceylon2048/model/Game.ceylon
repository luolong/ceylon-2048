import io.luolong.ceylon2048.model {
    Board
}

shared class Game(board, mergeStrategy = ClassicMergeStrategy()) {

    variable Board board;
    MergeStrategy mergeStrategy;

    """Returns a sequence of cell moves in the given direction"""
    shared [Move*] moves(Direction direction) {
        value slider = Slider(direction, mergeStrategy);
        return direction.reorder(board.cells)
                        .fold(slider, (Slider it, Cell cell) => it.move(cell))
                        .moves;
    }

    shared void apply([Move*] moves) {

    }
}
