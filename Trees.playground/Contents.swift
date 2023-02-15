import Foundation


let beverages = TreeNode<String>("Beverages")

let hot  = TreeNode<String>("Hot")
let cold  = TreeNode<String>("Cold")

let tea = TreeNode("Tea")
let coffee = TreeNode("Coffee")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode("Soda")
let milk = TreeNode("Milk")

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

//cold.forEachDepthFirst{print($0.value)}

beverages.forEachLevelOrder{print($0.value)}
