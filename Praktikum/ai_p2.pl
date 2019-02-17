% 2.3

% dance = steps and turns - ended by 'stop'
% steps = left, right, forward, backward
% turns = left turn, right turn

% 2.3 a)

correct_dance(stop).

correct_dance(right(X)):-
    correct_dance(X).
    
correct_dance(left(X)):-
    correct_dance(X).

correct_dance(left_turn(X)):-   
    correct_dance(X).

correct_dance(right_turn(X)):-
    correct_dance(X).

% ------------------------------

%2.3 b)
symmetric_dance(stop).
symmetric_dance(right(X)):-
    X=left(Y),
    symmetric_dance(Y).

%kürzere Schreibweise
symmetric_dance(left(right(X))):-
    symmetric_dance(X).


symmetric_dance(left_turn(X)):-
    X=right_turn(Y),
    symmetric_dance(Y).

symmetric_dance(left_turn(X)):-
    X=right_turn(Y),
    symmetric_dance(Y).

% ------------------------------

% 2.3 c) 
safe_dance(stop,stop).

safe_dance(left(X),left(Y)):-
    safe_dance(X,Y).

safe_dance(right(X),right(Y)):-
    safe_dance(X,Y).

safe_dance(left_turn(X),Y):-
    Y\=left_turn(Z),
    Y\=right_turn(Z),
    safe_dance(X,Y).

safe_dance(X,left_turn(Y)):-
    X\=left_turn(Z),
    X\=right_turn(Z),
    safe_dance(X,Y).

% ------------------------------

% 2.3 d)

idempotent_dance(stop).

idempotent_dance(left(X)):-
    idempotent_dance(X).

idempotent_dance(right(X)):-
    idempotent_dance(X).

idempotent_dance(forward(X)):-
    idempotent_dance(X).

idempotent_dance(backward(X)):-
    idempotent_dance(X).


% ------------------------------

% 2.4

diff(x,1).
diff(C, 0):-
    atomic(C),
    C \= x.
diff(F + G, DF + DG) :-
    diff(F, DF),
    diff(G, DG).
diff(F - G, DF - DG) :-
    diff(F, DF),
    diff(G, DG).
diff(F * G, DF * G + F * DG) :-
    diff(F, DF),
    diff(G, DG).
diff(F / G, (DF * G - F * DG) / (G * G)) :-
    diff(F, DF),
    diff(G, DG).

