import UIKit

var andrew = Node("Andrew")
let john = Node("John")
andrew.add(child: john)

var paul = Node("Paul")
let sophie = Node("Sophie")
let charlotte = Node("Charlottte")
paul.add(child: sophie)
paul.add(child: charlotte)

var root = Node("Terry")
root.add(child: andrew)
root.add(child: paul)

print(root)
print(paul)
