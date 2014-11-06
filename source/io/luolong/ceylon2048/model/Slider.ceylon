
shared class Slider(direction = left, position = Position(1, 1), moves = empty) {

    shared Direction direction;

    """Accumulated (potentially empty) sequence of moves"""
    shared Move[] moves;

    """New position of a cell after moving it."""
    shared Position position;

    """Generates a move for a cell with a content."""
    shared Slider move(Cell cell) {
        if (cell.empty) {
            return this;
        }

        if (newLane(cell)) {
            return Slider(direction, cell.position, moves).move(cell);
        }

        value movesToPosition = [*moves.reversed.takeWhile((Move move) => move.to == this.position)].reversed;

        value canMerge = canBeMerged(movesToPosition*.cell.withTrailing(cell));
        value nextPosition = canMerge then this.position else direction.next(this.position);

        return Slider(direction, nextPosition, moves.withTrailing(Move(cell, nextPosition)));
    }

    "True if the position is on the next lane compared to the direction of the slide."
    shared Boolean newLane(Cell cell) {
        switch (direction)
        case (is Vertical) { return position.column != cell.position.column; }
        case (is Horizontal) { return position.row != cell.position.row; }
    }

    "True if sequence of cells can be merged into one"
    shared Boolean canBeMerged([Cell+] cells) {
        if (cells.size == 1) {
            return true;
        }

        if (cells.size == 2) {
            value content = cells*.content;
            return content.first == content.last;
        }

        return false;
    }
}