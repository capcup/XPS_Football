append1([],L,L).
append1([H|T],L2,[H|L3]) :- append1(T,L2,L3).

prefix1(P,L) :- append(P,_,L).

suffix1(S,L) :- append(_,S,L).

sublist1(SubL,L) :- suffix1(S,L),prefix1(SubL,S).

naiverev([],[]).
naiverev([H|T],R) :- naiverev(T,RevT),append(RevT,[H],R).

accRev([H|T],A,R) :- accRev(T,[H|A],R). 
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).


a2b([],[]).
a2b([a|Ta],[b|Tb]) :- a2b(Ta,Tb).

% 4.1 Exercise

size_([],A,A).
size_([_H|T],A,Res):- Anew is A+1, size_(T,Anew,Res).

palind_([],[]).
palind_([H|T],[H|T2]):-
    palind_(T,T2).

palin(X):- rev(X,Y), palind_(X,Y).

% better 
palin_alt([]).
palin_alt([H|T]):-
    append(X,[H],T),
    palin_alt(X).

doubled_(X):- append(Tmp,Tmp,X).

%Write a predicate second(X,List) which checks whether X is the second element of List.

second(X,[_,Sec|_]):-
    X=:=Sec.

% Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2, except that the first two elements are exchanged.

%swap12([],[],[],[]).
swap12([H1,H2|T],[H3,H4|T1], A, B):-
    T =:= T1,
    append([H1,H2],T1,A),
    append([H3,H4],T,B).

swap_alt([H1,H2|T],[H3,H4|T1], A, B):-
    A = [H1,H2|T1],
    B = [H3,H4|T].


% Write a predicate final(X,List) which checks whether X is the last element of List.
final(X,Y):-
    rev(Y,A),
    [H|_] = A,
    X =:= H.

% says ‘no’ if inlist is a list containing fewer than 2 elements, and which deletes the first and the last elements of Inlist and returns the result as Outlist, when Inlist is a list containing at least 2 elements.
toptail([_|T],X):-
    append(X,[_],T).

% checks whether List1 is identical to List2, except that the first and last elements are exchanged
swapfl([H1|T1],[H2|T2]):-
    append(X,[H2],T1),
    append(X,[H1],T2).

% ----------------------------

% 4.2

color(red).
color(yellow).
color(green).

colorize(List):- 
color(C1),
color(C2),
C2 \== C1,
color(C3),
C3 \== C2,
C3 \== C1,
color(C4), 
C4 \==C2,
C4 \==C3,
List = [C1,C2,C3,C4].
    
    

% 4.3 a)
digit(0). digit(1). digit(2). digit(3). digit(4). digit(5). digit(6). digit(7).
digit(8). digit(9).

assigned_digits(A,B,C,D,E,F,G,H):-
    digit(A),digit(B),digit(C),digit(D),
    digit(E),digit(F),digit(G),digit(H),
    G\==0,
    \+ member(A,[B,C,D,E,F,G,H]),
    \+ member(B,[C,D,E,F,G,H]),
    \+ member(C,[D,E,F,G,H]),
    \+ member(D,[E,F,G,H]),
    \+ member(E,[F,G,H]),
    \+ member(F,[G,H]),
    \+ member(G,[H]).
    %write([A,B,C,D,E,F,G,H]),nl.
    

puzzle(A,B,C,D,E,F,G,H):-
    assigned_digits(A,B,C,D,E,F,G,H),    
    R1 is A*10+B +C,
    R1 is D*10+E,
    R2 is A*10+B -C,
    R2 is A*10+D,
    /*
    R3 is (D*100+F*10+B)/G,
    R3 is H*10+D,
    */
    C1 is (A*10+B)*(A*10+B),
    C1 is D*100+F*10+B,
    C2 is 2*C,
    C2 is G, 
    C3 is (D*10+E)+(A*10+D),
    C3 is H*10+D.

% 4.4
prefix_(P,L):- append(P,_,L).
suffix_(S,L):- append(_,S,L).
sublist_(SubL,L):- suffix_(S,L), prefix_(SubL,S).

sumL(L,X):- listsum(L,0,X).
listsum([],A,A).
listsum([H|T],A,Res):- Anew is A+H, listsum(T,Anew,Res).

psum(X,L):- sublist_(Y,L), sumL(Y,X).

% 4.5
% a)
printGap([]).
printGap([H|T]):- write(H), printGap(T).

formPra(X):-
    write('\n['),formattedPrinta(X).
formattedPrinta([]):- 
    write('\n]').
formattedPrinta([H|T]):-
    is_list(H),
    formPra(H),
    formattedPrinta(T).

formattedPrinta([H|T]):- 
    format('~n ~s ~w',["   ",H]),
    %write('\n'),write('   '),write(H),
    formattedPrinta(T).

teststring(X):-
    A is "test",
    B is " 123",
    string_concat(A,B,X).

% b)

