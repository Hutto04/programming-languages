/**
* Scala Exploration: Step 2
* Define a class called SixLittle with methods to ask for words, prepare tokens, and display the game board
* Create an instance of SixLittle
* Run the game
* Author: William Hutto
* Date: 3/13/2024
* Class: Programming Languages
* Citations: https://docs.scala-lang.org/
*            https://www.geeksforgeeks.org/scala-programming-language/
*            https://www.tutorialspoint.com/scala/index.htm
*/

import scala.io.StdIn.readLine
import scala.util.Random

// Represents a game of Six Little Words.
class SixLittle {
    private var words = List.empty[String]
    private var hints = List.empty[String]
    private var tokens = List.empty[String]

    // Asks the user to enter six words and their hints.
    def Ask(): Unit = {
        for (i <- 1 to 6) {
            println(s"Enter word #$i (at least 4 characters): ")
            var word = readLine().trim

            // Keep asking until a valid word is entered
            while (word.length < 4) {
                println("Word is too short. Please enter a word with at least 4 characters: ")
                word = readLine().trim
            }

            println(s"Enter a hint for word #$i: ")
            val hint = readLine().trim

            words = words :+ word
            hints = hints :+ hint
        }
    }

    // Prepares the tokens by splitting each word into two halves and shuffling them.
    def Prepare(): Unit = {
        tokens = words.flatMap { word =>
            val half = word.length / 2
            val (start, end) = word.splitAt(half)
            List(start.toUpperCase, end.toUpperCase)
        }

        tokens = Random.shuffle(tokens)
    }

    // Displays the game board with partial words, hints, and answer key.
    def Display(): Unit = {
        println("\nSix Little Words (Scala)")
        println("Partial Words:")
        tokens.grouped(4).foreach(group => println(group.padTo(4, " ").mkString("\t")))
        println("\nHINTS:")
        hints.zipWithIndex.foreach { case (hint, index) => println(s"${index + 1}. $hint") }
        println("\nANSWER KEY:")
        words.grouped(3).foreach(line => println(line.mkString("\t")))
        println()
    }

    // Runs the game by asking for words, preparing tokens, and displaying the game board.
    def Run(): Unit = {
        words = List.empty
        hints = List.empty
        tokens = List.empty
        Ask()
        Prepare()
        Display()
    }
}

// The entry point of the program.
@main def main(): Unit ={
        val game = new SixLittle
        game.Run()
}
