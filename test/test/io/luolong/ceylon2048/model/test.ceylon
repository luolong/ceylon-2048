import ceylon.test {
    testSuite,
    test,
    assertEquals,
    assertTrue,
    assertFalse,
    ignore
}

import io.luolong.ceylon2048.model {
    Slider,
    left,
    Position,
    Cell,
    Move,
    right,
    up,
    down
}

testSuite({
    `class PositionTest`,
    `class DirectionTest`,
    `class CellTest`,
    `class BoardTest`,
    `class GameTest`,
    `class SlideToLeftTest`
})
void allTestsSuite() {}

class DirectionTest() {

    test shared void nextLeftIncreasesColumn() => assertEquals(left.next(Position(1,1)), Position(1,2));
    test shared void nextRightDecreasesColumn() => assertEquals(right.next(Position(1,1)), Position(1,0));
    test shared void nextUpIncreasesRow() => assertEquals(up.next(Position(1,1)), Position(2,1));
    test shared void nextDownDecreasesRow() => assertEquals(down.next(Position(1,1)), Position(0,1));

}

class SlideToLeftTest() {

    value slider = Slider(left, Position(1, 1));

    test shared void defaultSliderHasNoMoves() => assertEquals{
        actual = slider.moves;
        expected = empty;
    };

    test shared void slidingEmptyCellDoesNotAddMoves() => assertEquals(slider.move(Cell(Position(1,1))).moves, empty);

    test shared void slidingFirstCellAddsItAsMove() => assertEquals {
        actual = slider.move(Cell(Position(1, 1), 1)).moves;
        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1))];
    };

    test shared void slidingSecondCellWithMergeableContentAddsItAsMoveToSamePosition() => assertEquals {
        actual = slider.move(Cell(Position(1, 1), 1))
                       .move(Cell(Position(1, 2), 1))
                       .moves;
        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1)),
                    Move(Cell(Position(1, 2), 1), Position(1, 1))];
    };

    test shared void slidingUnmergeableContentAddsMoveToNextAvailablePosition() => assertEquals {
        actual = slider.move(Cell(Position(1, 1), 1))
                       .move(Cell(Position(1, 2), 2)).moves;

        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1)),
                    Move(Cell(Position(1, 2), 2), Position(1, 2))];
    };

    test shared void slidingThirdCellAddsMoveToNextAvailablePosition() => assertEquals {
        actual = slider.move(Cell(Position(1, 1), 1))
                       .move(Cell(Position(1, 2), 1))
                       .move(Cell(Position(1, 3), 1))
                       .moves;
        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1)),
                    Move(Cell(Position(1, 2), 1), Position(1, 1)),
                    Move(Cell(Position(1, 3), 1), Position(1, 2))];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertEquals {
        actual = slider.move(Cell(Position(1, 1), 1))
                       .move(Cell(Position(1, 2), 0))
                       .move(Cell(Position(1, 3), 2))
                       .move(Cell(Position(1, 4), 2))
                       .moves;
        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1)),
                    Move(Cell(Position(1, 3), 2), Position(1, 2)),
                    Move(Cell(Position(1, 4), 2), Position(1, 2))];
    };

    ignore test shared void cellsOnlyMoveOnTheirRow() => assertEquals{
        actual = slider.move(Cell(Position(1, 1), 1))
                       .move(Cell(Position(2, 1), 1))
                       .moves;
        expected = [Move(Cell(Position(1, 1), 1), Position(1, 1)),
                    Move(Cell(Position(2, 1), 1), Position(2, 1))];
    };

    test shared void canMergeOneCell()
            => assertTrue(Slider().canBeMerged(
                    [Cell(Position(1,1), 1)]));

    test shared void canMergeTwoCellsWithSameContent()
            => assertTrue(Slider().canBeMerged(
                    [Cell(Position(1,1), 1),
                     Cell(Position(1,2), 1)]));

    test shared void canNotMergeTwoCellsWithDifferentContent()
            => assertFalse(Slider().canBeMerged(
                    [Cell(Position(1,1), 1),
                     Cell(Position(1,2), 2)]));

    test shared void canNotMergeThreeCells()
            => assertFalse(Slider().canBeMerged(
                    [Cell(Position(1,1), 1),
                     Cell(Position(1,2), 1),
                     Cell(Position(1,3), 1)]));
}

