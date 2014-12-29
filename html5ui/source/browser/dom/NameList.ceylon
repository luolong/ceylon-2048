// Introduced in DOM Level 3:
"The `NameList` interface provides the abstraction of an ordered collection of parallel
 pairs of name and namespace values (which could be `null` values), without defining or
 constraining how this collection is implemented. The items in the `NameList` are accessible
 via an integral index, starting from 0."
shared dynamic NameList {
    "Returns the `index`th name item in the collection."
    shared formal DOMString? getName(
            "Index into the collection."
            Integer index);

    "Returns the `index`th namespaceURI item in the collection."
    shared formal DOMString? getNamespaceURI(
            "Index into the collection."
            Integer index);

    "The number of pairs (name and namespaceURI) in the list.
     The range of valid child node indices is `0` to `length-1` inclusive."
    shared formal Integer length;

    "Test if a name is part of this `NameList`."
    shared formal Boolean contains(
            "The name to look for."
            DOMString str);

    "Test if the pair namespaceURI/name is part of this `NameList`."
    shared formal Boolean containsNS(
            "The namespace URI to look for."
            DOMString namespaceURI,
            "The name to look for."
            DOMString name);
}
