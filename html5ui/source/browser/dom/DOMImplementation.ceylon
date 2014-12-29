shared dynamic DOMImplementation {
    shared formal Boolean hasFeature(
        DOMString feature,
        DOMString version);

    // Introduced in DOM Level 2:
    throws(`interface DOMException`)
    shared formal DocumentType createDocumentType(
        DOMString qualifiedName,
        DOMString publicId,
        DOMString systemId);

    // Introduced in DOM Level 2:
    throws(`interface DOMException`)
    shared formal Document createDocument(
        DOMString? namespaceURI,
        DOMString? qualifiedName,
        DocumentType? doctype);

    // Introduced in DOM Level 3:
    shared formal DOMObject getFeature(
        DOMString feature,
        DOMString version);
}
