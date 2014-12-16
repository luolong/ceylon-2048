import info.tepp.ceylon2048.model {
    Grid
}

shared alias Score => Integer;

shared class Game(grid, score = 0, mergeStrategy = Classic2048()) {

    shared Grid grid;
    shared Score score;

    MergeStrategy mergeStrategy;

    """Sequence of available positions"""
    shared [Position*] available => grid.available*.position;

    """Returns a sequence of cell moves in the given direction"""
    shared Moves moves(Direction direction) {
        value slider = Slider(direction, mergeStrategy);
        return direction.reorder(grid.tiles)
                        .fold(slider)((Slider it, Tile cell) => it.move(cell))
                        .moves;
    }

    """Applies moves to the grid and returns new game with updated grid and score"""
    shared Game apply(Moves moves) {

        "Can not apply moves if game is over"
        assert(!over);

        value orderedMoves = moves.sort {
            function comparing(Move x, Move y) => grid.indexOf(x.to) <=> grid.indexOf(y.to);
        };

        value merger = [for (row in 1..grid.size) for (col in 1..grid.size) [row, col]].fold(Merger(orderedMoves))(
            (Merger merger, [Integer, Integer] position) => merger.mergeTo(Position(*position))
        );

        assert(nonempty state = merger.state);
        return Game(Grid(grid.size, state), merger.score, mergeStrategy);
    }

    "Puts a tile on an available position in the grid"
    shared Game put(Tile tile) {

        "Tile must point to an available grid position"
        assert(grid.tileAt(tile.position).empty);

        value state = grid.tiles.map {
            function collecting(Tile element) {
                if (element.position == tile.position) {
                    return tile;
                }
                return element;
            }
        }*.content;

        return Game(Grid(grid.size, state), score, mergeStrategy);
    }

    """Game is over when there are no more available tiles on the grid and
       no more moves to clear up the
       """
    shared Boolean over {
        if (grid.available.empty) {
            function canMerge(Position position)(Direction direction) {
                value next = direction.next(position);
                if (next.row > grid.size || next.column > grid.size) {
                    return false;
                }

                return mergeStrategy.canMerge {
                    one = grid.tileAt(position);
                    two = grid.tileAt(next);
                };
            }

            for (row in 1..grid.size) {
                for (column in 1..grid.size) {
                    value merges = canMerge(Position(row, column));
                    if (merges(right) || merges(down)) {
                        return false;
                    }
                }
            }

            return true;
        }

        return false;
    }
}
