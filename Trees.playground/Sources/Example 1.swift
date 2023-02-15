import Foundation

struct Queue<Element>{
    var elements : [Element] = []
    
    mutating func enqueue(_ value :Element) -> Bool{
        elements.append(value)
        return true
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

public class TreeNode<T>{
    public var value :T
    public var children :[TreeNode] = []
    
   public init(_ value :T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode){
        self.children.append(child)
    }
}

/// Breath first traversal where you go from the far most left and work you way to the right of the tree
extension TreeNode {
   public func forEachDepthFirst(_ visit:(TreeNode) -> Void){
        visit(self)
       children.forEach{ $0.forEachDepthFirst(visit)}
    }
    ///`Level order traversal`
    ///This goes by the level in which the nodes are layed out
    public func forEachLevelOrder(_ visit: (TreeNode) -> Void){
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach{ queue.enqueue($0)}
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{queue.enqueue($0)}
        }
    }
}


