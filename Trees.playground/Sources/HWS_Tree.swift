import Foundation
import SwiftUI
//MARK: - Notes
/*
 making a struct equatable is good practice
 knowing how many children are in your tree
 searching in a tree
 */
public final class Node<Value>{
    public var value : Value
    private(set) var children: [Node]
    
    ///Accurate count of all values of the tree
    public var count: Int{
        1 + children.reduce(0){$0 + $1.count}
    }
    
    public func add(child: Node){
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
    
    public init(_ value: Value, @NodeBuilder builder: () -> [Node]){
        self.value = value
        self.children = builder()
    }
}

/// Conditional Conformance
extension Node: Equatable where Value: Equatable {
    public static func ==(lhs:Node, rhs:Node) -> Bool{
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}
extension Node: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher){
        hasher.combine(value)
        hasher.combine(children)
    }
}
extension Node: Codable where Value: Codable { }

extension Node where Value: Equatable {
    ///Finding the children in a tree
    public func find(_ value: Value) -> Node? {
        if self.value == value{
            return self
        }

        for child in children {
            if let match = child.find(value){
                return match
            }
        }
        return nil
    }
}

@resultBuilder
public struct NodeBuilder{
    public static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>]{
        children
    }
}


//let terry = Node("Terry"){
//    Node("Paul"){
//        Node("Sophie")
//        Node("Lottie")
//    }
//    
//    Node("Andrew"){
//        Node("John")
//    }
//}
//
//print(terry.count)
