import UIKit

struct LinkedList<Value>{
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool{
        return head == nil
    }
    
     mutating func push(_ value: Value){
        /// push the new value in the place of the head
        /// What ever was previous becomes the next node
        head  = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    public init() {}
}

/// Generic implementation where the value can be anything
 class Node<Value>{
    
    var value: Value
    var next: Node? /// There might not be a next node
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

///Printing the values in a readable way
extension Node: CustomStringConvertible{
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

var list = LinkedList<Int>()
list.push(2)
list.push(3)
list.push(22)

print(list)
