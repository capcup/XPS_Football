start:- 
    write('Hello, what is your name? '),
    read(Name),
    nl,
    asserta(name(Name)),
    get_names(Name),
    nl.


:- dynamic(name/1).


get_names(Name):-
    name(Name),
    format('Hello ~w', Name).
    

undo :- 
	retract(name(_)), 
	fail.
undo.
