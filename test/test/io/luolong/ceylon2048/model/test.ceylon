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
    `class SlideLeftTest`,
    `class SlideRightTest`
})
void allSlidersSuite() {}

testSuite({`class ClassicMergeStrategyTest`})
void allMergeStrategyTests() {}



