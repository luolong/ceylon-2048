import ceylon.language {
    raises=throws
}

shared dynamic NamedNodeMap {

    shared formal Node? getNamedItem(DOMString name);

    raises(`interface DOMException`)
    shared formal Node? setNamedItem(Node arg);

    raises(`interface DOMException`)
    shared formal Node? removeNamedItem(DOMString name);

    shared formal Node? item(Integer index);

    shared formal Integer length;

    // Introduced in DOM Level 2:
    raises(`interface DOMException`)
    shared formal Node? getNamedItemNS(DOMString namespaceURI, DOMString localName);

    raises(`interface DOMException`)
    shared formal Node? setNamedItemNS(Node arg);

    raises(`interface DOMException`)
    shared formal Node? removeNamedItemNS(DOMString namespaceURI, DOMString localName);
}