team_countries([spain, germany, england, italy]).

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
    print_array(X,1).

print_array([],_).
print_array([H|T],Counter):-
    format('~0f. ~w ~n', [Counter,H]),
    N is Counter+1,    
    print_array(T,N).


teams_output:-
    choice_country(X),
    print_teams(X).

print_teams(Country):-
    team(Team,Country,_,_),
    format('~w ~n', Team),
    fail.
print_teams(_).



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
    nl,
    ask_country(),
    verify_country(),
    ask_team().


/*hypotheses to be tested */
hypothesize(messi) :- 
    verify(spain),
	verify(fc_barcelona),
	verify(messi),
    print_info(messi),
	!.


ask_country() :-
	write('In which country the team is located?: '),
    nl,
	countries_output(),
    read(Response),
    nl,
    asserta(choice_country(Response)).

ask_team() :-
    write('For which team does the player play?: '),
    nl,
    teams_output().

:- dynamic(name/1, choice_country/1).

verify_country() :-
	(
        choice_country(S),
		team(_,S,_,_)
	->
		true 
	;
		write('The country you typed in does not exist in the database.'),
        nl,
        ask_country()
	).
	


undo :- 
	retract(name(_)), 
	fail.
undo.
