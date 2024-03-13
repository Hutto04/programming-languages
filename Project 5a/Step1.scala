/* 
* Scala Exploration: Step 1
* Define a class called Person with a string attribute for the name
* Create an instance of Person
* Set that instance's name to your first and last name.
* Display your name from the object
* Sort and display your name’s characters in alphabetical order
* Reverse and display your name
* Sort and display your name in reverse alphabetical order
* Author: William Hutto
* Date: 3/13/2024
* Class: Programming Languages
 */

// Define a class called Person with a string attribute for the name
class Person(var name: String)


@main def main(): Unit = { 

	// Create an instance of Person using your first name as the instance name. 
	val person = new Person("William")

	// Set that instance's name to your first and last name. 
	person.name = "William Hutto"

	// Display your name from the object
	println(person.name)

	// Sort and display your name’s characters in alphabetical order
	println(person.name.toCharArray.sorted.mkString)

	// Reverse and display your name
	println(person.name.reverse)

	// Sort and display your name in reverse alphabetical order
	println(person.name.toCharArray.sorted.reverse.mkString)
}