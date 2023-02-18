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
    ///Calling these functions on themselves creates a calling stack
    ///The recursion call the items on the stack and then picks up where we left off 
    public func traversePostOrder(visit: (Element) -> Void){
        /// This will go through the child nodes checking if they have children , when they don't have children the printout will happen
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    
    /// traverse in  order is called revursively, Call made on the stack for the recursion
    public func traverseInOrder(visit : (Element) -> Void){
        
        leftChild?.traverseInOrder(visit: visit)
        ///when the left node doesn't have a child
        visit(value) // this will print value when there is no left child and move to the right child
        /// If the node have  a right child
        rightChild?.traverseInOrder(visit: visit)
    }
}
