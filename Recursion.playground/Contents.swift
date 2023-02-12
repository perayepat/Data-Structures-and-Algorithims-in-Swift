import UIKit

func factorial(number :Int) -> Int {
    //base case
    if number == 0 {
        return 1
    }
    
    return number * factorial(number: number - 1)
}

let result = factorial(number: 6)

//2^3
func power(number :Int, n :Int) -> Int{
    //base recurcisive case
    if n == 0 {
        return 1
    } else {
        return number * power(number: number, n: n - 1)
    }
}

power(number: 6, n: 2)
