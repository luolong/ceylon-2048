import ceylon.test {
    testSuite
}

testSuite({
    `class PositionTest`,
    `class DirectionTest`,
    `class CellTest`,
    `class GridTest`,
    `class GameTest`
})
void allTestsSuite() {}

testSuite({
    `class SlideLeftTest`,
    `class SlideRightTest`,
    `class SlideUpTest`,
    `class SlideDownTest`
})
void allSlidersSuite() {}

testSuite({`class Classic2048Test`})
void allMergeStrategyTests() {}



