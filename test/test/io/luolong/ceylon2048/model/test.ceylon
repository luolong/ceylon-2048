import ceylon.test {
    testSuite
}

testSuite({
    `class PositionTest`,
    `class DirectionTest`,
    `class CellTest`,
    `class BoardTest`,
    `class GameTest`
})
void allTestsSuite() {}

testSuite({
    `class SlideToLeftTest`,
    `class SlideToRightTest`
})
void allSlidersSuite() {}

testSuite({`class ClassicMergeStrategyTest`})
void allMergeStrategyTests() {}



