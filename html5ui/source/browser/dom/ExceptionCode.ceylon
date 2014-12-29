"An integer indicating the type of error generated.

 **Note:** Other numeric codes are reserved for W3C for possible future use."
see(`interface DOMException`)
shared object \iExceptionCode {

    "If index or size is negative, or greater than the allowed value."
    shared Integer      \iINDEX_SIZE_ERR                 = 1;

    "If the specified range of text does not fit into a [[DOMString]]."
    shared Integer      \iDOMSTRING_SIZE_ERR             = 2;

    "If any [[Node]] is inserted somewhere it doesn't belong."
    shared Integer      \iHIERARCHY_REQUEST_ERR          = 3;

    "If a [[Node]] is used in a different document than the one that created it
     (that doesn't support it)."
    shared Integer      \iWRONG_DOCUMENT_ERR             = 4;

    "If an invalid or illegal character is specified, such as in an XML name."
    shared Integer      \iINVALID_CHARACTER_ERR          = 5;

    "If data is specified for a [[Node]] which does not support data."
    shared Integer      \iNO_DATA_ALLOWED_ERR            = 6;

    "If an attempt is made to modify an object where modifications are not allowed."
    shared Integer      \iNO_MODIFICATION_ALLOWED_ERR    = 7;

    "If an attempt is made to reference a [[Node]] in a context where it does not exist."
    shared Integer      \iNOT_FOUND_ERR                  = 8;

    "If the implementation does not support the requested type of object or operation."
    shared Integer      \iNOT_SUPPORTED_ERR              = 9;

    "If an attempt is made to add an attribute that is already in use elsewhere."
    shared Integer      \iINUSE_ATTRIBUTE_ERR            = 10;

    // Introduced in DOM Level 2:
    "If an attempt is made to use an object that is not, or is no longer, usable."
    shared Integer      \iINVALID_STATE_ERR              = 11;

    "If an invalid or illegal string is specified."
    shared Integer      \iSYNTAX_ERR                     = 12;

    "If an attempt is made to modify the type of the underlying object."
    shared Integer      \iINVALID_MODIFICATION_ERR       = 13;

    "If an attempt is made to create or change an object in a way which is incorrect with regard to namespaces."
    shared Integer      \iNAMESPACE_ERR                  = 14;

    "If a parameter or an operation is not supported by the underlying object."
    shared Integer      \iINVALID_ACCESS_ERR             = 15;

    // Introduced in DOM Level 3:
    """If a call to a method such as `insertBefore` or `removeChild` would make the [[Node]] invalid
       with respect to ["partial validity"], this exception would be raised and the operation would not
       be done. This code is used in \[[DOM Level 3 Validation]\]. Refer to this specification for
       further information.
       ["partial validity"]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/glossary.html#dt-partially-valid
       [DOM Level 3 Validation]: http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/references.html#DOMVal"""
    shared Integer      \iVALIDATION_ERR                 = 16;

    "If the type of an object is incompatible with the expected type of the parameter associated to the object."
    shared Integer      \iTYPE_MISMATCH_ERR              = 17;

}