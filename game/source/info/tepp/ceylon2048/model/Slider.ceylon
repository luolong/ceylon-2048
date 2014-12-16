"Slider of tiles that accumulates moves for the game."
shared class Slider(direction, MergeStrategy strategy, position = Position(0, 0), moves = empty) {

    "Direction of the slide"
    shared Direction direction;

    "Accumulated (potentially empty) sequence of moves"
    shared Move[] moves;

    "New position of a cell after sliding it."
    shared Position position;

    "True if the position is on the next lane compared to the direction of the slide."
    value newLane = not(direction.sameLane(position));

    "True if provided tiles can be merged"
    value canBeMerged = strategy.canBeMerged;

    "Construct next instance of this Slider with new position and moves."
    function next(Position position, Move[] moves)
             => Slider(direction, strategy, position, moves);

    "Slides the tile in the direction of this slider, potentially
     accumulating a [[Move]].

     This method assumes that tiles are fed to the slider in the particular order
     based on the direction of the slider.
     "
    shared Slider slide(Tile tile) {
        if (newLane(tile.position)) {
            return next(tile.position, moves).slide(tile);
        }

        if (tile.empty) {
            return this;
        }

        value movesToPosition = [*moves.reversed.takeWhile((Move move) => move.to == this.position)].reversed;

        value canMerge = canBeMerged(movesToPosition*.cell.withTrailing(tile));
        value nextPosition = canMerge then this.position else direction.previous(this.position);

        return next(nextPosition, moves.withTrailing(Move(tile, nextPosition)));
    }

}
