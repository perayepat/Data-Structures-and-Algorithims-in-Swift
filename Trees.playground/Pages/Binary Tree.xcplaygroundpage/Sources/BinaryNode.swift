import Foundation
/*
 `Binary tree`
 for a binary tree to work it can only have two children a left and a right for each node
 */
public class BinaryNode<Element>{
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(_ value:Element) {
        self.value = value
    }
}

extension BinaryNode{
    /// traverse in  order is called revursively, Call made on the stack for the recursion
    public func traverseInOrder(visit : (Element) -> Void){
        
        leftChild?.traverseInOrder(visit: visit)
        ///when the left node doesn't have a child
        visit(value) // this will print value when there is no left child and move to the right child
        /// If the node have  a right child
        rightChild?.traverseInOrder(visit: visit)
    }
}
