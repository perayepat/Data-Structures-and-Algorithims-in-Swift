import Foundation

class BinaryNode<Element>{
    
    var value: Element
    var leftChild: BinaryNode?
    var righttChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

struct BinarySeachTree<Element: Comparable>{
    private(set) var root :BinaryNode<Element>
    
    init() {
    }
}

extension BinarySeachTree: CustomStringConvertible{
    
    var description : String{
        guard let root = root else {return "Empty tree"}
        return String(String(describing: root))
    }
    
}

