:-  ensure_loaded([db]),
    ensure_loaded([predicates]),
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

% for user: to get information about a certain player
info_player:-
    write('These are all players you can get information about: '),
    nl,
    list_players();
    write('Choose one player: '),
    read(Response),
    nl,
    player_info(Response).

info_team:-
    write('These are all teams you can get information about: '),
    nl,
    list_teams(),
    write('Choose one player: '),
    read(Response),
    nl,
    team_info(Response).

% print information team, player 
team_info(Team):-
    team(Team, Country,MarketV,Tableplace),
    format('~w is is a team from ~w and are currently ~w place ~n', [Team,Country, Tableplace]),
    format('The current market value is ~w Mio. Euro ~n', MarketV).


player_info(Name):-
    player(Name, Pos, Mv, Country,Team,_),
    format('~w plays for ~w in the position of the ~w. ~n', [Name,Team,Pos]),
    format('He plays for ~w and his market value is ~0f Mio. Euro. ~n', [Country,Mv]).


team_value :-
        countries_output,
        write('Choose the country from which you would like the team with the highest market value '),
        nl,
        write('(If you type all every country is considered)'),
        nl,
        write('Input please: '),
        read(Country),
        (
            Country == all
        -> 
            findall(X,team(_,_,X,_),MarketValue),
            findall(X,team(X,_,_,_),Team)
        ;
            findall(X,team(_,Country,X,_),MarketValue),
            findall(X,team(X,Country,_,_),Team)
        ),
        output_nameNvalue(Team,MarketValue),
        max(MarketValue, Max),
        team(MaxTeam,_,Max,_),
        format('~nSo the Team with the highest value is ~w ~n',MaxTeam),
        format('The value is ~0f Mio Euro', Max).

player_value :-
        countries_output,
        write('Choose the country from which you would like the player with the highest market value '),
        nl,
        write('(If you type all every country is considered)'),
        nl,
        write('Input please: '),
        read(Country),
        (
            Country == all
            %player(messi, forward, 160, argentina,fc_barcelona,spain)
        -> 
            findall(X,player(_,_,X,_,_,_),MarketValue),
            findall(X,player(X,_,_,_,_,_),Player),
            output_nameNvalue(Player,MarketValue),
            max(MarketValue, Max),
            player(MaxPlayer,_,Max,_,_,_)
        ;
            findall(X,player(_,_,X,_,_,Country),MarketValue),
            findall(X,player(X,_,_,_,_,Country),Player),
            output_nameNvalue(Player,MarketValue),
            max(MarketValue, Max),
            player(MaxPlayer,_,Max,_,_,Country)
        ),        
        format('~nSo the Player with the highest value is ~w ~n',MaxPlayer),
        format('The value is ~0f Mio Euro', Max).


:- dynamic(name/1, choice_country/1, choice_player/1, choice_team/1).

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
