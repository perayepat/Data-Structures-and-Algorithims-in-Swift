import UIKit

struct Stack<Element>{
    private var storage: [Element] = []
    
    init() {
        
    }
    mutating func push(_ element: Element){
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    //Displaying the stack or the different values in a  nice way
    var description: String{
        let topDivider = "-------Top-------"
        let bottomDivider = "\n------------"
        
        let stackElements = storage.map{ "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}


