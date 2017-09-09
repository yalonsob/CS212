/*:

## 1. Optional String

 The var `s` might be a string, or it might be nil. Conditionally unwrap s using a `if let` statement. If `s` can be safely unwraped then print it using `print(s)`.
*/

let s: String?
s = generateStringOrNil()

// Your code for question 1 here.

if let s = s {
    print(s)
}


/*:
 ---
## 2. Counting nils

The `generateRandomArrayOfIntsAndNils` function creates an array that is a random mix of Int values and nils. 
 
Write code that counts the number of nil values in array1
*/

let array1: [Int?]
array1 = generateRandomArrayOfIntsAndNils()

var total: Int = 0

// Your code for question 2 here

for value: Int? in array1 {
    if value == nil {
        total += 1
    }
}


/*:
 ---
## 3. Mean

Write code that calculates the mean value of the non nil elements in array1.
*/
let array2: [Int?] = generateRandomArrayOfIntsAndNils()

var sumOfNotNilElements = 0
var numberOfNotNilElements = 0
var mean = 0.0

for value: Int? in array2 {
    if let value = value {
        sumOfNotNilElements += value
        numberOfNotNilElements += 1
    }
}

if numberOfNotNilElements > 0 {
    mean = Double(sumOfNotNilElements) / Double (numberOfNotNilElements)
}


/*:
 ---
## 4. New Array

 Write code that adds values to the array named nilFree3 so that it has the same elements
 as array3, except without the nil values. The elements in nilFree3 should be
 Ints, not Int optionals.
 
*/

let array3: [Int?] = generateRandomArrayOfIntsAndNils()
var nilFree3 = [Int]()

// Your code for question 4 here.

for value: Int? in array3 {
    if let value = value {
        nilFree3.append(value)
    }
}

/*:
 ---
## 5. Sort array

 Write code that will sort array4 using your own logic. You might want to
 review the logic for Selection Sort or even Bubble Sort. Find a sort
 algorithm that you like in a language that you are familiar with and then
 translate it to Swift. Resist the temptation to find a sort online that
 is already written in swift. Do not use Swift's sort method.

 Note that array4 is declared with var, so that it is a mutable array.
*/
 
var array4: [Int?] = generateRandomArrayOfIntsAndNils()

// Your code for question 5 here.

//Get rid of nil values in a new array nilFree4
var nilFree4 = [Int]()
for value: Int? in array4 {
    if let value = value {
        nilFree4.append(value)
    }
}

//Sort array nilFree4
let n = nilFree4.count
if n > 0 {
    // One by one move boundary of unsorted subarray
    for i in 0..<n-1 {
        // Find the minimum element in unsorted array
        var min_idx = i
        for j in i+1..<n {
            if nilFree4[j] < nilFree4[min_idx] {
                min_idx = j
            }
        }
        // Swap the found minimum element with the first element
        var temp = nilFree4[min_idx]
        nilFree4[min_idx] = nilFree4[i]
        nilFree4[i] = temp
    }
}



