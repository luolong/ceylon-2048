import browser.dom {
    Document,
    Node,
    DOMImplementation,
    DOMString,
    NodeList
}

void printDom(String message, NodeList|Node|DOMImplementation|DOMString|Null|Boolean obj) {
    dynamic { console.log( message, obj ); }
}

void printDocument(Document document) {
    printDom("document.doctype", document.doctype);
    printDom("document.documentElement", document.documentElement);
    printDom("document.implementation", document.implementation);
    //deprecated api: printDom("document.inputEncoding", document.inputEncoding); //deprecated api
    //printDom("document.xmlEncoding", document.xmlEncoding); // not supported in all browsers
    //printDom("document.xmlStandalone", document.xmlStandalone);
    //printDom("document.xmlVersion", document.xmlVersion);
    //printDom("document.strictErrorChecking", document.strictErrorChecking);
    printDom("document.documentURI", document.documentURI);

    printDom("document.getElementsByTagName(\"div\")", document.getElementsByTagName("div"));
    //for (element in document.getElementsByTagName("div")) {
    //    printDom("document.getElementsByTagName(\"div\")...", element);
    //}
}

Document getDocument() {
    dynamic { return document; }
}

shared void test() {
    printDocument(getDocument());
}