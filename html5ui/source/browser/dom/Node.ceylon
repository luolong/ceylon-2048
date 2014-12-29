
"The `Node` interface is the primary datatype for the entire Document Object Model.
 It represents a single node in the document tree. While all objects implementing
 the `Node` interface expose methods for dealing with children, not all objects
 implementing the `Node` interface may have children. For example, [[Text]] nodes
 may not have children, and adding children to such nodes results in a [[DOMException]]
 being raised.

 The attributes `nodeName`, `nodeValue` and `attributes` are included as a mechanism to
 get at node information without casting down to the specific derived interface.
 In cases where there is no obvious mapping of these attributes for a specific `nodeType`
 (e.g., `nodeValue` for an [[Element]] or `attributes` for a [[Comment]]), this returns `null`.
 Note that the specialized interfaces may contain additional and more convenient mechanisms
 to get and set the relevant information."
shared dynamic Node {

    "The name of this node, depending on its type; see the table in [[NodeType]]."
    shared formal DOMString nodeName;

    "The value of this node, depending on its type; see the table in [[NodeType]].
     When it is defined to be `null`, setting it has no effect, including if the
     node is [read-only].
     [read-only]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-readonly-node"
    throws(`interface DOMException`,
            "**Exceptions on setting**
             - `NO_MODIFICATION_ALLOWED_ERR`: Raised when the node is readonly and if it
                is not defined to be `null`.

             **Exceptions on retrieval**
             - `DOMSTRING_SIZE_ERR`: Raised when it would return more characters than fit
                in a [[DOMString]] variable on the implementation platform.
             ")
    shared formal variable DOMString? nodeValue;

    "A code representing the type of the underlying object, as defined in [[NodeType]]."
    see(`value \iNodeType`)
    shared formal Integer nodeType;

    "The parent of this node.
     All nodes, except [[Attr]], [[Document]], [[DocumentFragment]], [[Entity]], and
     [[Notation]] may have a parent. However, if a node has just been created and not
     yet added to the tree, or if it has been removed from the tree, this is `null`. "
    shared formal Node? parentNode;

    "A [[NodeList]] that contains all children of this node.
     If there are no children, this is a [[NodeList]] containing no nodes."
    shared formal NodeList childNodes;

    "The first child of this node. If there is no such node, this returns `null`."
    shared formal Node? firstChild;

    "The last child of this node. If there is no such node, this returns `null`."
    shared formal Node? lastChild;

    "The node immediately preceding this node. If there is no such node, this returns `null`."
    shared formal Node? previousSibling;

    "The node immediately following this node. If there is no such node, this returns 'null'."
    shared formal Node? nextSibling;

    "A [[NamedNodeMap]] containing the attributes of this node (if it is an [[Element]])
     or `null` otherwise."
    shared formal NamedNodeMap? attributes;

    "The `Document` object associated with this node.
     This is also the `Document` object used to create
     new nodes. When this node is a `Document` or a `DocumentType`
     which is not used with any `Document` yet, this is `null`."
    shared formal Document? ownerDocument;

    "Inserts the node `newChild` before the existing child node `refChild`.
     If `refChild` is `null`, insert `newChild` at the end of the list of
     children.

     If `newChild` is a `DocumentFragment` object, all of its children are
     inserted, in the same order, before `refChild`. If the `newChild` is
     already in the tree, it is first removed.

     **Note:** Inserting a node before itself is implementation dependent."
    throws(`interface DOMException`,
            "`HIERARCHY_REQUEST_ERR`: Raised if this node is of a type that does not
             allow children of the type of the `newChild` node, or if the node to
             insert is one of this node's [ancestors] or this node itself, or if this
             node is of type [[Document]] and the DOM application attempts to insert
             a second [[DocumentType]] or [[Element]] node.

             `WRONG_DOCUMENT_ERR`: Raised if `newChild` was created from a different
             document than the one that created this node.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly or if the
             parent of the node being inserted is readonly.

             `NOT_FOUND_ERR`: Raised if `refChild` is not a child of this node.

             `NOT_SUPPORTED_ERR`: if this node is of type [[Document]], this exception
             might be raised if the DOM implementation doesn't support the insertion of
             a [[DocumentType]] or [[Element]] node.

             [ancestors]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-ancestor")
    shared formal Node insertBefore(
                "The node to insert."
                Node newChild,
                "The reference node, i.e., the node before which the new node must be inserted."
                Node? refChild);

    "Replaces the child node `oldChild` with `newChild` in the list
     of children, and returns the `oldChild` node.

     If `newChild` is a `DocumentFragment` object, `oldChild`
     is replaced by all of the `DocumentFragment` children,
     which are inserted in the same order. If the `newChild`
     is already in the tree, it is first removed.

     **Note:** Replacing a node with itself is implementation dependent."
    throws(`interface DOMException`,
            "`HIERARCHY_REQUEST_ERR`: Raised if this node is of a type that does not allow children
             of the type of the `newChild` node, or if the node to put in is one of this node's
             [ancestors] or this node itself, or if this node is of type [[Document]] and the
             result of the replacement operation would add a second [[DocumentType]] or [[Element]]
             on the [[Document]] node.

             `WRONG_DOCUMENT_ERR`: Raised if `newChild` was created from a different document than
             the one that created this node.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node or the parent of the new node is
             readonly.

             `NOT_FOUND_ERR`: Raised if `oldChild` is not a child of this node.

             `NOT_SUPPORTED_ERR`: if this node is of type [[Document]], this exception might be
             raised if the DOM implementation doesn't support the replacement of the [[DocumentType]]
             child or [[Element]] child.

             [ancestors]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-ancestor
             ")
    shared formal Node replaceChild(
        "The new node to put in the child list."
        Node newChild,
        "The new node to put in the child list."
        Node oldChild);

    "Removes the child node indicated by `oldChild` from the list of children, and returns it."
    throws(`interface DOMException`,
             "`NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.

              `NOT_FOUND_ERR`: Raised if `oldChild` is not a child of this node.

              `NOT_SUPPORTED_ERR`: if this node is of type [[Document]], this exception might
              be raised if the DOM implementation doesn't support the removal of the [[DocumentType]]
              child or the [[Element]] child.
              ")
    shared formal Node removeChild(
        "The node being removed."
        Node oldChild);

    "Adds the node newChild to the end of the list of children of this node.
     If the `newChild` is already in the tree, it is first removed."
    throws(`interface DOMException`,
            "`HIERARCHY_REQUEST_ERR`: Raised if this node is of a type that does not allow children
             of the type of the `newChild` node, or if the node to append is one of this node's
             [ancestors] or this node itself, or if this node is of type [[Document]] and the DOM
             application attempts to append a second [[DocumentType]] or [[Element]] node.

             `WRONG_DOCUMENT_ERR`: Raised if `newChild` was created from a different document than
             the one that created this node.

             `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly or if the previous parent
             of the node being inserted is readonly.

             `NOT_SUPPORTED_ERR`: if the `newChild` node is a child of the [[Document]] node, this
             exception might be raised if the DOM implementation doesn't support the removal of the
             [[DocumentType]] child or [[Element]] child.

             [ancestors]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-ancestor
             ")
    shared formal Node appendChild(
        "The node to add.

         If it is a `DocumentFragment` object, the entire contents of
         the document fragment are moved into the child list of this node."
        Node newChild);

    "Returns whether this node has any children."
    shared formal Boolean hasChildNodes();

    "Returns a duplicate of this node, i.e., serves as a generic copy constructor
     for nodes. The duplicate node has no parent (`parentNode` is `null`) and no
     user data. User data associated to the imported node is not carried over.
     However, if any [[UserDataHandlers|UserDataHandler]] has been specified along
     with the associated data these handlers will be called with the appropriate
     parameters before this method returns.

     Cloning an [[Element]] copies all attributes and their values, including those
     generated by the XML processor to represent defaulted attributes, but this
     method does not copy any children it contains unless it is a deep clone.
     This includes text contained in an the [[Element]] since the text is contained
     in a child [[Text]] node. Cloning an [[Attr]] directly, as opposed to be cloned as
     part of an [[Element]] cloning operation, returns a specified attribute (`specified`
     is `true`). Cloning an [[Attr]] always clones its children, since they represent its
     value, no matter whether this is a deep clone or not. Cloning an [[EntityReference]]
     automatically constructs its subtree if a corresponding [[Entity]] is available,
     no matter whether this is a deep clone or not. Cloning any other type of node
     simply returns a copy of this node.

     Note that cloning an immutable subtree results in a mutable copy, but the children
     of an [[EntityReference]] clone are readonly. In addition, clones of unspecified
     [[Attr]] nodes are specified. And, cloning [[Document]], [[DocumentType]], [[Entity]],
     and [[Notation]] nodes is implementation dependent."
    shared formal Node cloneNode(
        "If `true`, recursively clone the subtree under the specified node;
         if `false`, clone only the node itself (and its attributes, if it
         is an [[Element]])."
        Boolean deep);

    "Puts all [[Text]] nodes in the full depth of the sub-tree underneath this `Node`,
     including attribute nodes, into a \"normal\" form where only structure (e.g.,
     elements, comments, processing instructions, CDATA sections, and entity references)
     separates [[Text]] nodes, i.e., there are neither adjacent [[Text]] nodes nor empty
     [[Text]] nodes. This can be used to ensure that the DOM view of a document is the
     same as if it were saved and re-loaded, and is useful when operations (such as XPointer
     [[XPointer](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XPointer)]
     lookups) that depend on a particular document tree structure are to be used. If the
     parameter \"normalize-characters\" of the [[DOMConfiguration]] object attached to the
     [[Node.ownerDocument]] is `true`, this method will also fully normalize the characters
     of the [[Text]] nodes.

     **Note:** In cases where the document contains [[CDATASections|CDATASection]], the normalize
     operation alone may not be sufficient, since XPointers do not differentiate between [[Text]]
     nodes and [[CDATASection]] nodes."
    shared formal void normalize();

    "Tests whether the DOM implementation implements a specific feature
     and that feature is supported by this node, as specified in [DOM Features]
     (http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#DOMFeatures)."
    shared formal Boolean isSupported(
        "The name of the feature to test."
        DOMString feature,
        "This is the version number of the feature to test."
        DOMString version);

    "The namespace URI of this node, or null if it is unspecified (see [XML Namespaces]
     (http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#Namespaces-Considerations)).

     This is not a computed value that is the result of a namespace
     lookup based on an examination of the namespace declarations in scope.
     It is merely the namespace URI given at creation time.

     For nodes of any type other than `ELEMENT_NODE` and `ATTRIBUTE_NODE`
     and nodes created with a DOM Level 1 method, such as [[Document.createElement()]],
     this is always `null`.

     **Note:** Per the Namespaces in XML Specification [[XML Namespaces]
     (http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces)]
     an attribute does not inherit its namespace from the element it is attached to.
     If an attribute is not explicitly given a namespace, it simply has no namespace."
    shared formal DOMString? namespaceURI;

    "The namespace prefix of this node, or `null` if it is unspecified.
     When it is defined to be `null`, setting it has no effect, including
     if the node is read-only.

     Note that setting this attribute, when permitted, changes the `nodeName`
     attribute, which holds the qualified name, as well as the `tagName` and
     `name` attributes of the [[Element]] and [[Attr]] interfaces, when applicable.

     Setting the prefix to `null` makes it unspecified, setting it to an empty
     string is implementation dependent.

     Note also that changing the prefix of an attribute that is known to have a
     default value, does not make a new attribute with the default value and the
     original prefix appear, since the `namespaceURI` and `localName` do not change.

     For nodes of any type other than `ELEMENT_NODE` and `ATTRIBUTE_NODE` and nodes
     created with a DOM Level 1 method, such as `createElement` from the [[Document]]
     interface, this is always `null`."
    throws(`interface DOMException`,
        """**Exceptions on setting**

           `INVALID_CHARACTER_ERR`: Raised if the specified prefix contains an illegal character
           according to the XML version in use specified in the [[Document.xmlVersion]] attribute.

           `NO_MODIFICATION_ALLOWED_ERR`: Raised if this node is readonly.

           `NAMESPACE_ERR`: Raised if the specified prefix is malformed per the Namespaces in XML specification,
           if the `namespaceURI` of this node is `null`,
           if the specified prefix is `"xml"` and the `namespaceURI` of this node is different from
           `"http://www.w3.org/XML/1998/namespace"`,
           if this node is an attribute and the specified prefix is `"xmlns"` and the `namespaceURI`
           of this node is different from `"http://www.w3.org/2000/xmlns/"`, or if this node is an
           attribute and the `qualifiedName` of this node is `"xmlns"` \[[XML Namespaces]\].
           [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces""")
    shared formal variable DOMString? prefix;

    "Returns the local part of the [qualified name]
     (http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname)
     of this node.

     For nodes of any type other than `ELEMENT_NODE` and `ATTRIBUTE_NODE` and nodes created
     with a DOM Level 1 method, such as [[Document.createElement()]], this is always `null`."
    shared formal DOMString? localName;

    "Returns whether this node (if it is an element) has any attributes."
    shared formal Boolean hasAttributes();

    "The absolute base URI of this node or `null` if the implementation wasn't able
     to obtain an absolute URI. This value is computed as described in Base URIs.
     However, when the [[Document]] supports the feature \"HTML\"
     [DOM Level 2 HTML](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#DOM2HTML),
     the base URI is computed using first the value of the href attribute of the HTML BASE element
     if any, and the value of the `documentURI` attribute from the [[Document]] interface otherwise."
    shared formal DOMString? baseURI;

    "Compares the reference node, i.e. the node on which this method is being called,
     with a node, i.e. the one passed as a parameter, with regard to their position
     in the document and according to the document order."
    see(`value \iDocumentPosition`)
    throws(`interface DOMException`,
            "`NOT_SUPPORTED_ERR`: when the compared nodes are from different DOM implementations that
             do not coordinate to return consistent implementation-specific results.")
    shared formal Integer compareDocumentPosition(
        "The node to compare against the reference node."
        Node other);

    "This attribute returns the text content of this node and its descendants.
     When it is defined to be null, setting it has no effect. On setting, any
     possible children this node may have are removed and, if it the new string
     is not empty or null, replaced by a single Text node containing the string
     this attribute is set to.

     On getting, no serilization is performed, the returned string does not
     contain any markup. No whitespace normalization is performed and the returned
     string does not contain the white spaces in element content (see the attribute
     [[Text.isElementContentWhitespace]]).
     Similarly, on setting, no parsing is performed either, the input string is taken
     as pure textual content.

     The string returned is made of the text content of this node depending on its
     type, as defined below:

     <table rules='all'>
       <thead><tr><th>Node type</th><th>Content</tr><thead>
       <tbody><tr>
         <td>ELEMENT_NODE, ATTRIBUTE_NODE, ENTITY_NODE, ENTITY_REFERENCE_NODE, DOCUMENT_FRAGMENT_NODE</td>
         <td>concatenation of the textContent attribute value of every child node, excluding
             <code>COMMENT_NODE</code> and <code>PROCESSING_INSTRUCTION_NODE</code> nodes.
             This is the empty string if the node has no children.</td>
       </tr><tr>
         <td>TEXT_NODE, CDATA_SECTION_NODE, COMMENT_NODE, PROCESSING_INSTRUCTION_NODE</td>
         <td><code>nodeValue</code></td>
       </tr><tr>
         <td>DOCUMENT_NODE, DOCUMENT_TYPE_NODE, NOTATION_NODE\t</td>
         <td><code>null</code></td>
       </tr></tbody>
     </table>
     "
    throws(`interface DOMException`,
        "**Exceptions on setting**

         `NO_MODIFICATION_ALLOWED_ERR`: Raised when the node is readonly.

         **Exceptions on retrieval**

         `DOMSTRING_SIZE_ERR`: Raised when it would return more characters than fit in a
         [[DOMString]] variable on the implementation platform.")
    shared formal variable DOMString? textContent;

    "Returns whether this node is the same node as the given one.

     This method provides a way to determine whether two `Node` references returned by the
     implementation reference the same object. When two Node references are references to
     the same object, even if through a proxy, the references may be used completely
     interchangeably, such that all attributes have the same values and calling the same DOM
     method on either reference always has exactly the same effect."
    shared formal Boolean isSameNode(
        "The node to test against."
        Node other);

    "Look up the prefix associated to the given namespace URI, starting from this node.
     The default namespace declarations are ignored by this method.
     See [Namespace Prefix Lookup](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/namespaces-algorithms.html#lookupNamespacePrefixAlgo)
     for details on the algorithm used by this method."
    shared formal DOMString? lookupPrefix(
        "The namespace URI to look for."
        DOMString namespaceURI);

    "This method checks if the specified namespaceURI is the default namespace or not."
    shared formal Boolean isDefaultNamespace(
        "The namespace URI to look for."
        DOMString namespaceURI);

    "Look up the namespace URI associated to the given prefix, starting from this node.
     See [Namespace URI Lookup](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/namespaces-algorithms.html#lookupNamespaceURIAlgo)
     for details on the algorithm used by this method."
    shared formal DOMString? lookupNamespaceURI(
        "The prefix to look for.
         If this parameter is `null`, the method will return the default namespace URI if any."
        DOMString? prefix=null);

    "Tests whether two nodes are equal.

     This method tests for equality of nodes, not sameness (i.e., whether
     the two nodes are references to the same object) which can be tested
     with [[Node.isSameNode()]]. All nodes that are the same will also be equal,
     though the reverse may not be true.

     Two nodes are equal if and only if the following conditions are satisfied:
     - The two nodes are of the same type.
     - The following string attributes are equal: `nodeName`, `localName`,
       `namespaceURI`, `prefix`, `nodeValue`. This is: they are both `null`, or
       they have the same length and are character for character identical.
     - The `attribute`s [[NamedNodeMaps|NamedNodeMap]] are equal. This is: they are both `null`,
       or they have the same length and for each node that exists in one map there
       is a node that exists in the other map and is equal, although not necessarily
       at the same index.
     - The `childNode`s [[NodeLists|NodeList]] are equal. This is: they are both `null`, or
       they have the same length and contain equal nodes at the same index. Note that
       normalization can affect equality; to avoid this, nodes should be normalized
       before being compared.

     For two DocumentType nodes to be equal, the following conditions must also be satisfied:
     - The following string attributes are equal: publicId, systemId, internalSubset.
     - The entities NamedNodeMaps are equal.
     - The notations NamedNodeMaps are equal.

     On the other hand, the following do not affect equality: the ownerDocument, baseURI, and parentNode attributes, the specified attribute for Attr nodes, the schemaTypeInfo attribute for Attr and Element nodes, the Text.isElementContentWhitespace attribute for Text nodes, as well as any user data or event listeners registered on the nodes.

     **Note:** As a general rule, anything not mentioned in the description above is not significant in consideration of equality checking. Note that future versions of this specification may take into account more attributes and implementations conform to this specification are expected to be updated accordingly.
     "
    shared formal Boolean isEqualNode(
        "The node to compare equality with."
        Node arg);

    "This method returns a specialized object which implements the specialized APIs of the specified
     feature and version, as specified in
     [DOM Features](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#DOMFeatures).

     The specialized object may also be obtained by using binding-specific casting methods but is
     not necessarily expected to, as discussed in
     [Mixed DOM Implementations](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#Embedded-DOM).

     This method also allow the implementation to provide specialized objects which do not support the `Node` interface.

     It returns an object which implements the specialized APIs of the specified feature and version,
     if any, or `null` if there is no object which implements interfaces associated with that feature.
     If the [[DOMObject]] returned by this method implements the [[Node]] interface, it must delegate
     to the primary core [[Node]] and not return results inconsistent with the primary core [[Node]]
     such as `attributes`, `childNodes`, etc."
    shared formal DOMObject? getFeature(
            """The name of the feature requested.
               Note that any plus sign `"+"` prepended to the name of the feature will be ignored
               since it is not significant in the context of this method."""
            DOMString feature,
            "This is the version number of the feature to test."
            DOMString version);

    "Associate an object to a key on this node.
     The object can later be retrieved from this node by calling [[getUserData]] with the same key.

     Returns the [[DOMUserData]] previously associated to the given key on this node, or `null` if there was none."
    shared formal DOMUserData? setUserData(
        "The key to associate the object to."
        DOMString key,
        "The object to associate to the given key, or `null` to remove any existing association to that key."
        DOMUserData? data,
        "The handler to associate to that key, or `null`."
        UserDataHandler? handler=null);

    "Retrieves the object associated to a key on a this node.
     The object must first have been set to this node by calling `setUserData` with the same key.

     Returns the [[DOMUserData]] associated to the given key on this node, or `null` if there was none."
    shared formal DOMUserData? getUserData(
        "The key the object is associated to."
        DOMString key);
}