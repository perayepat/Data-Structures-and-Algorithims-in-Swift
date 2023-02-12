import UIKit

func factorial(number :Int) -> Int {
    
    //base case
    if number == 0 {
        return 1
    }
    
    return number * factorial(number: number - 1)
}

let result = factorial(number: 6)

