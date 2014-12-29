"The `Document` interface represents the entire HTML or XML document.

 Conceptually, it is the [root] of the document tree, and provides the
 primary access to the document's data.

 Since elements, text nodes, comments, processing instructions, etc. cannot
 exist outside the context of a `Document`, the `Document` interface also
 contains the factory methods needed to create these objects.
 The [[Node]] objects created have a `ownerDocument` attribute which associates
 them with the `Document` within whose context they were created.

 [root]: [root](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-root-node)
 "
shared dynamic Document satisfies Node {

    "The Document Type Declaration (see [[DocumentType]]) associated with this document.
     For XML documents without a document type declaration this returns `null`.
     For HTML documents, a [[DocumentType]] object may be returned, independently of the
     presence or absence of document type declaration in the HTML document.

     This provides direct access to the [[DocumentType]] node, child node of this [[Document]].
     This node can be set at document creation time and later changed through the use of child
     nodes manipulation methods, such as [[Node.insertBefore]], or [[Node.replaceChild]].
     Note, however, that while some implementations may instantiate different types of [[Document]]
     objects supporting additional features than the \"Core\", such as \"HTML\" \\[[DOM Level 2 HTML]\\],
     based on the [[DocumentType]] specified at creation time, changing it afterwards is very unlikely to
     result in a change of the features supported.

     [DOM Level 2 HTML]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#DOM2HTML"
    shared formal DocumentType? doctype;

    "The [[DOMImplementation]] object that handles this document.
     A DOM application may use objects from multiple implementations."
    shared formal DOMImplementation implementation;

    "This is a convenience attribute that allows direct access to the child
     node that is the document element of the document."
    shared formal Element documentElement;

    "Creates an element of the type specified.

     Note that the instance returned implements the [[Element]] interface, so
     attributes can be specified directly on the returned object.

     In addition, if there are known attributes with default values,
     [[Attr]] nodes representing them are automatically created and
     attached to the element.

     To create an element with a [qualified name] and [namespace URI],
     use the `createElementNS` method.
     "
    throws(`interface DOMException`,
            "`INVALID_CHARACTER_ERR`: Raised if the specified name is not an XML name according
             to the XML version in use specified in the [[Document.xmlVersion]] attribute.")
    shared formal Element createElement(
            "The name of the element type to instantiate.

             For XML, this is case-sensitive, otherwise it depends on the case-sensitivity
             of the markup language in use. In that case, the name is mapped to the canonical
             form of that markup by the DOM implementation."
            DOMString tagName);

    "Creates an empty [[DocumentFragment]] object."
    shared formal DocumentFragment createDocumentFragment();

    "Creates a [[Text]] node given the specified string."
    shared formal Text createTextNode(
            "The data for the node."
            DOMString data);

    "Creates a [[Comment]] node given the specified string."
    shared formal Comment createComment(
            "The data for the node."
            DOMString data);

    "Creates a [[CDATASection]] node whose value is the specified string."
    throws(`interface DOMException`,
            "`NOT_SUPPORTED_ERR`: Raised if this document is an HTML document.")
    shared formal CDATASection createCDATASection(
            "The data for the CDATASection contents."
            DOMString data);

    "Creates a [[ProcessingInstruction]] node given the specified name and data strings."
    throws(`interface DOMException`,
            "`INVALID_CHARACTER_ERR`: Raised if the specified target is not an XML name according
             to the XML version in use specified in the [[Document.xmlVersion]] attribute.

             `NOT_SUPPORTED_ERR`: Raised if this document is an HTML document.")
    shared formal ProcessingInstruction createProcessingInstruction(
            """The target part of the processing instruction.

               Unlike [[Document.createElementNS]] or [[Document.createAttributeNS]], no namespace well-formed
               checking is done on the target name.
               Applications should invoke [[Document.normalizeDocument()]] with the parameter `"namespaces"` set
               to `true` in order to ensure that the target name is namespace well-formed."""
            DOMString target,
            "The data for the node."
            DOMString data);

    "Creates an [[Attr]] of the given name.

     Note that the [[Attr]] instance can then be set on an [[Element]] using the `setAttributeNode` method.
     To create an attribute with a [qualified name] and [namespace URI], use the `createAttributeNS` method.

     [qualified name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname
     [namespace URI]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI"
    throws(`interface DOMException`,
            "`INVALID_CHARACTER_ERR`: Raised if the specified name is not an XML name according to the XML
             version in use specified in the [[Document.xmlVersion]] attribute.")
    shared formal Attr createAttribute(
                "The name of the attribute."
                DOMString name);

    "Creates an [[EntityReference]] object.

     In addition, if the referenced entity is known, the child list of the [[EntityReference]]
     node is made the same as that of the corresponding [[Entity]] node.

     **Note:** If any descendant of the [[Entity]] node has an unbound [namespace prefix], the
     corresponding descendant of the created [[EntityReference]] node is also unbound;
     (its `namespaceURI` is `null`).
     The DOM Level 2 and 3 do not support any mechanism to resolve namespace prefixes in this case.

     [namespace prefix]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceprefix"
    throws(`interface DOMException`,
            "- `INVALID_CHARACTER_ERR`: Raised if the specified name is not an XML name according to the
               XML version in use specified in the [[Document.xmlVersion]] attribute.
             - `NOT_SUPPORTED_ERR`: Raised if this document is an HTML document.")
    shared formal EntityReference createEntityReference(
                """The name of the entity to reference.

                   Unlike [[Document.createElementNS]] or [[Document.createAttributeNS]],
                   no namespace well-formed checking is done on the entity name.
                   Applications should invoke [[Document.normalizeDocument()]] with the
                   parameter `"namespaces"` set to `true` in order to ensure that the
                   entity name is namespace well-formed."""
                DOMString name);

    "Returns a [[NodeList]] of all the [[Elements|Element]] in [document order] with a
     given tag name and are contained in the document.

     [document order]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-document-order"
    shared formal NodeList getElementsByTagName(
            """The name of the tag to match on.
               The special value `"*"` matches all tags.
               For XML, the `tagname` parameter is case-sensitive, otherwise it depends on the
               case-sensitivity of the markup language in use."""
            DOMString tagname);

    // Introduced in DOM Level 2:
    """Imports a node from another document to this document, without altering or removing
       the source node from the original document;
       this method creates a new copy of the source node.
       The returned node has no parent; (parentNode is `null`).

       For all nodes, importing a node creates a node object owned by the importing document,
       with attribute values identical to the source node's `nodeName` and `nodeType`, plus
       the attributes related to namespaces (`prefix`, `localName`, and `namespaceURI`).
       As in the `cloneNode` operation, the source node is not altered. User data associated
       to the imported node is not carried over. However, if any [[UserDataHandlers|UserDataHandler]]
       has been specified along with the associated data these handlers will be called with the
       appropriate parameters before this method returns.

       Additional information is copied as appropriate to the `nodeType`, attempting to mirror
       the behavior expected if a fragment of XML or HTML source was copied from one document
       to another, recognizing that the two documents may have different DTDs in the XML case.

       The following list describes the specifics for each type of node.
       - **ATTRIBUTE_NODE**:

         The `ownerElement` attribute is set to `null` and the specified flag is set to true on
         the generated [[Attr]].
         The descendants of the source [[Attr]] are recursively imported and the resulting nodes
         reassembled to form the corresponding subtree.

         Note that the deep parameter has no effect on [[Attr]] nodes;
         they always carry their children with them when imported.

       - **DOCUMENT_FRAGMENT_NODE**:

         If the deep option was set to `true`, the descendants of the source [[DocumentFragment]]
         are recursively imported and the resulting nodes reassembled under the imported
         [[DocumentFragment]] to form the corresponding subtree.
         Otherwise, this simply generates an empty [[DocumentFragment]].

       - **DOCUMENT_NODE**:

         Document nodes cannot be imported.

       - **DOCUMENT_TYPE_NODE**:

         DocumentType nodes cannot be imported.

       - **ELEMENT_NODE**:

         Specified attribute nodes of the source element are imported, and the generated [[Attr]]
         nodes are attached to the generated [[Element]].
         Default attributes are not copied, though if the document being imported into defines
         default attributes for this element name, those are assigned. If the `importNode` `deep`
         parameter was set to `true`, the descendants of the source element are recursively imported
         and the resulting nodes reassembled to form the corresponding subtree.

       - **ENTITY_NODE**:

         [[Entity]] nodes can be imported, however in the current release of the DOM the [[DocumentType]]
         is readonly. Ability to add these imported nodes to a [[DocumentType]] will be considered for
         addition to a future release of the DOM.

         On import, the `publicId`, `systemId`, and `notationName` attributes are copied.
         If a `deep` import is requested, the descendants of the the source [[Entity]] are recursively
         imported and the resulting nodes reassembled to form the corresponding subtree.

       - **ENTITY_REFERENCE_NODE**:

         Only the [[EntityReference]] itself is copied, even if a deep import is requested, since the
         source and destination documents might have defined the entity differently. If the document
         being imported into provides a definition for this entity name, its value is assigned.

       - **NOTATION_NODE**:

         [[Notation]] nodes can be imported, however in the current release of the DOM the [[DocumentType]]
         is readonly. Ability to add these imported nodes to a [[DocumentType]] will be considered for
         addition to a future release of the DOM.

         On import, the `publicId` and `systemId` attributes are copied.

         Note that the `deep` parameter has no effect on this type of nodes since they cannot have any children.

       - **PROCESSING_INSTRUCTION_NODE**:

         The imported node copies its target and data values from those of the source node.

         Note that the `deep` parameter has no effect on this type of nodes since they cannot have any children.

       - **TEXT_NODE**, **CDATA_SECTION_NODE**, **COMMENT_NODE**:

         These three types of nodes inheriting from [[CharacterData]] copy their data and length attributes from
         those of the source node.

         Note that the `deep` parameter has no effect on these types of nodes since they cannot have any children.
       """
    throws(`interface DOMException`,
            """- `NOT_SUPPORTED_ERR`: Raised if the type of node being imported is not supported.
               - `INVALID_CHARACTER_ERR`: Raised if one of the imported names is not an XML name according to the
               XML version in use specified in the [[Document.xmlVersion]] attribute.
               This may happen when importing an XML 1.1 \[[XML 1.1]\] element into an XML 1.0 document, for instance.
               [XML 1.1]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XML11
               """)
    shared formal Node importNode(
            "The node to import."
            Node importedNode,
            "If `true`, recursively import the subtree under the specified node;
             if `false`, import only the node itself, as explained above.
             This has no effect on nodes that cannot have any children, and on [[Attr]], and [[EntityReference]] nodes."
            Boolean deep);

    // Introduced in DOM Level 2:
    """Creates an element of the given [qualified name] and [namespace URI].

       Per \[[XML Namespaces]\], applications must use the value null as the
       `namespaceURI` parameter for methods if they wish to have no namespace.

       [qualified name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname
       [namespace URI]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI
       [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces"""
    throws(`interface DOMException`,
            """- `INVALID_CHARACTER_ERR`: Raised if the specified `qualifiedName` is not an XML name according
                 to the XML version in use specified in the [[Document.xmlVersion]] attribute.

               - `NAMESPACE_ERR`: Raised if the `qualifiedName` is a malformed qualified name,
                 if the `qualifiedName` has a prefix and the `namespaceURI` is `null`,
                 or if the `qualifiedName` has a prefix that is `"xml"` and the `namespaceURI` is different from
                 `"http://www.w3.org/XML/1998/namespace"` \[[XML Namespaces]\],
                 or if the `qualifiedName` or its prefix is `"xmlns"` and the `namespaceURI` is different from
                 `"http://www.w3.org/2000/xmlns/"`,
                 or if the `namespaceURI` is `"http://www.w3.org/2000/xmlns/"` and neither the `qualifiedName`
                 nor its prefix is `"xmlns"`.

               - `NOT_SUPPORTED_ERR`: Always thrown if the current document does not support the `"XML"` feature,
               since namespaces were defined by XML.

               [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces
               """)
    shared formal Element createElementNS(
            "The [namespace URI] of the element to create.
             [namespace URI]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI"
            DOMString namespaceURI,
            "The [qualified name] of the element type to instantiate.
             [qualified name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname"
            DOMString qualifiedName);

    // Introduced in DOM Level 2:
    """Creates an attribute of the given qualified name and namespace URI.

       Per \[[XML Namespaces]\], applications must use the value `null` as the `namespaceURI`
       parameter for methods if they wish to have no namespace.

       [XML Namespaces]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#Namespaces
       """
    throws(`interface DOMException`,
            """- `INVALID_CHARACTER_ERR`: Raised if the specified `qualifiedName` is not an XML name
                 according to the XML version in use specified in the [[Document.xmlVersion]] attribute.

               - `NAMESPACE_ERR`: Raised if the `qualifiedName` is a malformed [qualified name],
                 if the `qualifiedName` has a prefix and the `namespaceURI` is `null`,
                 if the `qualifiedName` has a prefix that is `"xml"` and the `namespaceURI` is different from
                 `"http://www.w3.org/XML/1998/namespace"`,
                 if the `qualifiedName` or its prefix is `"xmlns"` and the `namespaceURI` is different from
                 `"http://www.w3.org/2000/xmlns/"`,
                 or if the `namespaceURI` is `"http://www.w3.org/2000/xmlns/"` and neither the `qualifiedName`
                 nor its prefix is `"xmlns"`.
               - `NOT_SUPPORTED_ERR`: Always thrown if the current document does not support the `"XML"` feature,
                 since namespaces were defined by XML.

               [qualified name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname
               """)
    shared formal Attr createAttributeNS(
            "The [namespace URI] of the attribute to create.
             [namespace URI]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI"
            DOMString? namespaceURI,
            "The [qualified name] of the attribute to instantiate.
             [qualified name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-qualifiedname"
            DOMString qualifiedName);

    // Introduced in DOM Level 2:
    "Returns a [[NodeList]] of all the [[Elements|Element]] with a given [local name] and [namespace URI] in [document order].

     [local name]:     http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-localname
     [namespace URI]:  http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI
     [document order]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-document-order"
    shared formal NodeList getElementsByTagNameNS(
            """The [namespace URI] of the elements to match on.
               The special value `"*"` matches all namespaces.
               [namespace URI]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-namespaceURI"""
            DOMString namespaceURI,
            """The [local name] of the elements to match on.
               The special value `"*"` matches all local names.

               [local name]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-localname"""
            DOMString localName);

    // Introduced in DOM Level 2:
    "Returns the [[Element]] that has an ID attribute with the given value.
     If no such element exists, this returns `null`.
     If more than one element has an ID attribute with that value, what is returned is undefined.

     The DOM implementation is expected to use the attribute [[Attr.isId]] to determine if an attribute is of type ID.

     **Note:** Attributes with the name \"ID\" or \"id\" are not of type ID unless so defined."
    shared formal Element? getElementById(
            "The unique id value for an element."
            DOMString elementId);

    // Introduced in DOM Level 3:
    "An attribute specifying the encoding used for this document at the time of the parsing.
     This is `null` when it is not known, such as when the [[Document]] was created in memory."
    deprecated("**Warning:** Don't use this method!
                This method has been removed from the draft DOM 4 specification;
                existing implementations will likely be removed in the near future.")
    shared formal DOMString inputEncoding;

    "An attribute specifying, as part of the [XML declaration], the encoding of this document.
     This is `null` when unspecified or when it is not known, such as when the [[Document]]
     was created in memory.

     [XML declaration]: http://www.w3.org/TR/2004/REC-xml-20040204#NT-XMLDecl"
    shared formal DOMString xmlEncoding;

    "An attribute specifying, as part of the [XML declaration], whether this document is standalone.
     This is `false` when unspecified.

     **Note:** No verification is done on the value when setting this attribute.
     Applications should use [[Document.normalizeDocument()]] with the <code>\"validate\"</code>
     parameter to verify if the value matches the validity constraint for standalone document
     declaration as defined in [XML 1.0].

     [XML declaration]: http://www.w3.org/TR/2004/REC-xml-20040204#NT-XMLDecl\"
     [XML 1.0]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XML
     "
    throws(`interface DOMException`, "on setting")
    shared formal variable Boolean xmlStandalone;

    "An attribute specifying, as part of the XML declaration, the version number of this document.
     If there is no declaration and if this document supports the \"XML\" feature, the value is
     <code>\"1.0\"</code>.
     If this document does not support the \"XML\" feature, the value is always `null`.
     Changing this attribute will affect methods that check for invalid characters in XML names.
     Application should invoke `Document.normalizeDocument()` in order to check for invalid
     characters in the [[Nodes|Node]] that are already part of this [[Document]].

     DOM applications may use the [[DOMImplementation.hasFeature(feature, version)]] method
     with parameter values <code>\"XMLVersion\"</code> and <code>\"1.0\"</code> (respectively)
     to determine if an implementation supports \\[[XML 1.0]\\].
     DOM applications may use the same method with parameter values <code>\"XMLVersion\"</code>
     and <code>\"1.1\"</code> (respectively) to determine if an implementation supports \\[[XML 1.1]\\].
     In both cases, in order to support XML, an implementation must also support the <code>\"XML\"</code>
     feature defined in this specification. [[Document]] objects supporting a version of the
     <code>\"XMLVersion\"</code> feature must not raise a `NOT_SUPPORTED_ERR` exception for the
     same version number when using [[Document.xmlVersion]].

     [XML 1.0]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XML
     [XML 1.1]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XML11
     "
    throws(`interface DOMException`, "on setting")
    shared formal variable DOMString xmlVersion; // not supported in all browsers

    "An attribute specifying whether error checking is enforced or not.
     When set to `false`, the implementation is free to not test every possible error case
     normally defined on DOM operations, and not raise any [[DOMException]] on DOM operations
     or report errors while using [[Document.normalizeDocument()]]. In case of error, the
     behavior is undefined. This attribute is `true` by default."
    shared formal variable Boolean? strictErrorChecking; // not supported in all browsers

    "The location of the document or `null` if undefined or if the `Document` was created using
     [[DOMImplementation.createDocument]].
     No lexical checking is performed when setting this attribute; this could result in a `null`
     value returned when using [[Node.baseURI]].

     Beware that when the `Document` supports the feature \"HTML\" \\[[DOM Level 2 HTML]\\],
     the `href` attribute of the HTML BASE element takes precedence over this attribute when
     computing [[Node.baseURI]].

     [DOM Level 2 HTML]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#DOM2HTML"
    shared formal variable DOMString? documentURI;

    // Introduced in DOM Level 3:

    "Attempts to adopt a node from another document to this document. If supported, it changes
     the `ownerDocument` of the source node, its children, as well as the attached attribute nodes
     if there are any. If the source node has a parent it is first removed from the child list of
     its parent. This effectively allows moving a subtree from one document to another (unlike
     `importNode()` which create a copy of the source node instead of moving it). When it fails,
     applications should use [[Document.importNode()]] instead.

     Note that if the adopted node is already part of this document (i.e. the source and target
     document are the same), this method still has the effect of removing the source node from
     the child list of its parent, if any.

     The following list describes the specifics for each type of node.
     - **ATTRIBUTE_NODE**:
       The ownerElement attribute is set to null and the specified flag is set to true on the adopted Attr. The descendants of the source Attr are recursively adopted.
     - **DOCUMENT_FRAGMENT_NODE**:
       The descendants of the source node are recursively adopted.
     - **DOCUMENT_NODE**:
       Document nodes cannot be adopted.
     - **DOCUMENT_TYPE_NODE**
       DocumentType nodes cannot be adopted.
     - **ELEMENT_NODE**:
       Specified attribute nodes of the source element are adopted. Default attributes are discarded, though if the document being adopted into defines default attributes for this element name, those are assigned. The descendants of the source element are recursively adopted.
     - **ENTITY_NODE**:
       Entity nodes cannot be adopted.
     - **ENTITY_REFERENCE_NODE**:
       Only the EntityReference node itself is adopted, the descendants are discarded, since the source and destination documents might have defined the entity differently. If the document being imported into provides a definition for this entity name, its value is assigned.
     - **NOTATION_NODE**:
       Notation nodes cannot be adopted.
     - **PROCESSING_INSTRUCTION_NODE**, **TEXT_NODE**, **CDATA_SECTION_NODE**, **COMMENT_NODE**:
       These nodes can all be adopted. No specifics.

     **Note:** Since it does not create new nodes unlike the [[Document.importNode()]] method, this
     method does not raise an [[INVALID_CHARACTER_ERR]] exception, and applications should use the
     [[Document.normalizeDocument()]] method to check if an imported name is not an XML name
     according to the XML version in use."
    throws(`interface DOMException`,
        "- `NOT_SUPPORTED_ERR`: Raised if the source node is of type `DOCUMENT`, `DOCUMENT_TYPE`.
         - `NO_MODIFICATION_ALLOWED_ERR`: Raised when the source node is readonly.
         ")
    shared formal Node? adoptNode(Node source);

    "The configuration used when [[Document.normalizeDocument()]] is invoked."
    shared formal DOMConfiguration domConfig;

    "This method acts as if the document was going through a save and load cycle, putting the document
     in a \"normal\" form. As a consequence, this method updates the replacement tree of [[EntityReference]]
     nodes and normalizes [[Text]] nodes, as defined in the method [[Node.normalize()]].

     Otherwise, the actual result depends on the features being set on the [[Document.domConfig]] object and
     governing what operations actually take place. Noticeably this method could also make the document [namespace
     well-formed] according to the algorithm described in [Namespace Normalization], check the character
     normalization, remove the [[CDATASection]] nodes, etc. See [[DOMConfiguration]] for details.

         // Keep in the document the information defined
         // in the XML Information Set (Java example)
         DOMConfiguration docConfig = myDocument.getDomConfig();
         docConfig.setParameter(\"infoset\", Boolean.TRUE);
         myDocument.normalizeDocument();

     Mutation events, when supported, are generated to reflect the changes occurring on the document.

     If errors occur during the invocation of this method, such as an attempt to update a read-only
     node or a [[Node.nodeName]] contains an invalid character according to the XML version in use,
     errors or warnings ([[DOMError.SEVERITY_ERROR]] or [[DOMError.SEVERITY_WARNING]]) will be reported
     using the [[DOMErrorHandler]] object associated with the \"[error-handler]\" parameter.
     Note this method might also report fatal errors ([[DOMError.SEVERITY_FATAL_ERROR]]) if an
     implementation cannot recover from an error.
     "
    shared formal void normalizeDocument();

    // Introduced in DOM Level 3:
    "Rename an existing node of type `ELEMENT_NODE` or `ATTRIBUTE_NODE`.

     When possible this simply changes the name of the given node, otherwise
     this creates a new node with the specified name and replaces the existing
     node with the new node as described below.

     If simply changing the name of the given node is not possible, the following
     operations are performed: a new node is created, any registered event listener
     is registered on the new node, any user data attached to the old node is removed
     from that node, the old node is removed from its parent if it has one, the children
     are moved to the new node, if the renamed node is an [[Element]] its attributes are
     moved to the new node, the new node is inserted at the position the old node used
     to have in its parent's child nodes list if it has one, the user data that was attached
     to the old node is attached to the new node.

     When the node being renamed is an [[Element]] only the specified attributes are moved, default
     attributes originated from the DTD are updated according to the new element name. In addition,
     the implementation may update default attributes from other schemas. Applications should use
     [[Document.normalizeDocument()]] to guarantee these attributes are up-to-date.

     When the node being renamed is an [[Attr]] that is attached to an [[Element]], the node is first
     removed from the [[Element]] attributes map. Then, once renamed, either by modifying the existing
     node or creating a new one as described above, it is put back.

     In addition,
     - a user data event `NODE_RENAMED` is fired,
     - when the implementation supports the feature \"MutationNameEvents\", each mutation operation
       involved in this method fires the appropriate event, and in the end the event
       `{http://www.w3.org/2001/xml-events, DOMElementNameChanged}` or
       `{http://www.w3.org/2001/xml-events, DOMAttributeNameChanged}` is fired.
     "
    throws(`interface DOMException`)
    shared formal Node renameNode(Node n,
        DOMString namespaceURI,
        DOMString qualifiedName);
}
