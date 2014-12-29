"""The `Element` interface represents an element in an HTML or XML document.
   Elements may have attributes associated with them;
   since the `Element` interface inherits from [[Node]], the generic [[Node]] interface
   attribute attributes may be used to retrieve the set of all attributes for an element.
   There are methods on the [[Element]] interface to retrieve either an [[Attr]] object
   by name or an attribute value by name. In XML, where an attribute value may contain
   entity references, an [[Attr]] object should be retrieved to examine the possibly fairly
   complex sub-tree representing the attribute value. On the other hand, in HTML, where all
   attributes have simple string values, methods to directly access an attribute value can
   safely be used as a convenience.

   **Note:** In DOM Level 2, the method normalize is inherited from the Node interface where
   it was moved.
   """
shared dynamic Element satisfies Node {
    //TODO: add members!
}