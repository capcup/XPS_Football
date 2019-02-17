% start Database
team_countries([spain, germany, england, italy]).

% ---------------------------------------------------------------------------

team(fc_barcelona, spain, 1170, 1).
team(real_madrid, spain, 973, 3).
team(atletico_madrid, spain, 908, 2).
team(bayern_muenchen, germany, 745, 2).
team(borussia_dortmund, germany, 556, 1).
team(moenchengladbach, germany, 275 ,3).
team(manchester_city, england, 1130, 1).
team(liverpool, england, 926, 2).
team(tottenham, england, 801, 3).
team(juventus, italy, 797, 1).
team(neapel, italy, 521 ,2).
team(inter_milan, italy, 582 ,3).

player(messi, forward, 160, argentina,fc_barcelona,spain).
player(suarez, forward, 60, uruguay,fc_barcelona,spain).
player(coutinho, midfield, 140, brazil,fc_barcelona,spain).
player(benzema, forward, 40, france, real_madrid, spain).
player(bale, forward, 80, wales, real_madrid, spain).
player(ramos, defense, 30, spain, real_madrid, spain).
player(griezmann, forward, 150, france, atletico_madrid, spain).
player(koke, midfield, 70, spain, atletico_madrid, spain).
player(thomas, midfield, 40, ghana, atletico_madrid, spain).

player(lewandowski, forward, 70, poland, bayern_muenchen, germany).