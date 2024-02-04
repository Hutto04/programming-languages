/*
Author: William Hutto
Date: 02/04/2024
Description: This is a simple example of a program written in the Io programming language. The program creates a 
`Person` object and sets the `name` slot of the object to a string value. It then converts the value of the `name` 
slot to a list, sorts the list in ascending order, and joins the elements of the sorted list into a single string.
The program then reverses the order of the elements in the sorted list, joins the elements of the reversed list into
a single string, and prints the original, sorted, and reversed sorted strings.
Citiation: https://iolanguage.org/
*/

//**Person** is an object that represents a person. It has a `name` slot which can be set to a string value.
Person := Object clone

//**name** is a slot of the `Person` object that stores the name of the person. It is initially set to `nil`.
Person name := nil 

//**William** is a clone of the `Person` object.
William := Person clone

//Set the `name` slot of the `William` object to 'William Hutto'.
William name := "William Hutto"

//Print the message 'Your name is: ' followed by the value of the `name` slot of the `William` object.
"Your name is: " print; William name println

//Convert the value of the `name` slot of the `William` object to a list.
nameList := William name asList

//Sort the `nameList` in ascending order.
sortedNameList := nameList sort

//Join the elements of the `sortedNameList` into a single string.
sortedName := sortedNameList join("")

//Print the message 'Sorted name: ' followed by the `sortedName`.
"Sorted name: " print; sortedName println

//Reverse the order of the elements in the `sortedNameList`.
reversedSortedNameList := sortedNameList reverse

//Join the elements of the `reversedSortedNameList` into a single string.
reversedSortedName := reversedSortedNameList join("")

//Print the message 'Reversed sorted name: ' followed by the `reversedSortedName`.
"Reversed sorted name: " print; reversedSortedName println
