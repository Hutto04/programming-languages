/**
 * PetStore.scala
 *
 * This file contains the implementation of a Pet Store simulation.
 * It defines an animal hierarchy with abstract classes for animals, felines, and canines.
 * It also defines a staff hierarchy with abstract classes for staff members.
 * The simulation includes a clock to keep track of the day and hour, and simulates the actions of the manager and clerk throughout the day.
 * The clerk is responsible for feeding, playing, and selling animals.
 * The manager is responsible for opening and closing the store.
 * The simulation runs for three days, with each day consisting of multiple hours.
 * During each hour, different actions are performed based on the time.
 * The simulation outputs the actions performed during each hour.
 * 
 * Author: William Hutto
 * Date: 03/16/2024
 * Class: Programming Languages, Spring 2024
 */
import scala.collection.mutable.Buffer
import scala.util.Random

// **Animal hierarchy**
abstract class Animal(val name: String) {
    def sleep(): Unit = println(s"$name is sleeping.")
    def eat(): Unit // Abstract method in Animal
    def play(): Unit // Abstract method in Animal 
    def makeNoise(): Unit // Abstract method in Animal 
}



 //An abstract class representing a Feline.
abstract class Feline(name: String) extends Animal(name) {
   
    def eat(): Unit = println(s"$name the Feline is eating.")// Makes the Feline eat.
    
    def play(): Unit = println(s"$name the Feline is playing.")// Makes the Feline play.
    
    override def makeNoise(): Unit = println(s"$name the Feline meows!")// Makes the Feline make noise.
}

abstract class Canine(name: String) extends Animal(name) {
    def eat(): Unit = println(s"$name the Canine is eating.")// Makes the Canine eat.
    def play(): Unit = println(s"$name the Canine is playing.")// Makes the Canine play.
    override def makeNoise(): Unit = println(s"$name the Canine barks!")// Makes the Canine make noise.
}

class Cat(name: String) extends Feline(name)// A class representing a Cat.
class Dog(name: String) extends Canine(name)// A class representing a Dog.

// **Staff Hierarchy**
abstract class Staff(val name: String) {
    def arrive(): Unit // Abstract method in Staff
    def lunch(): Unit // Abstract method in Staff
    def leave(): Unit // Abstract method in Staff
}

class Manager(name: String) extends Staff(name) {
    def arrive(): Unit = println("0800: Manager arrives and opens the store.") // Prints the time and open store action.
    def lunch(): Unit = println("1200: Manager takes lunch.") // Prints the time and lunch action.
    def leave(): Unit = println("1800: Manager closes the store and leaves.") // Prints the time and leave action.
}

class Clerk(name: String) extends Staff(name) {
    def arrive(): Unit = println("0900: Clerk arrives.") // Prints the time and arrive action.
    def lunch(): Unit = println("1300: Clerk takes lunch.") // Prints the time and lunch action.
    def leave(): Unit = println("1700: Clerk leaves.") // Prints the time and leave action.

    // Methods for feeding, playing, and selling animals
    def feedAnimals(animals: Buffer[Animal]): Unit = {
    println("Clerk feeds the animals.")
    animals.foreach(_.eat())
  }
    def playAnimals(animals: Buffer[Animal]): Unit = {
    println("Clerk plays with the animals.")
    animals.foreach(_.play())
  }
    def sellAnimals(animals: Buffer[Animal]): Unit = {
    println("Clerk attempts to sell animals.")
    for(i <- animals.indices) {
        if (Random.nextInt(100) < 20) {
        val soldAnimal = animals(i)
        println(s"${soldAnimal.name} has been sold! A new ${soldAnimal.getClass.getSimpleName.toLowerCase} arrives.")
        animals.update(i, if (soldAnimal.isInstanceOf[Cat]) new Cat(s"NewCat${i}") else new Dog(s"NewDog${i}"))
        }
    }
  }
}

// **Clock and Simulation Control**
class Clock {
    var day = 1
    var hour = 8

    // Method to advance the hour and day
    def advanceHour(): Unit = {
        hour += 1
        if (hour > 18) {
            hour = 8
            day += 1
        }
    }
   // Getter methods for day and hour
    def getDay: Int = day
    def getHour: Int = hour
}

// **Store Simulation**
object PetStoreSimulation {
    // Create a buffer of animals
    val animals: Buffer[Animal] = Buffer(
    new Cat("Cookie"), new Cat("Whiskers"), new Cat("Mittens"),
    new Dog("Buddy"), new Dog("Max"), new Dog("Spot"))

    // Create a manager, clerk, and clock
    val manager = new Manager("The Manager")
    val clerk = new Clerk("The Clerk")
    val clock = new Clock()

    // Method to simulate a day
    def simulateDay(): Unit = {
        var day = clock.day
        var hour = clock.hour

        // Loop through the day and perform actions based on the time
        while (day <= 3) {
            println(s"--- Day $day - Hour $hour ---")
    
            hour match {
            case 8  => manager.arrive(); animals.foreach(_.makeNoise())
            case 9  => clerk.arrive(); clerk.feedAnimals(animals)
            case 11 => clerk.playAnimals(animals)
            case 12 => manager.lunch()
            case 13 => clerk.lunch()
            case 16 => clerk.sellAnimals(animals)
            case 17 => clerk.leave()
            case 18 => manager.leave(); animals.foreach(_.sleep())
            case _ => //catches hours with no actions
    }
            // Update day and hour after actions
            clock.advanceHour()
            day = clock.getDay
            hour = clock.getHour
        }
    }
        

    // Main method to run the simulation
    def main(args: Array[String]): Unit = {
        simulateDay() // Runs the simulation for 3 days
    }
}
