% This Prolog file contains predicates related to manipulating and sorting names.
% William Hutto
% Programming Languages



% Define the variable Name with your first and last name
name(williamhutto).

% Predicate to sort and return name's characters in alphabetical order
sort_name_chars_sorted(Name, SortedChars) :-
    name(Name),                      % Retrieve the name
    atom_chars(Name, Chars),         % Convert name to list of characters
    msort(Chars, SortedChars).        % Sort the characters


% Predicate to reverse the characters of a name
reverse_name(Name, ReversedName) :-
    name(Name),                      % Retrieve the name
    atom_chars(Name, Chars),         % Convert name to list of characters
    reverse(Chars, ReversedChars),   % Reverse the characters
    atom_chars(ReversedName, ReversedChars). % Convert reversed characters to atom


% Predicate to sort the characters of a name in reverse order
reverse_sort_name(Name, ReverseSortedName) :-
    name(Name),                            % Retrieve the name
    atom_chars(Name, Chars),               % Convert name to list of characters
    msort(Chars, SortedChars),              % Sort the characters
    reverse(SortedChars, ReverseSortedChars), % Reverse the sorted characters
    atom_chars(ReverseSortedName, ReverseSortedChars). % Convert reversed sorted characters to atom
