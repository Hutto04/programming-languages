=begin
  Author: William Hutto
  Date: 1/21/2024
  File: Step3.rb
  Description: 
    This program enerates a random number between 1 and 20 and asks the user to guess the number. 
    It provides feedback to the user if their guess is correct, too low, or too high.
    The program ends when the correct number is guessed.

  URLS:
    https://ruby-doc.org/3.2.2/stdlibs/securerandom/SecureRandom.html#method-c-gen_random
=end

require 'securerandom'

# Generate a random number between 1 and 20
correct_number = SecureRandom.random_number(1..20)

# Loop until the correct number is guessed
loop do
    # Ask the user to enter their guess
    puts "Guess a number between 1 and 20:"
    guess = gets.chomp.to_i

    # Check if the guess is correct, too low, or too high
    if guess == correct_number
        puts "Congratulations! You guessed the correct number."
        break
    elsif guess < correct_number
        puts "Too low. Try again."
    else
        puts "Too high. Try again."
    end
end
