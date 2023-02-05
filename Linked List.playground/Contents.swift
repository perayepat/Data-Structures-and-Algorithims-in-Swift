import UIKit

/// Generic implementation where the value can be anything
class Node<Value>{
    
    var value: Value
    var next: Node? /// There might not be a next node
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

///Printing the values in a readable way
extension Node: CustomStringConvertible{
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

///IN USE
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 4)

node1.next = node2
node2.next = node3
print(node1)
print(node1.next)
