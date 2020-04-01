# Simple football expert system 

This expert system provides information about football players and teams.
The program starts by calling the ai_main.pl.

## Functionality

At the beginning, the database (db.pl) is loaded. Here are all the informations needed for the queries:
- team (country, market value and table space),
- players (position, market value, nationality, team, country of the team).

It also loads the file "predicates.pl", which provides "helper functions". 
These functions can also be queried by the user. 

## Process

At the beginning the user has to enter his name to use the further functionalities.
Next, information is requested that is needed to specify the player being searched for:

1. in which country does the player play?
2. for which team does the player play?

Then the user can choose between 3 players and decide which one he wants to have information about. 

## Used functions

:- info_player/0.
It will list all the players that the user can select over.
After selecting a player, Information about the player will be displayed.

:- info_team/0.
Displays all teams that the user can select over.
After selecting one team, Information about it will be displayed.

:- team_value/0.
This predicate is used to find the most valuable team in a country or 'all' countries.

:- player_value/0.
This predicate is used to find the most valuable player in a country or 'all' countries.

:- player_info/1. 
The parameter is the name of the player you want to receive information about.

:- team_info/1. 
The parameter is the name of the team you want to receive information about.