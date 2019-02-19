:-  ensure_loaded([db]),
    write('This applies for every input:'),
    nl,
    write('Please make sure to answer in lower case and without quotation marks! Thank YOU'),
    nl,
    write('Hello, what is your name: '),
    read(Name),
    asserta(name(Name)).

start:- 
    name(Name),
    format('Hello ~w, this program provides (after a few queries) information about a football player.~n', Name),    
    ask_country(),
    ask_team(),
    ask_player(),
    format('I hope it was helpful for you ~w.', Name),
    undo.


% print countries, teams, players
countries_output():-
    team_countries(X),
    print_array(X).

print_array([]).
print_array([H|T]):-
    format('~w ~n', H),
    print_array(T).


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


% print information team, player 
team_info(Team):-
    team(Team, Country,MarketV,Tableplace),
    format('~w is is a team from ~w and are currently ~w place ~n', [Team,Country, Tableplace]),
    format('The current market value is ~w Mio. Euro ~n', MarketV).


player_info(Name):-
    player(Name, Pos, Mv, Country,Team,_),
    format('~w plays for ~w in the position of the ~w. ~n', [Name,Team,Pos]),
    format('He plays for ~w and his market value is ~0f Mio. Euro. ~n', [Country,Mv]).

list_players():-
    player(X,_,_,_,_,_),
    format('~w ~n', X),
    fail.
list_players(_).

list_teams():-
    team(X,_,_,_),
    format('~w ~n',X),
    fail.
list_teams().


% for user: to get information about a certain player
info_player():-
    write('These are all players you can get information about: '),
    nl,
    list_players();
    write('Choose one player: '),
    read(Response),
    nl,
    player_info(Response).

info_team():-
    write('These are all teams you can get information about: '),
    nl,
    list_teams(),
    write('Choose one player: '),
    read(Response),
    nl,
    team_info(Response).

% ask questions and answers 
ask_country() :-
	write('In which country is the team located for which the player plays?: '),
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



:- dynamic(name/1, choice_country/1, choice_player/1, choice_team/1).

% verify checks if input of the user exists 
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
        retract(choice_team(_)),
        ask_team()
	).

verify_player() :-
	(
        choice_team(T),
        choice_country(C),
        choice_player(P),
		player(P,_,_,_,T,C),
        player_info(P)
	->
		true 
	;
		write('The Player you typed in does not exist in the database.'),
        nl,
        retract(choice_player(_)),
        ask_player()
	).

end :-
    name(Name),
    write('I hope you enjoyed using this program '),
    write(Name),
    nl,
    write('Have a nice day!'),
    nl,
    retract(name(Name)),
    halt.

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
