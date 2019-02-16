start :- 
	hypothesize(Animal),
	write('I guess that the animal is: '),
	write(Animal),
	nl,
	undo.
	
/*hypotheses to be tested */
hypothesize(cheetah) :- 
	mammal,
	carnivore,
	verify(has_tawny_color),
	verify(has_dark_spots), 
	!.
	
hypothesize(tiger) :- 
	mammal,
	carnivore,
	verify(has_tawny_color),
	verify(has_black_stripes), 
	!.
	
hypothesize(giraffe) :- 
	ungulate,
	verify(has_long_neck),
	verify(has_long_legs),
	!.

hypothesize(zebra) :- 
	ungulate,
	verify(has_black_stripes), 
	!.
		
hypothesize(unknown). /* no diagnosis */


/*classification rules*/

mammal :- 
	verify(has_hair), 
	verify(gives_milk).

carnivore :- 
	verify(eats_meat), !.
carnivore :- 
	verify(has_pointed_teeth),
	verify(has_claws),
	verify(has_forward_eyes).
	
ungulate :- 
	mammal,
	verify(has_hooves), 
	!.

ungulate :- 
	mammal,
	verify(chews_cud).
	
	
/*how to ask question */
ask(Question) :-
	write('Does the animal have the following attribute: '),
	write(Question),
	write('? '),
	read(Response),
	nl,
	(
		(Response == yes ; Response == y)
	->
		asserta(yes(Question)) 
	;
		asserta(no(Question)), 
		fail
	).
	
:- dynamic(yes/1,no/1).
/* dynamic tells the compiler that the predicate may have no clauses and also informs it that clauses may be added at runtime.*/
/*how to verify something */
verify(S) :-
	(
		yes(S)
	->
		true 
	;
		( 
			no(S)
		->
			fail 
		;
			ask(S) 
		)
	).
	

/*undo all yes/no assertions*/
undo :- 
	retract(yes(_)), 
	fail.
undo :- 
	retract(no(_)), 
	fail.
undo.
