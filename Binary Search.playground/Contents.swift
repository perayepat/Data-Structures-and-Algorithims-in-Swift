import UIKit

let numbers = [1,5,15,17,19,22,24,31,105,150]
var lowerBound = 0
var upperBound = numbers.count - 1
var middle = 0
var found = false
var searchedValue = 1

while(lowerBound <= upperBound){
    
    //find the middle of the array
    middle = (lowerBound + upperBound) / 2
    
    if(numbers[middle] == searchedValue){
        found = true
        break
    } else if(numbers[middle] < searchedValue) {
       lowerBound = middle + 1
    } else {
        upperBound = middle - 1
    }
}

print(found)
