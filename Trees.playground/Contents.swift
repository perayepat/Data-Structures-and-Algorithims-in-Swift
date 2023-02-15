import UIKit

var andrew = Node("Andrew")
let john = Node("John")
andrew.add(child: john)

var paul = Node("Paul")
var sophie = Node("Sophie")
let charlotte = Node("Charlottte")
paul.add(child: sophie)
paul.add(child: charlotte)

var root = Node("Terry")
root.add(child: andrew)
root.add(child: paul)

let taylor = Node("Taylor")
sophie.add(child: taylor)
//print(root)
//print(paul)
//
//print(paul == andrew)
//print(paul != andrew)
//print(paul == paul)

//print(root.count)

if let paul = root.find("Paul"){
    print(paul.count)
}
