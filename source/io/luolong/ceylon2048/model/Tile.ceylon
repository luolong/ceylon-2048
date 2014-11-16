
shared alias Content => Integer;

"""Represents a cell on a board"""
shared class Tile(position, content = 0) extends Object() {

    "Content cannot be negative!"
    assert (content >= 0);

    "Position of a cell on a [[Grid]]."
    shared Position position;

    "Content ov the cell. Default value is `0`, which means _empty_."
    shared Content content;

    "Cell is considered empty, if it's content is `0`."
    shared Boolean empty => content == 0;

    shared Integer row => position.row;
    shared Integer column => position.column;

    shared actual String string => "``content`` @ ``position``";

    shared actual Boolean equals(Object that) {
        if (is Tile that) {
            return content==that.content
                && position==that.position;
        }
        return false;
    }
    shared actual Integer hash {
        variable value hash = 1;
        hash = 31*hash + position.hash;
        hash = 31*hash + content.hash;
        return hash;
    }
}
