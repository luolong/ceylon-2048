import ceylon.language {
    raises=throws
}

shared dynamic Attr satisfies Node {

    shared formal DOMString name;

    shared formal Boolean specified;

    raises(`interface DOMException`, "on setting")
    shared formal DOMString \ivalue;

    // Introduced in DOM Level 2:
    shared formal Element ownerElement;

    // Introduced in DOM Level 3:
    shared formal TypeInfo schemaTypeInfo;

    // Introduced in DOM Level 3:
    shared formal Boolean isId;
}