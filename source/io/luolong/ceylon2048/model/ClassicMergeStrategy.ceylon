shared class ClassicMergeStrategy() satisfies MergeStrategy  {
    shared actual Boolean canBeMerged([Cell+] cells) {
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