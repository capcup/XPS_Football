team(fc_barcelona, spain).
team(real_madrid, spain).
team(bayern_muenchen, germany).
team(schalke_04, germany).

player(messi, forward, 160, argentina).
player(suarez, forward, 60, uruguay).
player(benzema, forward, 40, france).
player(lewandowski, forward, 70, poland).


info(fc_barcelona, messi, test).
info(fc_barcelona, iniesta,test).

team_info(X, Y):-
    team(X, Y),
    format('Team ~w is from ~w ~n', [X,Y]),
    fail.
team_info(_).

print_info(X):-
    info(X, Y,_),
    write('Player: '),
	write(Y),
    nl,
    fail.
print_info(_).




% Database end 

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
