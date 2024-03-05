friend(grizzly_bear).
friend(moose).
friend(seal).
friend(zebra).

author(joanne).
author(lou).
author(ralph).
author(winnie).

adventure(circus).
adventure(rockband).
adventure(spaceship).
adventure(train).

solve :-
    friend(JoannesFriend), 
    friend(LousFriend), 
    friend(RalphsFriend), 
    friend(WinniesFriend),
    all_different([JoannesFriend, LousFriend, RalphsFriend, WinniesFriend]),
    
    adventure(JoannesAdventure), 
    adventure(LousAdventure), 
    adventure(RalphsAdventure), 
    adventure(WinniesAdventure),
    all_different([JoannesAdventure, LousAdventure, RalphsAdventure, WinniesAdventure]),
    
    Triples = [ [joanne, JoannesFriend, JoannesAdventure],
                [lou, LousFriend, LousAdventure],
                [ralph, RalphsFriend, RalphsAdventure],
                [winnie, WinniesFriend, WinniesAdventure]
              ],
                
    % The seal isn't a creation of joanne nor lou
    \+ member([joanne, seal,_], Triples),
    \+ member([lou, seal, _], Triples),
    
    % Neither rode to the moon in spaceship nor took a trip around the world in train
    \+ member([_, seal, spaceship], Triples),
    \+ member([_, seal, train], Triples),
    
    % joanne's imaginary friend who isn't a grizzly bear went to the circus
    \+ member([joanne, grizzly_bear, _], Triples),
    member([joanne, _, circus], Triples),
    
    % winnie's imaginary friend is a zebra
    member([winnie, zebra, _], Triples),

    % The grizzly bear didn't board the spaceship to the moon
    \+ member([_,grizzly_bear,spaceship], Triples),
    
    tell(joanne, JoannesFriend, JoannesAdventure),
    tell(lou, LousFriend, LousAdventure),
    tell(ralph, RalphsFriend, RalphsAdventure),
    tell(winnie, WinniesFriend, WinniesAdventure).

all_different([]).
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).

capitalize_first(Atom, Capitalized) :-
    atom_chars(Atom, [First|Rest]),
    upcase_atom(First, UpperFirst),
    atom_chars(Capitalized, [UpperFirst|Rest]).


tell(X, Y, Z) :-
    capitalize_first(X, CapitalizedX),
    format_animal(Y, FormattedAnimal),
    format_adventure(Z, FormattedAdventure),
    format('~w\'s imaginary friend is a ~w. Their adventure involved a ~w.\n', [CapitalizedX, FormattedAnimal, FormattedAdventure]).

    
    format_animal(Animal, FormattedAnimal) :-
        replace_underscore_with_space(Animal, FormattedAnimal).
    
    replace_underscore_with_space(Animal, FormattedAnimal) :-
        sub_atom(Animal, _, _, _, '_'), !,
        atomic_list_concat(SplitAnimal, '_', Animal),
        atomic_list_concat(SplitAnimal, ' ', FormattedAnimal).
    replace_underscore_with_space(Animal, Animal).
    
    format_adventure(Adventure, FormattedAdventure) :-
        replace_underscore_with_space(Adventure, FormattedAdventure).

% Query to solve the puzzle
?- solve.