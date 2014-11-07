
shared class Position(row, column) satisfies Summable<Position> & Invertible<Position>{

    shared Integer row;
    shared Integer column;

    shared actual String string => "(``row``,``column``)";

    shared actual Position plus(Position other) => Position(row + other.row, column + other.column);

    shared actual Position negated => Position(-row, -column);

    shared actual Boolean equals(Object that) {
        if (is Position that) {
            return row==that.row
                && column==that.column;
        }
        return false;
    }

    shared actual Integer hash {
        variable value hash = 1;
        hash = 31*hash + row.hash;
        hash = 31*hash + column.hash;
        return hash;
    }

}

shared {Position*} positions({[Integer, Integer]*} tuples) => {for (tuple in tuples) Position(*tuple)};