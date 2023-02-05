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
    
    mutating func append(_ value: Value){
    /// If the linked list is empty push
    /// make the next tail node the new node and the tail the added node
        guard !isEmpty else{
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    func node(at index:Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index){
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func insert(_ value: Value, after node:Node<Value>){
        node.next = Node(value: value,next: node.next)
    }
    
    init() {}
}

extension LinkedList: CustomStringConvertible{
    var description: String {
        guard let head = head else{
            return "Empty List"
        }
        return String(describing: head)
    }
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

let middleNode = list.node(at: 1)!
list.insert(999, after: middleNode)

print(list)
