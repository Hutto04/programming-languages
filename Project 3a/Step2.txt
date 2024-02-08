/* 
Description: A simple number guessing game written in Io.
The user is prompted to guess a number between 1 and 20.
The program informs the user if their guess is too low, too high, or correct.
The game ends when the correct number is guessed.
Author: William Hutto
Date: 02/04/2024
*/

"Guess a number between 1 and 20." println

targetNumber := (Random value * 20) floor + 1  // Generate a random number between 1 and 20 as the target number.
guess := 0  // Initialize the guess variable.

while(guess != targetNumber,  // Continue the loop until the guess matches the target number.
    guess = (File standardInput readLine("Your guess: ") asNumber floor)  // Read the user's guess from the standard input.

    if(guess < targetNumber,  // Check if the guess is lower than the target number.
        "Too low. Try again." println,  // Print a message indicating that the guess is too low.
    if(guess > targetNumber,  // Check if the guess is higher than the target number.
        "Too high. Try again." println,  // Print a message indicating that the guess is too high.
        "Correct! The number was " .. targetNumber .. "." println  // Print a message indicating that the guess is correct.
    ))
)

"Thank you for playing!" println  // Print a message to thank the user for playing.
