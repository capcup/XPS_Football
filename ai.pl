team(fc_barcelona, spain).
team(real_madrid, spain).
team(bayern_muenchen, germany).
team(schalke_04, germany).

player(messi).
player(iniesta).
player(benzema).
player(lewandowski).

info(fc_barcelona, [messi,suarez], test).
info(fc_barcelona, iniesta,test).

team_info(X, Y):-
    team(X, Y),
    format('Team ~w is from ~w', [X,Y]),
    nl,
    fail.
team_info(_).


print_info(X):-
    info(X, Y,_),
    write('Player: '),
	write(Y),
    nl,
    fail.
print_info(_).



start:- 
    write('Hello, what is your name? (in lower case) '),
    read(Name),
    nl,
    asserta(name(Name)),
    format('Hello ~w', Name),
    nl.


:- dynamic(name/1).


undo :- 
	retract(name(_)), 
	fail.
undo.
