/*
Description: This is a simple implementation of a two dimensional list in Io. 
It includes methods to allocate a list of y lists that are x elements long, initializing 
them to 0, set the value at the given x, y, retrieve the value at the given
Author: William Hutto
Date: 2024-02-04
*/

// Define the Two Dimensional List prototype with all methods
TwoDList := Object clone 
    
// Method to allocate a list of y lists that are x elements long, initializing them to 0
TwoDList dim := method(x, y,
    list = List clone  // Clear or initialize the list
    for(i, 0, y - 1,
        row := List clone
        // Manually fill the row with zeros
        for(j, 0, x - 1,
            row append(0)
        )
        // Append the filled row to the list
        list append(row)
    )
)

// Method to set the value at the given x, y
TwoDList set := method(x, y, value,
    if(list at(y) != nil, list at(y) atPut(x, value))

)

// Method to retrieve the value at the given x, y
TwoDList get := method(x, y,
    if(list at(y) != nil, list at(y) at(x), nil)
)

// Method to return a transposed two dimensional list
TwoDList transpose := method(
    newX := list size
    newY := list first size
    newMatrix := TwoDList clone
    newMatrix dim(newX, newY)
    for(i, 0, newY - 1,
        for(j, 0, newX - 1,
            newValue := self get(i, j)
            newMatrix set(j, i, newValue)
        )
    )
    return newMatrix
)

// Method to pretty print the 2D list
TwoDList prettyPrint := method(
    list foreach(row, 
        rowStr := row join(" ")
        writeln(rowStr)
    )
)

// Create a new instance of TwoDList
myList := TwoDList clone

// Allocate a 3x4 list of randomized non-zero integers
myList dim(3, 4)
for(i, 0, 2,
    for(j, 0, 3,
        randomValue := Random value(1, 100) floor + 1
        myList set(i, j, randomValue)
    )
)

// Set the value 
myList set(2, 0, 3)

// Print the list
myList list println  // 'list' is the property holding the actual 2D list structure

// Print the transposed list
transposedList := myList transpose
transposedList list println  // 'list' is the property holding the actual 2D list structure
// Print the original list in a readable format
writeln("Original List:")
myList prettyPrint()

// Print the transposed list in a readable format
writeln("\nTransposed List:")
transposedList prettyPrint()
