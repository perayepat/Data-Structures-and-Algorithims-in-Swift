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
