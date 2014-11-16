import io.luolong.ceylon2048.model {
    Grid
}

shared alias Score => Integer;

shared class Game(grid, score = 0, mergeStrategy = Classic2048()) {

    shared Grid grid;
    shared Score score;

    MergeStrategy mergeStrategy;

    """Returns a sequence of cell moves in the given direction"""
    shared [Move*] moves(Direction direction) {
        value slider = Slider(direction, mergeStrategy);
        return direction.reorder(grid.tiles)
                        .fold(slider, (Slider it, Tile cell) => it.move(cell))
                        .moves;
    }

    """Applies moves to the grid and returns new game with updated grid and score"""
    shared Game apply([Move*] moves) {
        value orderedMoves = moves.sort {
            function comparing(Move x, Move y) => grid.indexOf(x.to) <=> grid.indexOf(y.to);
        };

        value merger = [for (row in 1..grid.size) for (col in 1..grid.size) [row, col]].fold {
            initial = Merger(orderedMoves);
            function accumulating(Merger merger, [Integer, Integer] position) {
                return merger.mergeTo(Position(*position));
            }
        };

        assert(nonempty state = merger.state);
        return Game(Grid(grid.size, state), merger.score, mergeStrategy);
    }

}
