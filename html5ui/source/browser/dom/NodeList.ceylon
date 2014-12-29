"The `NodeList` interface provides the abstraction of an ordered collection of nodes,
 without defining or constraining how this collection is implemented. `NodeList` objects
 in the DOM are [live](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#td-live).

 The items in the `NodeList` are accessible via an integral index, starting from 0."
shared dynamic NodeList {

    "Returns the `index`th item in the collection.
     If index is greater than or equal to the number of nodes in the list, this returns `null`."
    shared formal Node? item(
            "Index into the collection."
            Integer index);

    "The number of nodes in the list.
     The range of valid child node indices is `0` to `length-1` inclusive."
    shared formal Integer length;
}
