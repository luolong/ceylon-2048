import ceylon.language {
    raises=throws
}

shared dynamic Text satisfies CharacterData {
    raises(`interface DOMException`)
    shared formal Text splitText(Integer offset);

    // Introduced in DOM Level 3:
    shared formal Boolean isElementContentWhitespace;
    shared formal DOMString wholeText;

    raises(`interface DOMException`)
    shared formal Text replaceWholeText(DOMString content);
}