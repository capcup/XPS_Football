% start Database

team_countries(["Spain", "Germany", "England", "Italy"]).

% teams
team("FC Barcelona", "Spain", 1170, 1).
team("Real Madrid", "Spain", 973, 3).
team("Atletico Madrid", "Spain", 908, 2).

team("Bayern Muenchen", "Germany", 745, 2).
team("Borussia Dortmund", "Germany", 556, 1).

team("Manchester City", "England", 1130, 1).
team("Liverpool", "England", 926, 2).
team("Tottenham", "England", 801, 3).

team("Juventus", "Italy", 797, 1).
team("Neapel", "Italy", 521 ,2).
team("Inter Milan", "Italy", 582 ,3).

% players
player("Messi", "Forward", 160, "Argentina","FC Barcelona","Spain").
player("Suarez", "Forward", 60, "Uruguay","FC Barcelona","Spain").
player("Coutinho", "Midfield", 140, "Brazil","FC Barcelona","Spain").
player("Benzema", "Forward", 40, "France", "Real Madrid", "Spain").
player("Bale", "Forward", 80, wales, "Real Madrid", "Spain").
player("Ramos", "Defense", 30, "Spain", "Real Madrid", "Spain").
player("Griezmann", "Forward", 150, "France", "Atletico Madrid", "Spain").
player("Koke", "Midfield", 70, "Spain", "Atletico Madrid", "Spain").
player("Thomas", "Midfield", 40, "Ghana", "Atletico Madrid", "Spain").

player("Lewandowski", "Forward", 70, "Poland", "Bayern Muenchen", "Germany").
player("Neuer", "Goalkeeper", 22, "Germany", "Bayern Muenchen", "Germany").
player("Rodriguez", "Midfield", 65, "Columbia", "Bayern Muenchen", "Germany").
player("Goetze", "Midfield", 18, "Germany", "Borussia Dortmund", "Germany").
player("Reus", "Midfield", 50, "Germany", "Borussia Dortmund", "Germany").
player("Alcacer", "Forward", 40, "Spain", "Borussia Dortmund", "Germany").

player("Aguero", "Forward", 75, "Argentina", "Manchester City", "England").
player("Sane", "Forward", 100, "Germany", "Manchester City", "England").
player("De Bruyne", "Midfield", 150, "Belgium", "Manchester City", "England").
player("Firmino", "Forward", 80, "Brazil", "Liverpool", "England").
player("Salah", "Forward", 150, "Egypt", "Liverpool", "England").
player("Van Dijk", "Defense", 75, "Belgium", "Liverpool", "England").
player("Kane", "Forward", 150, "England", "Tottenham", "England").
player("Eriksen", "Midfield", 80, "Denmark", "Tottenham", "England").
player("Alli", "Midfield", 100, "England", "Tottenham", "England").

player("Dybala", "Forward", 110, "Argentina", "Juventus", "Italy").
player("Cristiano Ronaldo", "Forward", 100, "Portugal", "Juventus", "Italy").
player("Chiellini", "Defense", 10, "Italy", "Juventus", "Italy").
player("Mertens", "Forward", 30, "Belgium", "Neapel", "Italy").
player("Insigne", "Forward", 75, "Italy", "Neapel", "Italy").
player("Callejon", "Forward", 20, "Spain", "Neapel", "Italy").
player("Perisic", "Forward", 40, "Croatia", "Inter Milan", "Italy").
player("Velero", "Midfield", 4, "Spain", "Inter Milan", "Italy").
player("Icardi", "Forward", 100, "Argentina", "Inter Milan", "Italy").