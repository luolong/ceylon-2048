shared dynamic DOMException {
    shared formal Integer code;
}

shared object domExceptionCode {

    shared Integer      \iINDEX_SIZE_ERR                 = 1;
    shared Integer      \iDOMSTRING_SIZE_ERR             = 2;
    shared Integer      \iHIERARCHY_REQUEST_ERR          = 3;
    shared Integer      \iWRONG_DOCUMENT_ERR             = 4;
    shared Integer      \iINVALID_CHARACTER_ERR          = 5;
    shared Integer      \iNO_DATA_ALLOWED_ERR            = 6;
    shared Integer      \iNO_MODIFICATION_ALLOWED_ERR    = 7;
    shared Integer      \iNOT_FOUND_ERR                  = 8;
    shared Integer      \iNOT_SUPPORTED_ERR              = 9;
    shared Integer      \iINUSE_ATTRIBUTE_ERR            = 10;

    // Introduced in DOM Level 2:
    shared Integer      \iINVALID_STATE_ERR              = 11;
    shared Integer      \iSYNTAX_ERR                     = 12;
    shared Integer      \iINVALID_MODIFICATION_ERR       = 13;
    shared Integer      \iNAMESPACE_ERR                  = 14;
    shared Integer      \iINVALID_ACCESS_ERR             = 15;

    // Introduced in DOM Level 3:
    shared Integer      \iVALIDATION_ERR                 = 16;
    shared Integer      \iTYPE_MISMATCH_ERR              = 17;

}