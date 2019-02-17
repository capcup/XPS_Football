a(1).
b(1).
c(1).
b(2).
c(2).
d(2).
e(2).
f(3).

p(X) :- a(X).
p(X) :- b(X),c(X),!,d(X),e(X).
p(X) :- f(X).

s(X,Y) :- q(X,Y). s(0,0).
q(X,Y) :- i(X),!,j(Y).

i(1).
i(2).
j(1).
j(2).
j(3).


max(X,Y,Y) :- X =< Y,!. 
max(X,Y,X) :- X>Y.



enjoys(vincent,X) :- big_kahuna_burger(X),!,fail. 
enjoys(vincent,X) :- burger(X).

burger(X) :- big_mac(X).
burger(X) :- big_kahuna_burger(X). 
burger(X) :- whopper(X).
big_mac(a). 
big_kahuna_burger(b). 
big_mac(c). 
whopper(d).


neg(Goal) :- Goal,!,fail. 
neg(Goal).

% equal to enjoys(vincent,X) :- big_kahuna_burger(X),!,fail. 
enjoys(vincent,X) :- burger(X), neg(big_kahuna_burger(X)).


p(1).
p(2) :- !.
p(3).


class(Number,positive) :- Number > 0. 
class(0,zero).
class(Number, negative) :- Number < 0.

class_mod(X,Y):-
    (X>0 
    -> Y='positive';
    X=0
    -> Y='zero';
    Y='negative').


split([],[],[]).
split([H|T],[H|P],N):- H>0,split(T,P,N).
split([H|T],P,[H|N]):- H<0,split(T,P,N).

appendlist([],[]).
appendlist([H|T],[H|T1]):- appendlist(T,T1).


