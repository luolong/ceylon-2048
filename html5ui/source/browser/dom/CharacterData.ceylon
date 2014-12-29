
"The `CharacterData` interface extends [[Node]] with a set of attributes and methods for
 accessing character data in the DOM. For clarity this set is defined here rather than on
 each object that uses these attributes and methods. No DOM objects correspond directly to
 `CharacterData`, though [[Text]] and others do inherit the interface from it. All offsets
 in this interface start from `0`.

 As explained in the [[DOMString]] interface, text strings in the DOM are represented in UTF-16,
 i.e. as a sequence of 16-bit units. In the following, the term 16-bit units is used whenever
 necessary to indicate that indexing on `CharacterData` is done in 16-bit units."
shared dynamic CharacterData satisfies Node {

    "The character data of the node that implements this interface.
     The DOM implementation may not put arbitrary limits on the amount of data that may be stored
     in a `CharacterData` node. However, implementation limits may mean that the entirety of a
     node's data may not fit into a single [[DOMString]]. In such cases, the user may call
     `substringData` to retrieve the data in appropriately sized pieces."
    throws (`interface DOMException`,
            """**Exceptions on setting**

               `NO_MODIFICATION_ALLOWED_ERR`: Raised when the node is readonly.

               **Exceptions on retrieval**

               `DOMSTRING_SIZE_ERR`: Raised when it would return more characters than
               fit in a [[DOMString]] variable on the implementation platform.
               """)
    shared formal variable DOMString data;

    "The number of 16-bit units that are available through data and the
     `substringData` method below. This may have the value zero, i.e., `CharacterData`
     nodes may be empty."
    shared formal Integer length;

    "Extracts a range of data from the node."
    throws (`interface DOMException`,
            "`INDEX_SIZE_ERR`: Raised if the specified offset is negative or greater than the
             number of 16-bit units in data, or if the specified count is negative.

             `DOMSTRING_SIZE_ERR`: Raised if the specified range of text does not fit into
             a [[DOMString]].
             ")
    shared formal DOMString substringData(
                "Start offset of substring to extract."
                Integer offset,
                "The number of 16-bit units to extract."
                Integer count);

    "Append the string to the end of the character data of the node.
     Upon success, data provides access to the concatenation of data
     and the [[DOMString]] specified."
    throws (`interface DOMException`,
            "`NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.")
    shared formal void appendData(
                "The [[DOMString]] to append."
                DOMString arg);

    "Insert a string at the specified 16-bit unit offset."
    throws (`interface DOMException`,
            "`INDEX_SIZE_ERR`: Raised if the specified offset is negative or greater
             than the number of 16-bit units in data.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.")
    shared formal void insertData(
                "The character offset at which to insert."
                Integer offset,
                "The DOMString to insert."
                DOMString arg);

    "Remove a range of 16-bit units from the node. Upon success, data and length reflect the change."
    throws (`interface DOMException`,
            "`INDEX_SIZE_ERR`: Raised if the specified offset is negative or greater than the number
             of 16-bit units in data, or if the specified count is negative.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.")
    shared formal void deleteData(
                "The offset from which to start removing."
                Integer offset,
                "The number of 16-bit units to delete.
                 If the sum of offset and count exceeds length then all 16-bit units from
                 offset to the end of the data are deleted."
                Integer count);

    "Replace the characters starting at the specified 16-bit unit offset with the specified string."
    throws (`interface DOMException`,
            "`INDEX_SIZE_ERR`: Raised if the specified offset is negative or greater than the
             number of 16-bit units in data, or if the specified count is negative.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.")
    shared formal void replaceData(
                "The offset from which to start replacing."
                Integer offset,
                "The number of 16-bit units to replace. If the sum of offset and count exceeds length, then all 16-bit units to the end of the data are replaced; (i.e., the effect is the same as a remove method call with the same range, followed by an append method invocation)."
                Integer count,
                "The [[DOMString]] with which the range must be replaced."
                DOMString arg);
}
