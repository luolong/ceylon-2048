shared class Classic2048() satisfies MergeStrategy  {
    shared actual Boolean canBeMerged([Tile+] tiles) {
        if (tiles.size == 1) {
            return true;
        }

        if (tiles.size == 2) {
            return canMerge(tiles.first, tiles.last);
        }

        return false;
    }

}