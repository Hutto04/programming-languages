// Define a class called Person with a string attribute for the name
class Person(var name: String)

object StepOne {
  def main(args: Array[String]): Unit = {

	// Step 2: Create an instance of Person using your first name as the instance name. 
	val person = new Person("William")

	// Step 3: Set that instance's name to your first and last name. 
	person.name = "William Hutto"

	// Step 4: Display your name from the object
	println(person.name)

	// Step 5: Sort and display your name’s characters in alphabetical order
	println(person.name.toCharArray.sorted.mkString)

	// Step 6: Reverse and display your name
	println(person.name.reverse)

	// Step 7: Sort and display your name in reverse alphabetical order
	println(person.name.toCharArray.sorted.reverse.mkString)
	}
}