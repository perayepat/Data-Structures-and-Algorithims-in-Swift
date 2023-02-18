//: [Previous](@previous)
import Foundation

var numbers = [2,6,7,19,11,45,9,23,56,78,94,100,120,23,45]
print("Before sorting \n\(numbers) ")

for i in 0..<numbers.count{
    let key = numbers[i] // 11
    var j = i - 1 // 3
    //which we will start comparing the key against
    
    ///while the index at J
    while(j >= 0 && numbers[j] > key){
        numbers[j+1] = numbers[j]
        j = j - 1
    }
    numbers[j + 1] = key
}

print("After sorting \n\(numbers) ")
//: [Next](@next)
