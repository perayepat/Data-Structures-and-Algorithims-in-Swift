import Foundation
//MARK: - Notes
/*
 making a struct equatable is good practice
 knowing how many children are in your tree
 searching in a tree
 */
public struct Node<Value>{
    public var value : Value
    private(set) var children: [Node]
    
    ///Accurate count of all values of the tree
    public var count: Int{
        1 + children.reduce(0){$0 + $1.count}
    }
    
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

/// Conditional Conformance
extension Node: Equatable where Value: Equatable { }
extension Node: Hashable where Value: Hashable { }
extension Node: Codable where Value: Codable { }

