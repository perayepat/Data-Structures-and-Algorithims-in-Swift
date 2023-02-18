//: [Previous](@previous)
import Foundation

var numbers = [2,6,7,19,11,45,9,23,56,78,94,100,120,23,45]
print("Before sorting \n\(numbers) ")

for i in 0..<numbers.count{
    for j in 0..<numbers.count{
        
        if numbers[i] < numbers[j]{
            ///swap the numbers manually
//            let temp = numbers[i]
//            numbers[i] = numbers[j]
//            numbers[j] = temp
            
            /// swapping with built in code
            numbers.swapAt(i, j)
        }
    }
}
print("After sorting \n\(numbers) ")

//: [Next](@next)
