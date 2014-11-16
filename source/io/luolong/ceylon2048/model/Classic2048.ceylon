shared class Classic2048() satisfies MergeStrategy  {
    shared actual Boolean canBeMerged([Tile+] cells) {
        if (cells.size == 1) {
            return true;
        }

        if (cells.size == 2) {
            value content = cells*.content;
            return content.first == content.last;
        }

        return false;
    }
}