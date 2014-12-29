import ceylon.language {
    raises=throws
}

shared dynamic ProcessingInstruction satisfies Node {

    shared formal DOMString target;

    raises(`interface DOMException`, "on setting")
    shared formal DOMString data;
}