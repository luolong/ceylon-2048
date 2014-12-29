"An integer indicating which type of node this is.

 **Note:** Numeric codes up to 200 are reserved to W3C for possible future use."
shared object \iNodeType {

    "The node is an [[Element]]."
    shared Integer \iELEMENT_NODE                   = 1;

    "The node is an [[Attr]]."
    shared Integer \iATTRIBUTE_NODE                 = 2;

    "The node is a [[Text]] node."
    shared Integer \iTEXT_NODE                      = 3;

    "The node is a [[CDATASection]]."
    shared Integer \iCDATA_SECTION_NODE             = 4;

    "The node is an [[EntityReference]]."
    shared Integer \iENTITY_REFERENCE_NODE          = 5;

    "The node is an [[Entity]]."
    shared Integer \iENTITY_NODE                    = 6;

    "The node is a [[ProcessingInstruction]]."
    shared Integer \iPROCESSING_INSTRUCTION_NODE    = 7;

    "The node is a [[Comment]]."
    shared Integer \iCOMMENT_NODE                   = 8;

    "The node is a [[Document]]."
    shared Integer \iDOCUMENT_NODE                  = 9;

    "The node is a [[DocumentType]]."
    shared Integer \iDOCUMENT_TYPE_NODE             = 10;

    "The node is a [[DocumentFragment]]."
    shared Integer \iDOCUMENT_FRAGMENT_NODE         = 11;

    "The node is a [[Notation]]."
    shared Integer \iNOTATION_NODE                  = 12;

}