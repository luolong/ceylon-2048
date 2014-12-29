
"Objects implementing the `NamedNodeMap` interface are used to represent collections
 of nodes that can be accessed by name. Note that `NamedNodeMap` does not inherit from
 `NodeList`; `NamedNodeMaps` are not maintained in any particular order. Objects contained
 in an object implementing `NamedNodeMap` may also be accessed by an ordinal index, but
 this is simply to allow convenient enumeration of the contents of a `NamedNodeMap`, and
 does not imply that the DOM specifies an order to these [[Nodes|Node]].

 `NamedNodeMap` objects in the DOM are [live]
 (http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#td-live)."
shared dynamic NamedNodeMap {

    "Retrieves a node specified by name.

     Returns a [[Node]] (of any type) with the specified `nodeName`, or `null` if it
     does not identify any node in this map."
    shared formal Node? getNamedItem(
            "The nodeName of a node to retrieve."
            DOMString name);

    """Adds a node using its `nodeName` attribute. If a node with that name is already
       present in this map, it is replaced by the new one. Replacing a node by itself
       has no effect.

       As the `nodeName` attribute is used to derive the name which the node must be
       stored under, multiple nodes of certain types (those that have a "special" string
       value) cannot be stored as the names would clash. This is seen as preferable to
       allowing nodes to be aliased.
       """
    throws(`interface DOMException`,
            "`WRONG_DOCUMENT_ERR`: Raised if arg was created from a different document than
             the one that created this map.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this map is readonly.

             `INUSE_ATTRIBUTE_ERR`: Raised if arg is an Attr that is already an attribute of
             another [[Element]] object. The DOM user must explicitly clone [[Attr]] nodes to
             re-use them in other elements.

             `HIERARCHY_REQUEST_ERR`: Raised if an attempt is made to add a node doesn't belong
             in this `NamedNodeMap`. Examples would include trying to insert something other than
             an [[Attr]] node into an [[Element]]'s map of attributes, or a non-Entity node into
             the [[DocumentType]]'s map of [[Entities|Entity]].
             ")
    shared formal Node? setNamedItem(
                "A node to store in this map.
                 The node will later be accessible using the value of its `nodeName` attribute."
                Node arg);

    "Removes a node specified by name.
     When this map contains the attributes attached to an element, if the removed attribute is
     known to have a default value, an attribute immediately appears containing the default value
     as well as the corresponding namespace URI, local name, and prefix when applicable."
    throws(`interface DOMException`,
            "`NOT_FOUND_ERR`: Raised if there is no node named name in this map.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this map is readonly.")
    shared formal Node? removeNamedItem(
                "The `nodeName` of the node to remove."
                DOMString name);

    "Returns the `index`th item in the map.
     If index is greater than or equal to the number of nodes in this map, this returns `null`."
    shared formal Node? item(
                "Index into this map."
                Integer index);

    "The number of nodes in this map.
     The range of valid child node indices is `0` to `length-1` inclusive."
    shared formal Integer length;

    // Introduced in DOM Level 2:
    """Retrieves a node specified by local name and namespace URI.

       Per \[[XML Namespaces]\], applications must use the value `null`
       as the `namespaceURI` parameter for methods if they wish to have
       no namespace.

       Resurns a [[Node]] (of any type) with the specified local name and namespace URI,
       or `null` if they do not identify any node in this map.

       [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces"""
    throws(`interface DOMException`,
            """`NOT_SUPPORTED_ERR`: May be raised if the implementation does not support the
               feature `"XML"` and the language exposed through the Document does not support
               XML Namespaces (such as \[[HTML 4.01]\).
               [HTML 4.01]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#HTML40""")
    shared formal Node? getNamedItemNS(
                "The namespace URI of the node to retrieve."
                DOMString namespaceURI,
                "The local name of the node to retrieve."
                DOMString localName);

    """Adds a node using its `namespaceURI` and `localName`.
       If a node with that namespace URI and that local name is already present in this map,
       it is replaced by the new one. Replacing a node by itself has no effect.

       Per \[[XML Namespaces]\], applications must use the value `null` as the `namespaceURI`
       parameter for methods if they wish to have no namespace.

       [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces"""
    throws(`interface DOMException`,
        """`WRONG_DOCUMENT_ERR`: Raised if arg was created from a different document than the one
           that created this map.

           `NO_MODIFICATION_ALLOWED_ERR`: Raised if this map is readonly.

           `INUSE_ATTRIBUTE_ERR`: Raised if arg is an [[Attr]] that is already an attribute of
           another [[Element]] object. The DOM user must explicitly clone [[Attr]] nodes to re-use
           them in other elements.

           `HIERARCHY_REQUEST_ERR`: Raised if an attempt is made to add a node doesn't belong in
           this `NamedNodeMap`. Examples would include trying to insert something other than an
           Attr node into an Element's map of attributes, or a non-Entity node into the
           DocumentType's map of Entities.

           `NOT_SUPPORTED_ERR`: May be raised if the implementation does not support the feature
           "XML" and the language exposed through the Document does not support XML Namespaces
           (such as [HTML 4.01]).
           """)
    shared formal Node? setNamedItemNS(
            "A node to store in this map.
             The node will later be accessible using the value of its `namespaceURI` and `localName`
             attributes."
            Node arg);

    """Removes a node specified by local name and namespace URI.
       A removed attribute may be known to have a default value when this map contains the
       attributes attached to an element, as returned by the attributes attribute of the
       [[Node]] interface. If so, an attribute immediately appears containing the default
       value as well as the corresponding namespace URI, local name, and prefix when applicable.

       Per \[[XML Namespaces]\], applications must use the value `null` as the `namespaceURI`
       parameter for methods if they wish to have no namespace.
       """
    throws(`interface DOMException`,
        """`NOT_FOUND_ERR`: Raised if there is no node with the specified `namespaceURI` and
           `localName` in this map.

           `NO_MODIFICATION_ALLOWED_ERR`: Raised if this map is readonly.

           `NOT_SUPPORTED_ERR`: May be raised if the implementation does not support the feature
           "XML" and the language exposed through the Document does not support XML Namespaces
           (such as [HTML 4.01]).""")
    shared formal Node? removeNamedItemNS(
            "The namespace URI of the node to remove."
            DOMString namespaceURI,
            "The local name of the node to remove."
            DOMString localName);
}