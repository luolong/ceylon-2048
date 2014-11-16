
"""Represents change of a cell position after move"""
shared class Move(cell, to) {

    "Reference to the cell that changes."
    shared Tile cell;

    "New position of the cell after the change."
    shared Position to;

    "Content value of the cell"
    shared Integer content = cell.content;

    "Row number of the new position of the cell after the change."
    shared Integer row => to.row;

    "Column number of the new position of the cell after the change."
    shared Integer column => to.column;

    shared actual String string => "``content`` @ ``cell.position`` -> ``to``";

    shared actual Boolean equals(Object that) {
        if (is Move that) {
            return cell==that.cell
                    && to==that.to;
        }
        return false;
    }
}

shared Move move(Integer content, [Integer, Integer] -> [Integer, Integer] move)
        => Move(Tile(Position(*move.key), content), Position(*move.item));
