import Foundation
/*
 making a struct equatable is good practice
 knowing how many children are in your tree
 searching in a tree
 */
public struct Node<Value>{
    public var value : Value
    private(set) var children: [Node]
    
    public mutating func add(child: Node){
        children.append(child)
    }
    
   public init(_ value: Value){
        self.value = value
        children = []
    }
    
    public init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
}
