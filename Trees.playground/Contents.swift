import UIKit

class TreeNode<T>{
    
    var value :T
    var children :[TreeNode] = []
    
    init(_ value :T) {
        self.value = value
    }
    
    func add(_ child: TreeNode){
        self.children.append(child)
    }
}

let beverages = TreeNode<String>("Beverages")

let hot  = TreeNode<String>("Hot")
let cold  = TreeNode<String>("Cold")

beverages.add(hot)
beverages.add(cold)
