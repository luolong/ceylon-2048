import ceylon.test {
    assertEquals,
    test,
    ignore
}

import io.luolong.ceylon2048.model {
    Position,
    ClassicMergeStrategy,
    Move,
    Slider,
    left,
    Cell,
    right
}

class SlideToLeftTest()  {

    value it = Slider(left, ClassicMergeStrategy());
    value cells = generator(4, left);

    function move(Integer content, [Integer, Integer] -> [Integer, Integer] move)
             => Move(Cell(Position(*move.key), content), Position(*move.item));

    test shared void defaultSliderHasNoMoves() => assertEquals{
        actual = it.moves;
        expected = empty;
    };

    test shared void slidingEmptyCellDoesNotAddMoves() => assertEquals {
        actual = it.move(cells.next(0)).moves;
        expected = empty;
    };

    test shared void slidingFirstCellAddsItAsMove() => assertEquals {
        actual = it.move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1])];
    };

    test shared void slidingSecondCellWithMergeableContentAddsItAsMoveToSamePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 2] -> [1, 1])];
    };

    test shared void slidingUnmergeableContentAddsMoveToNextAvailablePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(2)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 2] -> [1, 2])];
    };

    test shared void slidingThirdCellAddsMoveToNextAvailablePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(1)).move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 2] -> [1, 1]), move(1, [1, 3] -> [1, 2])];
    };

    test shared void onlyNonemptyCellsGenerateMoves() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(2)).move(cells.next(2)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 3] -> [1, 2]), move(2, [1, 4] -> [1, 2])];
    };

    test shared void cellsOnlyMoveOnTheirRow() => assertEquals{
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(0)).move(cells.next(0))
                   .move(cells.next(1))
                   .moves;
        expected = [move(1, [1, 1] -> [1, 1]),
                    move(1, [2, 1] -> [2, 1])];
    };

    test shared void movesEntireBoeardLeft() => assertEquals{
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(1)).move(cells.next(1))
                   .move(cells.next(0)).move(cells.next(1)).move(cells.next(0)).move(cells.next(1))
                   .move(cells.next(1)).move(cells.next(1)).move(cells.next(0)).move(cells.next(0))
                   .move(cells.next(1)).move(cells.next(1)).move(cells.next(1)).move(cells.next(1))
                   .moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 3] -> [1, 1]), move(1, [1, 4] -> [1, 2]),
                    move(1, [2, 2] -> [2, 1]), move(1, [2, 4] -> [2, 1]),
                    move(1, [3, 1] -> [3, 1]), move(1, [3, 2] -> [3, 1]),
                    move(1, [4, 1] -> [4, 1]), move(1, [4, 2] -> [4, 1]), move(1, [4, 3] -> [4, 2]), move(1, [4, 4] -> [4, 2])];
    };

}

class SlideToRightTest()  {

    value it = Slider(right, ClassicMergeStrategy());
    value cells = generator(4, left);

    function move(Integer content, [Integer, Integer] -> [Integer, Integer] move)
            => Move(Cell(Position(*move.key), content), Position(*move.item));

    test shared void slidingFirstCellAddsItAsMove() => assertEquals {
        actual = it.move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1])];
    };

    ignore test shared void slidingSecondCellWithMergeableContentAddsItAsMoveToSamePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [2, 1] -> [1, 1])];
    };

    ignore test shared void slidingUnmergeableContentAddsMoveToNextAvailablePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(2)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 2] -> [1, 2])];
    };

    ignore test shared void slidingThirdCellAddsMoveToNextAvailablePosition() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(1)).move(cells.next(1)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 2] -> [1, 1]), move(1, [1, 3] -> [1, 2])];
    };

    ignore test shared void onlyNonemptyCellsGenerateMoves() => assertEquals {
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(2)).move(cells.next(2)).moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(2, [1, 3] -> [1, 2]), move(2, [1, 4] -> [1, 2])];
    };

    ignore test shared void cellsOnlyMoveOnTheirRow() => assertEquals{
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(0)).move(cells.next(0))
                .move(cells.next(1))
                .moves;
        expected = [move(1, [1, 1] -> [1, 1]),
        move(1, [2, 1] -> [2, 1])];
    };

    ignore test shared void movesEntireBoeardLeft() => assertEquals{
        actual = it.move(cells.next(1)).move(cells.next(0)).move(cells.next(1)).move(cells.next(1))
                .move(cells.next(0)).move(cells.next(1)).move(cells.next(0)).move(cells.next(1))
                .move(cells.next(1)).move(cells.next(1)).move(cells.next(0)).move(cells.next(0))
                .move(cells.next(1)).move(cells.next(1)).move(cells.next(1)).move(cells.next(1))
                .moves;
        expected = [move(1, [1, 1] -> [1, 1]), move(1, [1, 3] -> [1, 1]), move(1, [1, 4] -> [1, 2]),
        move(1, [2, 2] -> [2, 1]), move(1, [2, 4] -> [2, 1]),
        move(1, [3, 1] -> [3, 1]), move(1, [3, 2] -> [3, 1]),
        move(1, [4, 1] -> [4, 1]), move(1, [4, 2] -> [4, 1]), move(1, [4, 3] -> [4, 2]), move(1, [4, 4] -> [4, 2])];
    };

}