
shared class Slider(direction, MergeStrategy strategy, position = Position(0, 0), moves = empty) {


    """Direction of the slide"""
    shared Direction direction;

    """Accumulated (potentially empty) sequence of moves"""
    shared Move[] moves;

    """New position of a cell after moving it."""
    shared Position position;

    value canBeMerged = strategy.canBeMerged;
    function next(Position position, Move[] moves) => Slider(direction, strategy, position, moves);

    """Generates a move for a cell with a content."""
    shared Slider move(Cell cell) {
        if (newLane(cell)) {
            return next(cell.position, moves).move(cell);
        }

        if (cell.empty) {
            return this;
        }

        value movesToPosition = [*moves.reversed.takeWhile((Move move) => move.to == this.position)].reversed;

        value canMerge = canBeMerged(movesToPosition*.cell.withTrailing(cell));
        value nextPosition = canMerge then this.position else direction.next(this.position);

        return next(nextPosition, moves.withTrailing(Move(cell, nextPosition)));
    }

    "True if the position is on the next lane compared to the direction of the slide."
    shared Boolean newLane(Cell cell) {
        switch (direction)
        case (is Vertical) { return position.column != cell.position.column; }
        case (is Horizontal) { return position.row != cell.position.row; }
    }
}
