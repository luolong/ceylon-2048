// Introduced in DOM Level 3:
"The `DOMStringList` interface provides the abstraction of an ordered collection of
 [[DOMString]] values, without defining or constraining how this collection is implemented.
 The items in the `DOMStringList` are accessible via an integral index, starting from `0`."
shared dynamic DOMStringList {

    "Returns the `index`th item in the collection.
     If index is greater than or equal to the number of [[DOMStrings|DOMString]] in the list,
     this returns `null`."
    shared formal DOMString? item(Integer index);

    "The number of [[DOMStrings|DOMString]] in the list.
     The range of valid child node indices is `0` to `length-1` inclusive."
    shared formal Integer length;

    "Test if a string is part of this [[DOMStringList]]."
    shared formal Boolean contains(DOMString str);
}