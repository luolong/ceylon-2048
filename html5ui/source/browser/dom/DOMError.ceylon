// Introduced in DOM Level 3:
shared dynamic DOMError {
    shared formal Integer         severity;
    shared formal DOMString       message;
    shared formal DOMString       type;
    shared formal DOMObject       relatedException;
    shared formal DOMObject       relatedData;
    shared formal DOMLocator      location;

}

shared object \iErrorSeverity {
    shared Integer \iSEVERITY_WARNING               = 1;
    shared Integer \iSEVERITY_ERROR                 = 2;
    shared Integer \iSEVERITY_FATAL_ERROR           = 3;
}
