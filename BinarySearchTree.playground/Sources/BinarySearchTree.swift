import Foundation

public class BinaryNode<Element>{
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ",
                       top + "┌──",
                       top + "│ ")
    } }

public struct BinarySearchTree<Element: Comparable>{
    
    private(set) var root :BinaryNode<Element>?
    public  init() {}
    
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
    }
    
}

extension BinarySearchTree{
    ///Because it's a struct we have to use a mutating property
    public mutating func insert(_ value: Element){
        root = insert(from: root, value: value)
    }
    
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>{
        /// If there's no binary node add the new node
        guard let node = node else {return BinaryNode(value: value)}
        
        //Using recusrsion this will keep on being called until the base case if fulfilled
        if value < node.value{
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    public func contains(_ value: Element) -> Bool{
        var current = root
        
        while let node = current {
            if node.value == value{
                return true
            }
            
            ///This is using recursion to check the magnitude of the node if it's lesser or greater than and using that to traverse through the binary tree
            if value < node.value{
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}
