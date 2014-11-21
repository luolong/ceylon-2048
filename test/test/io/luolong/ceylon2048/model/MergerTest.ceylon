import ceylon.test {
    assertEquals,
    test
}

import info.tepp.ceylon2048.model {
    Merger,
    Position,
    move
}
class MergerTest() {

    test shared void megeToWithEmptyMovesAppendsBlankValue() => assertEquals {
        actual = Merger([]).mergeTo(Position(1,1)).state;
        expected = [0];
    };

    test shared void megeToWithEmptyMovesKeepsScore() => assertEquals {
        actual = Merger([], 10).mergeTo(Position(1,1)).score;
        expected = 10;
    };

    test shared void mergeingSingleMoveAddsContentToState() => assertEquals {
        actual = Merger([move(1, [1,1] -> [1,1])])
                .mergeTo(Position(1,1)).state;
        expected = [1];
    };

    test shared void mergeingSingleMoveKeepsScoreIntact() => assertEquals {
        actual = Merger([move(1, [1,1] -> [1,1])])
                .mergeTo(Position(1,1)).score;
        expected = 0;
    };

    test shared void mergeToRemovesMergedMoves() => assertEquals {
        actual = Merger([move(1, [1,2] -> [1,1]),move(1, [1,3] -> [1,2])])
                .mergeTo(Position(1,1)).moves;
        expected = [move(1, [1,3] -> [1,2])];
    };

    test shared void mergeingTwoCellsAddsContentToState() => assertEquals {
        actual = Merger([move(1, [1,2] -> [1,1]), move(1, [1,3] -> [1,1])])
                .mergeTo(Position(1, 1)).state;
        expected = [2];
    };

    test shared void mergeingTwoCellsAddsToScore() => assertEquals {
        actual = Merger([move(1, [1,2] -> [1,1]), move(1, [1,3] -> [1,1])])
                .mergeTo(Position(1, 1)).score;
        expected = 2;
    };

}