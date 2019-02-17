% 1.2 a)
start:- 
    write('I believe that the patient have').


loves(peter, susi).
loves(hans, susi).
loves(hans, sabine).
loves(sabine, peter).
loves(susi, peter).
loves(susi, felix).
loves(felix, felix).
hates(sabine, hans).
hates(susi, sabine).

% zu 1.2 b)
love_love(X) :- loves(X,Y), loves(Y,X).
love_hate(X) :- loves(X,Y), hates(Y,X).
/* 1.2 b)
- loves(peter,susi).
- loves(susi,felix).
- loves(X, sabine). a
- loves(sabine, X). a
- love_each_other(X). a
- love_hate(X). a
*/

/* 1.3 trace DEBUGGING
- start trace : trace. 
- turn off: notrace.
*/

% 1.4 
sitsRightOf(markus,maren).
sitsRightOf(melanie,markus).
sitsRightOf(manuel,melanie).
sitsRightOf(monika,manuel).
sitsRightOf(martin,monika).
sitsRightOf(maren,martin).

% 1.4 a)b)

rightOf(X,Y):- sitsRightOf(X,Y).
neighboursOf(X):- sitsRightOf(X, Y), write(Y), sitsRightOf(Z, X), nl, write(Z).
oppositeOf(X):- sitsRightOf(X,Y), sitsRightOf(Y,Z), sitsRightOf(Z, V), 
nl,nl,write(X), write(' is opposite of '), write(V).

/*
- sitsRightOf(X, melanie).
- sitsRightOf(maren, X).
- neighboursOf(X)
*/

clear:- format('~c~s~c~s', [0x1b, "[H", 0x1b, "[2J"]). % issue CSI H CSI 2 J.

% 1.4 c)

leftOf(X,Y):-sitsRightOf(Y,X).
neighbour_of(X,Y):- rightOf(X,Y); rightOf(Y,X).
opposite_of(X,Y):- sitsRightOf(X,A), sitsRightOf(A,B), sitsRightOf(B, Y).

% 1.4 d)

/*
opposite_arb(X,Y).
opposite_arb(X,Y):- 
    sitsRightOf(X,Z),
    sitsRightOf(Z,X),
    sitsRightOf(Y,A),
    opposite_arb(X,A).
*/

%FEHLER!
opposite_arb(Start,X,X):- 
    X = Start, Y=Start.

opposite_arb(Start,Current,Y):-
    sitsRightOf(Current,L1),
    sitsRightOf(L1,L2),
    sitsRightOf(Y,Opposite),
    opposite_arb(Start,Current,Opposite).

