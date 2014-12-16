
shared interface MergeStrategy {

    "True if provided tiles can be merged"
    shared formal Boolean canBeMerged([Tile+] cells);

    shared default Boolean canMerge(Tile one, Tile two)
            => one.content == two.content;

    shared default [Score, Content] merge([Content*] content) {
        if (nonempty content) {
            value contentSum = sum(content);
            return [
                content.size > 1 then contentSum else 0,
                contentSum
            ];
        }
        return [0, 0];
    }
}