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
    
    
    mutating func pop() -> Value?{
        defer {
            ///it will return the value but after it returns the value it will execute the defer block
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        ///what if there are no items
        guard let head = head else {
            return nil
        }
        ///what if there is only one item
        guard head.next != nil else {
            return pop()
        }
        
        /// get the last element
        /// going through till we hit the nil value and the previous
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        defer{
            if node.next === tail {
                tail = node
            }
            //skipping to the next node adter
            //10 -> 1 -> 3
            //making the 10 point to the 3
            node.next = node.next?.next
        }
        
        return node.next?.value
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

list.pop()

print(list)

list.removeLast()

print(list)

list.push(42)
list.push(13)
list.push(33)
print(list)

let index = 2
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print(list)
