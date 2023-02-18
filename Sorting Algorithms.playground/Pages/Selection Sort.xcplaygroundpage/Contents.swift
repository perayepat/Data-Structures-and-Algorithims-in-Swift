//: [Previous](@previous)
import Foundation

var numbers = [2,6,7,19,11,45,9,23,56,78,94,100,120,23,45]
print("Before sorting \n\(numbers) ")

var minIndex = 0

for i in 0..<numbers.count{
   minIndex = i
    
    for j in (i+1)..<numbers.count{
    ///location at i is already the minimum index so all we have to do is move the next index
        if (numbers[j] < numbers[minIndex]){
            minIndex = j
        }
        
        //swap the values
//        let temp = numbers[i]
//        numbers[i] = numbers[minIndex]
//        numbers[minIndex] = temp
        numbers.swapAt(i, minIndex)
    }
}

print("After sorting \n\(numbers) ")

//: [Next](@next)
