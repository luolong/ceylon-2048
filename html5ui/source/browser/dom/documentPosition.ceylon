"A bitmask indicating the relative document position of a node with respect to another node.

 If the two nodes being compared are the same node, then no flags are set on the return.

 Otherwise, the order of two nodes is determined by looking for common containers -- containers
 which contain both. A node directly contains any child nodes. A node also directly contains any
 other nodes attached to it such as attributes contained in an element or entities and notations
 contained in a document type. Nodes contained in contained nodes are also contained, but
 less-directly as the number of intervening containers increases.

 If there is no common container node, then the order is based upon order between the root
 container of each node that is in no container. In this case, the result is disconnected and
 implementation-specific. This result is stable as long as these outer-most containing nodes
 remain in memory and are not inserted into some other containing node. This would be the case
 when the nodes belong to different documents or fragments, and cloning the document or inserting
 a fragment might change the order.

 If one of the nodes being compared contains the other node, then the container precedes the
 contained node, and reversely the contained node follows the container. For example, when
 comparing an element against its own attribute or child, the element node precedes its
 attribute node and its child node, which both follow it.

 If neither of the previous cases apply, then there exists a most-direct container common
 to both nodes being compared. In this case, the order is determined based upon the two
 determining nodes directly contained in this most-direct common container that either are
 or contain the corresponding nodes being compared.

 If these two determining nodes are both child nodes, then the natural DOM order of these
 determining nodes within the containing node is returned as the order of the corresponding
 nodes. This would be the case, for example, when comparing two child elements of the same
 element.

 If one of the two determining nodes is a child node and the other is not, then the
 corresponding node of the child node follows the corresponding node of the non-child node.
 This would be the case, for example, when comparing an attribute of an element with a child
 element of the same element.

 If neither of the two determining node is a child node and one determining node has a greater
 value of nodeType than the other, then the corresponding node precedes the other. This would
 be the case, for example, when comparing an entity of a document type against a notation of
 the same document type.

 If neither of the two determining node is a child node and nodeType is the same for both
 determining nodes, then an implementation-dependent order between the determining nodes
 is returned. This order is stable as long as no nodes of the same nodeType are inserted
 into or removed from the direct container. This would be the case, for example, when
 comparing two attributes of the same element, and inserting or removing additional
 attributes might change the order between existing attributes."
shared object documentPosition {

    "The two nodes are disconnected.
     Order between disconnected nodes is always implementation-specific."
    shared Integer disconnected = #01;

    "The second node precedes the reference node."
    shared Integer preceding = #02;

    "The node follows the reference node."
    shared Integer following = #04;

    "The node contains the reference node.
     A node which contains is always preceding, too."
    shared Integer contains = #08;

    "The node is contained by the reference node.
     A node which is contained is always following, too."
    shared Integer containedBy = #10;

    "The determination of preceding versus following is implementation-specific."
    shared Integer implementationSpecific = #20;
}