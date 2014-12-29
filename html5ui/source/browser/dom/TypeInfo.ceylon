// Introduced in DOM Level 3:
shared dynamic TypeInfo {
    shared formal DOMString typeName;
    shared formal DOMString typeNamespace;

    shared formal Boolean isDerivedFrom(
        DOMString typeNamespaceArg,
        DOMString typeNameArg,
        Integer derivationMethod);
}

shared object derivationMethod {
    // DerivationMethods
    shared Integer \iDERIVATION_RESTRICTION = #00000001;
    shared Integer \iDERIVATION_EXTENSION   = #00000002;
    shared Integer \iDERIVATION_UNION       = #00000004;
    shared Integer \iDERIVATION_LIST        = #00000008;
}
