% Guess the Number Game
% This Prolog program asks the user to guess a randomly selected number between 1 and 20.
% It provides feedback on whether the guess is too low, too high, or correct.
% The game ends when the correct number is guessed, and it reports the number of attempts.

:- use_module(library(random)). % Importing library for generating random numbers.

% Entry point of the program.
start :-
    random(1, 21, Secret), % Generates a random number between 1 and 20.
    writeln('Guess the number between 1 and 20.'),
    guess_number(Secret, 0). % Initial call to guess_number with 0 attempts so far.

% Core guessing logic.
guess_number(Secret, Attempts) :-
    read(Guess), % Reads user's guess from standard input.
    (   Guess == Secret -> % If guess is correct:
        Attempts1 is Attempts + 1, % Increment attempts count.
        format('Correct! The number was ~w. Total guesses: ~w.', [Secret, Attempts1]); % Print success message.
        % Handle incorrect guesses:
        Attempts1 is Attempts + 1, % Increment attempts count for each guess.
        (   Guess < Secret -> writeln('Too low. Try again.'); % If guess is too low.
            Guess > Secret -> writeln('Too high. Try again.') % If guess is too high.
        ),
        guess_number(Secret, Attempts1) % Recursive call with updated attempts.
    ).

% Note: This code is for educational purposes and demonstrates basic Prolog syntax and logic programming.
% URLs for citations:
% - SWI-Prolog documentation: https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)
% - Prolog Tutorial for Beginners: https://www.learnprolognow.org/
