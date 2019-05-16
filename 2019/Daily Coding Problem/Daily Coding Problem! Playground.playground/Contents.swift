import UIKit

let listOfNumbers = [10, 15, 3, 7]

func bruteForce(_ listOfNumbers: [Int], k: Int) -> Bool {
    for i in 0..<listOfNumbers.count {
        print("\n=== i is: \(listOfNumbers[i]) ===\n")
        for j in 0..<listOfNumbers.count where j != i {
            if listOfNumbers[j] + listOfNumbers[i] == k {
                print("true\n \(listOfNumbers[j] + listOfNumbers[i])")
                return true
            } else {
                print("false\n \(listOfNumbers[j] + listOfNumbers[i])")
            }
        }
    }
    
    return false
}

bruteForce(listOfNumbers, k: 10)
