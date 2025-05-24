import UIKit

/*
 1. Sort
 2. Filter
 3. Map
 4. CompactMap
 5. Reduce
*/


let arr = [2,3,1,5,6]

//MARK: - Sort

let sortedArray = arr.sorted()
let anotherWayToSort = arr.sorted(by: <)
let reversedArray = arr.sorted { $0 > $1}

print(sortedArray)
print(anotherWayToSort)
print(reversedArray)

//MARK: - Map: The map function transforms each element of an array using a given function and returns a new array containing the transformed elements.

let sqNum = arr.map { $0 * $0}
print(sqNum)

//MARK: - CompactMap - removes nil element

let strArray: [String?] = ["a", "b", nil, "c", nil]
let compactStrArray = strArray.compactMap { $0 }
print(compactStrArray)

let numStrArr = ["1", "3", "5", "7", "qw", "0"]
let compactNum = numStrArr.compactMap { Int($0) }



//MARK: - Filter: The filter function creates a new array with the elements that satisfy a given condition

let lessThanFour = arr.filter { $0 < 4}
let evenNum = arr.filter { $0 % 2 == 0 }
print(compactNum)

//MARK: - Reduce - combines all elements of an array into a single Value

let sum = arr.reduce(0, +)
print(sum)
