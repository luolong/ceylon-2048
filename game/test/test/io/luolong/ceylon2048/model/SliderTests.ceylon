import ceylon.test {
    assertEquals,
    test
}

import info.tepp.ceylon2048.model {
    Classic2048,
    Move,
    Slider,
    left,
    right,
    Direction,
    MergeStrategy,
    up,
    down,
    move
}

abstract class SlideTestBase(Direction direction, MergeStrategy strategy = Classic2048(), Integer size = 4)  {

    Slider it = Slider(direction, strategy);
    Generator cells = generator(size, direction);

    function play(Integer[] content) => content.fold(it)
            ((Slider it, Integer content) => it.move(cells.next(content)));

    shared void assertMove(Integer[] input, [Move*] expected) => assertEquals{
        actual = play(input).moves;
        expected = expected;
    };

    test shared void initialSliderHasNoMoves() => assertEquals{
        actual = it.moves;
        expected = empty;
    };

    test shared void emptyCellDoesNotAddMoves() => assertEquals {
        actual = it.move(cells.next(0)).moves;
        expected = empty;
    };

}

class SlideLeftTest() extends SlideTestBase(left) {
    test shared void cellWithContentCreatesAMove() => assertMove {
        input    = [1];
        expected = [move(1, [1, 1] -> [1, 1])];
    };

    test shared void mergeableCellMovesToSamePosition() => assertMove {
        input    = [1, 1];
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 2] -> [1, 1])];
    };

    test shared void unmergeableCellMovesToNextPosition() => assertMove {
        input    = [1, 2];
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 2] -> [1, 2])];
    };

    test shared void thirdCellMovesToNextPosition() => assertMove {
        input    = [1, 1, 1];
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 2] -> [1, 1]), move(1, [1, 3] -> [1, 2])];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertMove {
        input    = [1, 0, 2, 4];
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 3] -> [1, 2]), move(4, [1, 4] -> [1, 3])];
    };

    test shared void cellsMoveOnSameRow() => assertMove {
        input    = [1, 0, 0, 0,
                    0, 1];
        expected = [move(1, [1, 1] -> [1, 1]),
                    move(1, [2, 2] -> [2, 1])];
    };

    test shared void moveEntireBoardLeft() => assertMove {
        input    = [1, 0, 1, 1,
                    0, 1, 0, 1,
                    1, 1, 0, 0,
                    1, 1, 1, 1];
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 3] -> [1, 1]), move(1, [1, 4] -> [1, 2]),
                    move(1, [2, 2] -> [2, 1]), move(1, [2, 4] -> [2, 1]),
                    move(1, [3, 1] -> [3, 1]), move(1, [3, 2] -> [3, 1]),
                    move(1, [4, 1] -> [4, 1]), move(1, [4, 2] -> [4, 1]), move(1, [4, 3] -> [4, 2]), move(1, [4, 4] -> [4, 2])];
    };
}

class SlideRightTest() extends SlideTestBase(right) {
    test shared void cellWithContentCreatesAMove() => assertMove {
        input    = [1];
        expected = [move(1, [1, 4] -> [1, 4])];
    };

    test shared void mergeableCellMovesToSamePosition() => assertMove {
        input    = [1, 1];
        expected = [move(1, [1, 4] -> [1, 4]), move(1, [1, 3] -> [1, 4])];
    };

    test shared void unmergeableCellMovesToNextPosition() => assertMove {
        input    = [1, 2];
        expected = [move(1, [1, 4] -> [1, 4]), move(2, [1, 3] -> [1, 3])];
    };

    test shared void thirdCellMovesToNextPosition() => assertMove {
        input    = [1, 1, 1];
        expected = [move(1, [1, 4] -> [1, 4]), move(1, [1, 3] -> [1, 4]), move(1, [1, 2] -> [1, 3])];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertMove {
        input    = [1, 0, 2, 4];
        expected = [move(1, [1, 4] -> [1, 4]), move(2, [1, 2] -> [1, 3]), move(4, [1, 1] -> [1, 2])];
    };

    test shared void cellsMoveOnSameRow() => assertMove {
        input    = [1, 0, 0, 0,
                    0, 1];
        expected = [move(1, [1, 4] -> [1, 4]),
                    move(1, [2, 3] -> [2, 4])];
    };

    test shared void moveEntireBoardLeft() => assertMove {
        input    = [1, 0, 1, 1,
                    0, 1, 0, 1,
                    1, 1, 0, 0,
                    1, 1, 1, 1];
        expected = [move(1, [1, 4] -> [1, 4]), move(1, [1, 2] -> [1, 4]), move(1, [1, 1] -> [1, 3]),
                    move(1, [2, 3] -> [2, 4]), move(1, [2, 1] -> [2, 4]),
                    move(1, [3, 4] -> [3, 4]), move(1, [3, 3] -> [3, 4]),
                    move(1, [4, 4] -> [4, 4]), move(1, [4, 3] -> [4, 4]), move(1, [4, 2] -> [4, 3]), move(1, [4, 1] -> [4, 3])];
    };
}

class SlideUpTest() extends SlideTestBase(up) {
    test shared void cellWithContentCreatesAMove() => assertMove {
        input    = [1];
        expected = [move(1, [1, 1] -> [1, 1])];
    };

    test shared void mergeableCellMovesToSamePosition() => assertMove {
        input    = [1, 1];
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [2, 1] -> [1, 1])];
    };

    test shared void unmergeableCellMovesToNextPosition() => assertMove {
        input    = [1, 2];
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [2, 1] -> [2, 1])];
    };

    test shared void thirdCellMovesToNextPosition() => assertMove {
        input    = [1, 1, 1];
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [2, 1] -> [1, 1]), move(1, [3, 1] -> [2, 1])];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertMove {
        input    = [1, 0, 2, 4];
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [3, 1] -> [2, 1]), move(4, [4, 1] -> [3, 1])];
    };

    test shared void cellsMoveOnSameRow() => assertMove {
        input    = [
            1, 0, 0, 0,
            0, 1
        ];

        expected = [
            move(1, [1, 1] -> [1, 1]),
            move(1, [2, 2] -> [1, 2])
        ];
    };

    test shared void moveEntireBoardLeft() => assertMove {
        input = [
            1, 0, 1, 1,
            0, 1, 0, 1,
            1, 1, 0, 0,
            1, 1, 1, 1
        ];

        expected = [
            move(1, [1, 1] -> [1, 1]),
            move(1, [3, 1] -> [1, 1]),
            move(1, [4, 1] -> [2, 1]),

            move(1, [2, 2] -> [1, 2]),
            move(1, [4, 2] -> [1, 2]),

            move(1, [1, 3] -> [1, 3]),
            move(1, [2, 3] -> [1, 3]),

            move(1, [1, 4] -> [1, 4]),
            move(1, [2, 4] -> [1, 4]),
            move(1, [3, 4] -> [2, 4]),
            move(1, [4, 4] -> [2, 4])
        ];
    };
}

class SlideDownTest() extends SlideTestBase(down) {
    test shared void cellWithContentCreatesAMove() => assertMove {
        input    = [1];
        expected = [move(1, [4, 1] -> [4, 1])];
    };

    test shared void mergeableCellMovesToSamePosition() => assertMove {
        input    = [1, 1];
        expected = [move(1, [4, 1] -> [4, 1]), move(1, [3, 1] -> [4, 1])];
    };

    test shared void unmergeableCellMovesToNextPosition() => assertMove {
        input    = [1, 2];
        expected = [move(1, [4, 1] -> [4, 1]), move(2, [3, 1] -> [3, 1])];
    };

    test shared void thirdCellMovesToNextPosition() => assertMove {
        input    = [1, 1, 1];
        expected = [move(1, [4, 1] -> [4, 1]), move(1, [3, 1] -> [4, 1]), move(1, [2, 1] -> [3, 1])];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertMove {
        input    = [1, 0, 2, 4];
        expected = [move(1, [4, 1] -> [4, 1]), move(2, [2, 1] -> [3, 1]), move(4, [1, 1] -> [2, 1])];
    };

    test shared void cellsMoveOnSameRow() => assertMove {
        input = [
            1, 0, 0, 0,
            0, 1
        ];

        expected = [
            move(1, [4, 1] -> [4, 1]),
            move(1, [3, 2] -> [4, 2])
        ];
    };

    test shared void moveEntireBoardLeft() => assertMove {
        input = [
            1, 0, 1, 1,
            0, 1, 0, 1,
            1, 1, 0, 0,
            1, 1, 1, 1
        ];

        expected = [
            move(1, [4, 1] -> [4, 1]),
            move(1, [2, 1] -> [4, 1]),
            move(1, [1, 1] -> [3, 1]),

            move(1, [3, 2] -> [4, 2]),
            move(1, [1, 2] -> [4, 2]),

            move(1, [4, 3] -> [4, 3]),
            move(1, [3, 3] -> [4, 3]),

            move(1, [4, 4] -> [4, 4]),
            move(1, [3, 4] -> [4, 4]),
            move(1, [2, 4] -> [3, 4]),
            move(1, [1, 4] -> [3, 4])
        ];
    };
}
