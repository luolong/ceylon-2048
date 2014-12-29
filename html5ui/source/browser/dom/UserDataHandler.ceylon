"When associating an object to a key on a node using `Node.setUserData()`,
 the application can provide a handler that gets called when the node the
 object is associated to is being cloned, imported, or renamed.

 This can be used by the application to implement various behaviors regarding
 the data it associates to the DOM nodes.

 This interface defines that handler.
"
shared dynamic UserDataHandler {

    "This method is called whenever the node for which this handler is registered is imported or cloned.

     DOM applications must not raise exceptions in a [[UserDataHandler]].
     The effect of throwing exceptions from the handler is DOM implementation dependent.
     "
    shared formal void handle(
        "Specifies the type of operation that is being performed on the node."
        Integer operation,

        "Specifies the key for which this handler is being called."
        DOMString key,

        "Specifies the data for which this handler is being called."
        DOMUserData data,

        "Specifies the node being cloned, adopted, imported, or renamed.
         This is `null` when the node is being deleted."
        Node? src,

        "Specifies the node newly created if any, or `null`"
        Node? dst);

}

"Integer constants indicating the type of operation being performed on a node."
shared object userDataHandlerOperation {

    "The node is cloned, using Node.cloneNode()."
    shared Integer nodeCloned   = 1;

    "The node is imported, using Document.importNode()."
    shared Integer nodeImported = 2;

    "The node is deleted.

     **Note:** This may not be supported or may not be reliable in certain environments,
     such as Java, where the implementation has no real control over when objects are
     actually deleted."
    shared Integer nodeDeleted  = 1;

    "The node is renamed, using Document.renameNode()."
    shared Integer nodeRenamed  = 1;

    "The node is adopted, using Document.adoptNode()."
    shared Integer nodeAdopted  = 5;
}
