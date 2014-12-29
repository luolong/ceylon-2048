"The `DOMImplementation` interface provides a number of methods for performing
 operations that are independent of any particular instance of the document
 object model."
shared dynamic DOMImplementation {
    "This method returns a specialized object which implements the specialized APIs
     of the specified feature and version, as specified in DOM Features.
     The specialized object may also be obtained by using binding-specific
     casting methods but is not necessarily expected to, as discussed in
     Mixed DOM Implementations.
     This method also allow the implementation to provide specialized objects which
     do not support the `DOMImplementation` interface."
    shared formal Boolean hasFeature(
        """The name of the feature requested. Note that any plus sign `"+"` prepended
           to the name of the feature will be ignored since it is not significant in
           the context of this method. """
        DOMString feature,
        "This is the version number of the feature to test."
        DOMString version);

    // Introduced in DOM Level 2:
    "Creates an empty [[DocumentType]] node.
     Entity declarations and notations are not made available.
     Entity reference expansions and default attribute additions do not occur.."
    throws(`interface DOMException`)
    shared formal DocumentType createDocumentType(
        "The qualified name of the document type to be created."
        DOMString qualifiedName,
        "The external subset public identifier."
        DOMString publicId,
        "The external subset system identifier."
        DOMString systemId);

    // Introduced in DOM Level 2:
    """Creates a DOM Document object of the specified type with its document element.

       Note that based on the [[DocumentType]] given to create the document, the
       implementation may instantiate specialized Document objects that support
       additional features than the `"Core"`, such as `"HTML"` \[[DOM Level 2 HTML]\].
       On the other hand, setting the [[DocumentType]] after the document was created
       makes this very unlikely to happen. Alternatively, specialized [[Document]] creation
       methods, such as `createHTMLDocument` \[[DOM Level 2 HTML]\], can be used to obtain
       specific types of [[Document]] objects.
       [DOM Level 2 HTML]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#DOM2HTML
       """
    throws(`interface DOMException`,
        """`INVALID_CHARACTER_ERR`: Raised if the specified qualified name is not an XML name
            according to \[[XML 1.0]\].

            `NAMESPACE_ERR`: Raised if the `qualifiedName` is malformed.

            `NOT_SUPPORTED_ERR`: May be raised if the implementation does not support the
            feature `"XML"` and the language exposed through the Document does not support
            XML Namespaces (such as \[[HTML 4.01]\]).

            [XML 1.0]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#XML
            [HTML 4.01]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#HTML40""")
    shared formal Document createDocument(
            "The namespace URI of the document element to create or `null`."
            DOMString? namespaceURI,
            "The qualified name of the document element to be created or `null`."
            DOMString? qualifiedName,
            "The type of document to be created or `null`.

             When `doctype` is not `null`, its [[Node.ownerDocument]] attribute is set to the
             document being created."
            DocumentType? doctype);

    // Introduced in DOM Level 3:
    """This method returns a specialized object which implements the specialized APIs of the
       specified feature and version, as specified in [DOM Features].
       The specialized object may also be obtained by using binding-specific casting methods
       but is not necessarily expected to, as discussed in [Mixed DOM Implementations].
       This method also allow the implementation to provide specialized objects which do not
       support the `DOMImplementation` interface.

       [DOM Features]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#DOMFeatures
       [Mixed DOM Implementations]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#Embedded-DOM

       Returns an object which implements the specialized APIs of the specified feature and version,
       if any, or `null` if there is no object which implements interfaces associated with that feature.
       If the [[DOMObject]] returned by this method implements the `DOMImplementation` interface, it
       must delegate to the primary core `DOMImplementation` and not return results inconsistent with
       the primary core `DOMImplementation` such as `hasFeature`, `getFeature`, etc.
       """
    shared formal DOMObject? getFeature(
        """The name of the feature requested.
           Note that any plus sign `"+"` prepended to the name of the feature will be ignored since
           it is not significant in the context of this method. """
        DOMString feature,
        """This is the version number of the feature to test."""
        DOMString version);
}
