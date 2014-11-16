
shared class Merger(moves, score = 0, state = [], MergeStrategy strategy = Classic2048()) {
    shared [Move*] moves;

    shared Score score;
    shared [Content*] state;

    shared Merger mergeTo(Position position) {
        if (nonempty moves) {
            function movesToPosition(Move move) => move.to == position;

            value mergedContent = moves.takeWhile(movesToPosition)*.content;
            value scoreAndContent = strategy.merge(mergedContent);
            value rest = moves.skipWhile(movesToPosition);

            return Merger {
                moves = rest.sequence();
                strategy = strategy;
                score = score + scoreAndContent[0];
                state = state.withTrailing(scoreAndContent[1]);
            };
        }

        return Merger([], score, state.withTrailing(0), strategy);
    }

}