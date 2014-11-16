
shared interface MergeStrategy {

    shared formal Boolean canBeMerged([Tile+] cells);

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