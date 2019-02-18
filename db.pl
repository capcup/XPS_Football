% start Database

team_countries([spain, germany, england, italy]).

% teams
team(fc_barcelona, spain, 1170, 1).
team(real_madrid, spain, 973, 3).
team(atletico_madrid, spain, 908, 2).

team(bayern_muenchen, germany, 745, 2).
team(borussia_dortmund, germany, 556, 1).

team(manchester_city, england, 1130, 1).
team(liverpool, england, 926, 2).
team(tottenham, england, 801, 3).

team(juventus, italy, 797, 1).
team(neapel, italy, 521 ,2).
team(inter_milan, italy, 582 ,3).

% players
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
player(neuer, goalkeeper, 22, germany, bayern_muenchen, germany).
player(rodriguez, midfield, 65, columbia, bayern_muenchen, germany).
player(goetze, midfield, 18, germany, borussia_dortmund, germany).
player(reus, midfield, 50, germany, borussia_dortmund, germany).
player(alcacer, forward, 40, spain, borussia_dortmund, germany).

player(aguero, forward, 75, argentina, manchester_city, england).
player(sane, forward, 100, germany, manchester_city, england).
player(debruyne, midfield, 150, belgium, manchester_city, england).
player(firmino, forward, 80, brazil, liverpool, england).
player(salah, forward, 150, egypt, liverpool, england).
player(vanDijk, defense, 75, belgium, liverpool, england).
player(kane, forward, 150, england, tottenham, england).
player(eriksen, midfield, 80, denmark, tottenham, england).
player(alli, midfield, 100, england, tottenham, england).

player(dybala, forward, 110, argentina, juventus, italy).
player(cronaldo, forward, 100, portugal, juventus, italy).
player(chiellini, defense, 10, italy, juventus, italy).
player(mertens, forward, 30, belgium, neapel, italy).
player(insigne, forward, 75, italy, neapel, italy).
player(callejon, forward, 20, spain, neapel, italy).
player(perisic, forward, 40, croatia, inter_milan, italy).
player(velero, midfield, 4, spain, inter_milan, italy).
player(icardi, forward, 100, argentina, inter_milan, italy).