// Introduced in DOM Level 3:
"The `DOMImplementationList` interface provides the abstraction of an ordered collection of
 DOM implementations, without defining or constraining how this collection is implemented.
 The items in the `DOMImplementationList` are accessible via an integral index, starting from `0`."
shared dynamic DOMImplementationList {

    "Returns the `index`th item in the collection.
     If index is greater than or equal to the number of [[DOMImplementations|DOMImplementation]]
     in the list, this returns `null`."
    shared formal DOMImplementation? item(Integer index);

    "The number of [[DOMImplementations|DOMImplementation]] in the list.
     The range of valid child node indices is `0` to `length-1` inclusive."
    shared formal Integer length;
}
