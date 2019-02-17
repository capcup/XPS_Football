family(meier, uwe, erika, [birgit, hans, elke]).
family(hoffmann, werner, maria, []).
family(mueller, heinz, monika, [peter, susanne]).
family(schulz, karl, claudia, [max, fritz, karl, grete]).

% 3.3 a)
%family(_,Father,Mother,[birgit,hans,elke]).
%family(mueller,_,_,Children).
%family(Family,_,_,[]).

% 3.3 b)

% family(Name,_,_,[_,_]).   - mueller
% family(Name,_,_,[]).      - hoffmann

% 3.3 c)

% family(Name,_,_,[_,_,_]). - exactly 3 children
% family(Name,_,_,[_|_]).   - at least 1 children
% family(Name,_,_,[_,_|_]). - at least 2 children


% 3.4 
member(X,[X|T]).
member(X,[H|T])  :-  member(X,T).

% 3.5 
% True if E is the last element of list L
last([_|X],X).
last([_|T],X):- last(T,X).

% 3.6
% true if List2 is a list where all elements of List1 are increased by 1
increase([],[]).
increase([H1|T1],[H2|T2]):-
    H2 =:= H1+1,
    increase(T1,T2).

% 3.7
delete([],_,[]).
delete([X|T1],X,[H2|T2]):- delete(T1,X,[H2|T2]).
delete([H1|T1],X,[H1|T2]):- delete(T1,X,T2).

% 3.8 
% swaps the two neighbouring elements thouroughly
swap([],[]).
swap([H1,H2|T1],[H2,H1|T2]):- swap(T1,T2).

% 3.9 
% determines the length of a list
list_length(List,Length):- list_l(List, 0, Length).
list_l([],A,A).
list_l([H|T],A,Res):- Anew is A+1, list_l(T,Anew,Res).

% schlechtere Lösung
list_length_alt([],0).
list_length_alt([H|T],X):- list_length(T,N), X is N+1.

% 3.10
%true if List2 is a list that results from replacing all occourences of element X by Y in List1
replace_element([],_,_,[]).
replace_element([H1|T1],X,Y,[H1|T2]):- replace_element(T1,X,Y,T2).
replace_element([H1|T1],X,Y,Z):- H1=:=X, replace_element([Y|T1],X,Y,Z).

% 3.11
% sums up all elements of the list of integers
listsum_alt([],0).
listsum_alt([H|T],X):- listsum(T,N), X is N+H.

% better
listsum(L,X):- listsum_acc(L,0,X).
listsum_acc([],A,A).
listsum_acc([H|T],A,Res):- Anew is A+H, listsum_acc(T,Anew,Res).

% 3.12
% generates a list of the first N natural numbers (1...N)
accRev([H|T],A,R) :- accRev(T,[H|A],R). 
accRev([],A,A).
rev(L,R) :- accRev(L,[],R).

first_n(N,X):- first_en(N,[],X);
first_en(0,A,A).
first_en(N,A,Res):- N>=0,Nnew is N-1, first_n(Nnew,[N|A],Res).





