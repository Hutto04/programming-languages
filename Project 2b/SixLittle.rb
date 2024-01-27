=begin
    Name: William Hutto
    Course: CPSC 4135
    Semester: Spring 2024
    Instructor: Bruce Montgomery
    Project name: SixLittle.rb
    Description: This program is a Ruby program that takes in six pairs of string inputs (at least 4 chars)
    followed by a related hint string (of any length). The program creates an instance of the SixLittle class
    and calls its methods to process the input, prepare the tokens, and display the results.
=end

class SixLittle
  attr_accessor :words, :hints, :tokens

  # Initializes a new instance of the class.
  # https://www.geeksforgeeks.org/the-initialize-method-in-ruby/
  def initialize
    @words = []
    @hints = []
    @tokens = []
  end

  # Prompts the user to enter 6 words and their corresponding hints.
  # Each word must have a minimum length of 4 letters.
  # Stores the entered words and hints in instance variables @words and @hints.
  def ask
    6.times do
      begin
        print "Enter a word (min 4 letters): "
        # https://www.geeksforgeeks.org/ruby-string-chomp-method/?ref=ml_lbp
        word = gets.chomp
      end until word.length >= 4
      print "Enter a hint for '#{word}': "
      hint = gets.chomp

      @words << word
      @hints << hint
    end
  end

  # Prepares the tokens by splitting each word into two parts.
  # The first part is added to the tokens array in uppercase.
  # The second part is added to the tokens array in uppercase.
  # The tokens array is then shuffled.
  def prepare
    @words.each do |word|
      mid = (word.length / 2.0).ceil
      @tokens << word[0...mid].upcase
      @tokens << word[mid..-1].upcase
    end
    # https://www.geeksforgeeks.org/ruby-array-shuffle-function/?ref=ml_lbp
    @tokens.shuffle!
  end

  # Displays the Six Little Words game in the console.
  
  
  def display
    puts "\nSix Little Words (Ruby)"
    puts "\nPartial Words:"
    # https://www.geeksforgeeks.org/ruby-array-slice-function/?ref=header_search
    # https://rubydoc.info/stdlib/core/Enumerable:each_slice
    @tokens.each_slice(4) { |slice| puts slice.join(" ") }
    puts "\nHints:"
    @hints.each { |hint| puts hint }
    puts "\nAnswer Key:"
    @words.each_slice(3) { |slice| puts slice.join(" ") }
    puts
  end

  # Clears the words, hints, and tokens arrays.
  # Asks the user for words and hints, prepares the tokens, and displays the game.
  def run
    @words.clear
    @hints.clear
    @tokens.clear
    ask
    prepare
    display
  end
end
  
  # Script to run the program
  game = SixLittle.new
  game.run
  