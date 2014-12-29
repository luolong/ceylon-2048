import ceylon.language {
    raises=throws
}

shared dynamic CharacterData satisfies Node {
    shared formal DOMString data;
    shared formal Integer length;

    raises (`interface DOMException`)
    shared formal DOMString bstringData(
        Integer offset,
        Integer count);

    raises (`interface DOMException`)
    shared formal void appendData(DOMString arg);

    raises (`interface DOMException`)
    shared formal void insertData(
        Integer offset,
        DOMString arg);

    raises (`interface DOMException`)
    shared formal void deleteData(
        Integer offset,
        Integer count);

    raises (`interface DOMException`)
    shared formal void replaceData(
        Integer offset,
        Integer count,
        DOMString arg);
}
