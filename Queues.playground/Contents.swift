import UIKit

struct Queue<T>{
    
    var array :[T] = []
    
    init () {
    }
    
    var isEmpty: Bool {
        ///Utililzing the power of the array
        return array.isEmpty
    }
    
    ///Returns the first item but doens't remove it
    var peek : T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool{
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String{
        return String(describing: array)
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(23)
queue.enqueue(25)
queue.enqueue(30)
queue.enqueue(20)

print(queue)
queue.dequeue()

print(queue)
print(queue.peek)
