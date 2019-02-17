team_countries([spain,germany]).

team(fc_barcelona, spain, 1170, 1).
team(real_madrid, spain, 973, 3).
team(atletico_madrid, spain, 908, 2).
team(bayern_muenchen, germany, 745, 2).
team(borussia_dortmund, germany, 556, 1).
team(borussia_MGladbach, germany, 275 ,3).

player(messi, forward, 160, argentina).
player(suarez, forward, 60, uruguay).
player(coutinho, midfield, 140, brazil).
player(benzema, forward, 40, france).
player(lewandowski, forward, 70, poland).


% Database end 

countries_output():-
    team_countries(X),
    print_countries(X,1).

print_countries([],_).
print_countries([H|T],X):-
    format('~0f . ~w ~n', [X,H]),
    N is X+1    
    print_countries(T,N),


team_info(X, Y):-
    team(X, Y),
    format('Team ~w is from ~w ~n', [X,Y]),
    fail.
team_info(_).

print_info(X):-
    player(X, Pos, Mv, Country),
    format('~w plays in the position of the ~w. ~n', [X,Pos]),
    format('He plays for ~w and his market value is ~0f Mio. Euro ~n', [Country,Mv]),
    fail.
print_info(_).








% functions end


start:- 
    write('Hello, what is your name? (in lower case) '),
    read(Name),
    nl,
    asserta(name(Name)),
    format('Hello ~w', Name),
    nl.


/*hypotheses to be tested */
hypothesize(messi) :- 
    verify(spain),
	verify(fc_barcelona),
	verify(messi),
    print_info(messi),
	!.


ask_country() :-
	write('In which country is the team of the player: '),
	print_countries().
	%read(Response),

:- dynamic(name/1, yes/1, no/1).

verify(S) :-
	(
		yes(S)
	->
		true 
	;
		( 
			no(S)
		->
			fail 
		;
			ask(S) 
		)
	).
	


undo :- 
	retract(name(_)), 
	fail.
undo.
