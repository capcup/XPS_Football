:-[db].


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

players_output:-
    choice_country(X),
    choice_team(Y),
    print_filtered_player(X,Y).

print_filtered_player(Country, Team):-
    player(Player,_,_,_,Team,Country),
    format('~w ~n', Player),
    fail.
print_filtered_player(_,_).


% print information 

team_info(X, Y):-
    team(X, Y),
    format('Team ~w is from ~w ~n', [X,Y]),
    fail.
team_info(_).

print_info(X):-
    player(X, Pos, Mv, Country,_,_),
    format('~w plays in the position of the ~w. ~n', [X,Pos]),
    format('He plays for ~w and his market value is ~0f Mio. Euro. ~n', [Country,Mv]),
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
    ask_team(),
    ask_player(),
    
    undo.


ask_country() :-
	write('In which country the team is located?: '),
    nl,
	countries_output(),
    read(Response),
    nl,
    asserta(choice_country(Response)),
    verify_country().

ask_team() :-
    write('For which team does the player play?: '),
    nl,
    teams_output(),
    read(Response),
    nl,
    asserta(choice_team(Response)),
    verify_team().

ask_player():-
    write('Which player would you like to receive information about?'),
    nl,
    players_output(),
    read(Response),
    nl,
    asserta(choice_player(Response)),
    verify_player().



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
        retract(choice_country(_)),
        ask_country()
	).


verify_team() :-
	(
        choice_team(T),
        choice_country(C),
		team(T,C,_,_)
	->
		true 
	;
		write('The Team you typed in does not exist in the database.'),
        nl,
        ask_team()
	).

verify_player() :-
	(
        choice_team(T),
        choice_country(C),
        choice_player(P),
		player(P,_,_,_,T,C),
        print_info(P)
	->
		true 
	;
		write('The Player you typed in does not exist in the database.'),
        nl,
        ask_player()
	).

undo :- 
	retract(name(_)), 
	fail.
undo:-
    retract(choice_country(_)),
    fail.
undo:-
    retract(choice_team(_)),
    fail.
undo:-
    retract(choice_player(_)),
    fail.
undo.
