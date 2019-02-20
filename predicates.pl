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

% questions and answers 
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


% checks if input of the user exists 
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
    
    % print team and value 
    output_nameNvalue([],[]).
    output_nameNvalue([H1|T1],[H2|T2]):-
        format('~w has a market value of ~0f Mio. Euro ~n', [H1,H2]),
        output_nameNvalue(T1,T2).


    % helper functions to get the max value of a list
    accMax([H|T],A,Max) :- H > A,
            accMax(T,H,Max).
    accMax([H|T],A,Max) :- H =< A,
            accMax(T,A,Max).
    accMax([],A,A).

    max(List,Max) :- 
        List = [H|_],
        accMax(List,H,Max).