"""Slider of tiles that accumulates moves for the game."""
shared class Slider(direction, MergeStrategy strategy, position = Position(0, 0), moves = empty) {

    """Direction of the slide"""
    shared Direction direction;

    """Accumulated (potentially empty) sequence of moves"""
    shared Move[] moves;

    """New position of a cell after moving it."""
    shared Position position;

    "True if the position is on the next lane compared to the direction of the slide."
    value newLane = not(direction.sameLane(position));

    value canBeMerged = strategy.canBeMerged;
    function next(Position position, Move[] moves) => Slider(direction, strategy, position, moves);

    """Slides the cell, potentially generating a [[Move]]"""
    shared Slider slide(Tile cell) {
        if (newLane(cell.position)) {
            return next(cell.position, moves).slide(cell);
        }

        if (cell.empty) {
            return this;
        }

        value movesToPosition = [*moves.reversed.takeWhile((Move move) => move.to == this.position)].reversed;

        value canMerge = canBeMerged(movesToPosition*.cell.withTrailing(cell));
        value nextPosition = canMerge then this.position else direction.previous(this.position);

        return next(nextPosition, moves.withTrailing(Move(cell, nextPosition)));
    }

}
