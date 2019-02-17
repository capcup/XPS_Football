%termtype(X,atom):- atom(X), termtype(X,atom).
%termtype(X,constant):- atomic(X), termtype(X,constant).

% 9.3
termtype(X,Y):-
    Y = 'atom',
    atom(X);
    Y = 'constant',
    atomic(X);
    Y = 'integer',
    integer(X);
    Y = 'float',
    float(X);
    Y = 'variable',
    var(X);
    Y = 'nonvar',
    nonvar(X).

% 9.4
%groundTerm(X):- X=..Y,nonvar(Y).
%groundTerm([]).
groundTerm([]).
groundTerm([H|T]):- nonvar(H), groundTerm(T).
groundTerm(X):- \+is_list(X),nonvar(X),X =..Y, groundTerm(Y).
%groundTerm(X):- nonvar(X).


% 5.2
% functor & arg 

%count_leafs(Term,N).

count_leaf([],N,N).
count_leaf(X,N,Res):-
     
    X=..Y,
    [_|T]=Y, 
    count_leaf(T,N,Res).


list_length_alt([],0).
list_length_alt([H|T],X):- list_length_alt(T,N), atom(H), X is N+1.

%count_leaf(X,N,Res):- is_list(X), [H|T]=X, atom(H), Nnew is N+1, count_leaf(T,Nnew,Res).
%count_leaf(X,N,Res):- is_list(X), [H|T]=X, \+atom(H), count_leaf(T,N,Res).