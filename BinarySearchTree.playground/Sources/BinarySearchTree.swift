import Foundation

class BinaryNode<Element>{
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
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
                       top + " ", top + "┌──", top + "│ ")
    } }

struct BinarySearchTree<Element: Comparable>{
    
    private(set) var root :BinaryNode<Element>
    
    init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
        
    }
    
}


