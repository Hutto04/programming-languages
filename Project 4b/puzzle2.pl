/**
 * puzzle2.pl
 *
 * This Prolog program solves a puzzle involving months, days, and names.
 * The program defines the domain of possible values for months and days,
 * as well as the possible names. It ensures that all selections are different
 * and encodes the given clues as constraints. The program then solves the puzzle
 * by finding a solution that satisfies all the constraints. Finally, it prints
 * the solution in a readable format.
 *
 * The puzzle consists of the following clues:
 * 1. Paula's day is not Saturday.
 * 2. Abigail's day is not Friday or Wednesday.
 * 3. If Abigail's month is February, her day is not Wednesday or Friday.
 * 4. Tara's month is not February, and her day is not Monday, Wednesday, Friday,
 *    Saturday, or Sunday.
 * 5. Tara's month is not December, and her day is not Saturday or Sunday.
 * 6. Mary's month is not December or July, and her day is not Saturday or Sunday.
 * 7. There is a person whose name is not important, and their month is June and
 *    their day is Sunday.
 * 8. Tara's month is July.
 * 9. Brenda's month is December.
 * 10. Mary's month is June.
 *
 * Usage:
 * ?- solve(Solution), print_solution(Solution).
 */


% Define the domain of possible values
month(march).
month(february).
month(july).
month(december).
month(june).

day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).
day(saturday).
day(sunday).

% Define possible names and ensure all selections are different
sister(paula).
sister(abigail).
sister(brenda).
sister(mary).
sister(tara).

% Ensure all are different
all_different([]).
all_different([H|T]) :- not(member(H, T)), all_different(T).

% Encoding the clues as constraints
solve(Solution) :-
    Solution = [ [abigail, AbigailMonth, AbigailDay],
                 [brenda, BrendaMonth, BrendaDay],
                 [mary, MaryMonth, MaryDay],
                 [paula, march, PaulaDay],
                 [tara, TaraMonth, TaraDay] ],

    % Define the domains
    month(AbigailMonth), month(BrendaMonth), month(MaryMonth), month(TaraMonth),
    all_different([AbigailMonth, BrendaMonth, MaryMonth, march, TaraMonth]),
    
    day(AbigailDay), day(BrendaDay), day(MaryDay), day(PaulaDay), day(TaraDay),
    all_different([AbigailDay, BrendaDay, MaryDay, PaulaDay, TaraDay]),

    % Clues encoded as constraints
    PaulaDay \= saturday,
    AbigailDay \= friday, AbigailDay \= wednesday,
    
    (AbigailMonth == february -> (AbigailDay \= wednesday, AbigailDay \= friday); true),
    
    TaraMonth \= february, TaraDay \= monday, TaraDay \= wednesday, TaraDay \= friday,
    TaraMonth \= december, TaraDay \= (saturday; sunday),
    
    MaryMonth \= december, MaryMonth \= july, MaryDay \= (saturday; sunday),
    
    member([_, june, sunday], Solution),
    
    TaraMonth == july,
    BrendaMonth == december,
    MaryMonth == june,
    
    findall(M, month(M), Months),
    findall(D, day(D), Days),
    all_different(Months),
    all_different(Days).

% Capitalization predicate
capitalize_first(Atom, Capitalized) :-
    atom_chars(Atom, [First|Rest]),
    upcase_atom(First, UpperFirst),
    atom_chars(Capitalized, [UpperFirst|Rest]).

% Helper predicate to print the solution
print_solution([]).
print_solution([[Name, Month, Day]|T]) :-
    capitalize_first(Name, CapitalizedName),
    capitalize_first(Month, CapitalizedMonth),
    capitalize_first(Day, CapitalizedDay),
    format('~w: ~w, ~w~n', [CapitalizedName, CapitalizedMonth, CapitalizedDay]),
    print_solution(T).


% Query to solve the puzzle
?- solve(Solution), print_solution(Solution).
