"""An integer indicating which type of node this is.

   **Note:** Numeric codes up to 200 are reserved to W3C for possible future use.

   <table>
   <caption>The values of nodeName, nodeValue, and attributes vary according to the node type as follows:</caption>
   <thead>
   <tr><th>Interface</th><th>nodeName</th><th>nodeValue</th><th>attributes</th></tr>
   </thead>
   <tbody>
   <tr><td>[[Attr]]</td><td>same as [[Attr.name]]</td><td>same as [[Attr.value]]</td><td>`null`</td></tr>
   <tr><td>[[CDATASection]]</td><td>`"#cdata-section"`</td><td>same as [[CharacterData.data]], the content of the CDATA Section</td><td>`null`</td></tr>
   <tr><td>[[Comment]]</td><td>`"#comment"`</td><td>same as [[CharacterData.data]], the content of the comment</td><td>`null`</td></tr>
   <tr><td>[[Document]]</td><td>`"#document"`</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[DocumentFragment]]</td><td>`"#document-fragment"`</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[DocumentType]]</td><td>same as DocumentType.name</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[Element]]</td><td>same as Element.tagName</td><td>`null`</td><td>[[NamedNodeMap]]</td></tr>
   <tr><td>[[Entity]]</td><td>entity name</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[EntityReference]]</td><td>name of entity referenced</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[Notation]]</td><td>notation name</td><td>`null`</td><td>`null`</td></tr>
   <tr><td>[[ProcessingInstruction]]</td><td>same as [[ProcessingInstruction.target]]</td><td>same as [[ProcessingInstruction.data]]</td><td>`null`</td></tr>
   <tr><td>[[Text]]</td><td>`"#text"`</td><td>same as [[CharacterData.data]], the content of the text node</td><td>`null`</td></tr>
   </tbody>
   """
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