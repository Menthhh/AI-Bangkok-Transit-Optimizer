% light green: BTS
train(n24,lightgreen).
train(n23,lightgreen).
train(n22,lightgreen).
train(n21,lightgreen).
train(n20,lightgreen).
train(n19,lightgreen).
train(n18,lightgreen).
train(n17,lightgreen).
train(n15,lightgreen).
train(n14,lightgreen).
train(n13,lightgreen).
train(n12,lightgreen).
train(n11,lightgreen).
train(n10,lightgreen).
train(n9,lightgreen).
train(n8,lightgreen).
train(n7,lightgreen).
train(n6,lightgreen).
train(n5,lightgreen).
train(n4,lightgreen).
train(n3,lightgreen).
train(n2,lightgreen).
train(n1,lightgreen).
train(cen_lg,lightgreen).
train(e1,lightgreen).
train(e2,lightgreen).
train(e3,lightgreen).
train(e4,lightgreen).
train(e5,lightgreen).
train(e6,lightgreen).
train(e7,lightgreen).
train(e8,lightgreen).
train(e9,lightgreen).
train(e10,lightgreen).
train(e11,lightgreen).
train(e12,lightgreen).
train(e13,lightgreen).
train(e14,lightgreen).
train(e15,lightgreen).
train(e16,lightgreen).
train(e17,lightgreen).
train(e18,lightgreen).
train(e19,lightgreen).
train(e20,lightgreen).
train(e21,lightgreen).
train(e22,lightgreen).
train(e23,lightgreen).

train_list([n24, n23, n22, n21, n20, n19, n18, n17, n16, n15, n14, n13, n12, n11, n10, n9, n8, n7, n6, n5, n4, n3, n2, n1, cen_lg, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22, e23], lightgreen).
%special([e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22, e23, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24], lightgreen).
special([e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22, e23], lightgreen).
special([n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24], lightgreen).

condition_green(0,17) :- !.
condition_green(1,17) :- !.
condition_green(2,25) :- !.
condition_green(3,28) :- !.
condition_green(4,32) :- !.
condition_green(5,35) :- !.
condition_green(6,40) :- !.
condition_green(7,43) :- !.
condition_green(_,47) :- !.
fare(From, To, 15) :- train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), member(From, X), member(To, X), !.
fare(From, To, P) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), H == To, !, count(From,H,D),
	condition_green(D,P).
fare(From, To, P) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), !, count(From,H,D),
	condition_green(D,P1) ,P is P1+15.
fare(From, To, P) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), H == From, !, count(To,H,D),
	condition_green(D,P).
fare(From, To, P) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), !, count(To,H,D),
	condition_green(D,P1) ,P is P1+15.
fare(From, To, 17) :- train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), \+member(From, X), member(To, X),!.
fare(From, To, P) :- train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), \+member(From, X), \+member(To, X), count(From,To,D), condition_green(D,P), !.

% dark green: BTS
train(w1, darkgreen).
train(cen_dg, darkgreen).
train(s1, darkgreen).
train(s2, darkgreen).
train(s3, darkgreen).
train(s4, darkgreen).
train(s5, darkgreen).
train(s6, darkgreen).
train(s7, darkgreen).
train(s8, darkgreen).
train(s9, darkgreen).
train(s10, darkgreen).
train(s11, darkgreen).
train(s12, darkgreen).

train_list([w1,cen_dg,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12],darkgreen).
special([s8, s9, s10, s11, s12], darkgreen).

fare(From, To, 15) :- train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), member(From, X), member(To, X), !.
fare(From, To, P) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), H == To, !, count(From,H,D),
	condition_green(D,P).
fare(From, To, P) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), !, count(From,H,D),
	condition_green(D,P1) ,P is P1+15.
fare(From, To, P) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), H == From, !, count(To,H,D),
	condition_green(D,P).
fare(From, To, P) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), !, count(To,H,D),
	condition_green(D,P1) ,P is P1+15.
fare(From, To, 17) :- train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), \+member(From, X), member(To, X),!.
fare(From, To, P) :- train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), \+member(From, X), \+member(To, X), count(From,To,D), condition_green(D,P), !.
% cross greens
fare(From,To,P) :-
	train(From, darkgreen), special(X, darkgreen), member(From,X),
	X = [H|_], H \= From,
	train(To, lightgreen),!,
	count(From, To,D),
	condition_green(D,P1) , P is P1+15.
fare(From,To,P) :-
	train(From, darkgreen), 
	train(To, lightgreen), special(Y, lightgreen), member(To,Y),
	Y = [H|_], H \= To, !,
	count(From, To,D),
	condition_green(D,P1) , P is P1+15.
fare(From,To,P) :-
	train(From, darkgreen), %special(X, darkgreen), \+member(From,X),
	train(To, lightgreen), %special(Y, lightgreen), \+member(To,Y),
	count(From, To,D),
	condition_green(D,P).

% gold: BTS
train(g1, gold).
train(g2, gold).
train(g3, gold).

train_list([g1,g2,g3], gold).
fare(X,Y,15) :- train(X,gold), train(Y,gold).

% blue: MRT
train(bl01, blue).
train(bl02, blue).
train(bl03, blue).
train(bl04, blue).
train(bl05, blue).
train(bl06, blue).
train(bl07, blue).
train(bl08, blue).
train(bl09, blue).
train(bl10, blue).
train(bl11, blue).
train(bl12, blue).
train(bl13, blue).
train(bl14, blue).
train(bl15, blue).
train(bl16, blue).
train(bl17, blue).
train(bl18, blue).
train(bl19, blue).
train(bl20, blue).
train(bl21, blue).
train(bl22, blue).
train(bl23, blue).
train(bl24, blue).
train(bl25, blue).
train(bl26, blue).
train(bl27, blue).
train(bl28, blue).
train(bl29, blue).
train(bl30, blue).
train(bl31, blue).
train(bl32, blue).
train(bl33, blue).
train(bl34, blue).
train(bl35, blue).
train(bl36, blue).
train(bl37, blue).
train(bl38, blue).

train_list(
[ bl01, bl02, bl03, bl04, bl05, bl06, bl07, bl08, bl09, bl10,
    bl11, bl12, bl13, bl14, bl15, bl16, bl17, bl18, bl19, bl20,
    bl21, bl22, bl23, bl24, bl25, bl26, bl27, bl28, bl29, bl30,
    bl31, bl32], blue).
train_list([ bl01, bl33, bl34, bl35, bl36, bl37, bl38], blue).

fare(X,X,17) :- train(X,blue).

fare(bl10, bl11, 17).
fare(bl10, bl12, 20).
fare(bl10, bl13, 22).
fare(bl10, bl14, 25).
fare(bl10, bl15, 27).
fare(bl10, bl16, 30).
fare(bl10, bl17, 32).
fare(bl10, bl18, 35).
fare(bl10, bl19, 37).
fare(bl10, bl20, 40).
fare(bl10, bl21, 42).
fare(bl10, bl22, 45).
fare(bl10, bl23, 45).
fare(bl10, bl24, 45).
fare(bl10, bl25, 45).
fare(bl10, bl26, 45).
fare(bl10, bl27, 45).
fare(bl10, bl28, 45).
fare(bl10, bl29, 45).
fare(bl10, bl30, 45).
fare(bl10, bl31, 42).
fare(bl10, bl32, 40).
fare(bl10, bl01, 37).
fare(bl10, bl33, 40).
fare(bl10, bl34, 42).
fare(bl10, bl35, 45).
fare(bl10, bl36, 45).
fare(bl10, bl37, 45).
fare(bl10, bl38, 45).
fare(bl10, bl09, 17).
fare(bl10, bl08, 20).
fare(bl10, bl07, 22).
fare(bl10, bl06, 25).
fare(bl10, bl05, 27).
fare(bl10, bl04, 30).
fare(bl10, bl03, 32).
fare(bl10, bl02, 35).

fare(bl11, bl12, 17).
fare(bl11, bl13, 20).
fare(bl11, bl14, 22).
fare(bl11, bl15, 25).
fare(bl11, bl16, 27).
fare(bl11, bl17, 30).
fare(bl11, bl18, 32).
fare(bl11, bl19, 35).
fare(bl11, bl20, 37).
fare(bl11, bl21, 40).
fare(bl11, bl22, 42).
fare(bl11, bl23, 45).
fare(bl11, bl24, 45).
fare(bl11, bl25, 45).
fare(bl11, bl26, 45).
fare(bl11, bl27, 45).
fare(bl11, bl28, 45).
fare(bl11, bl29, 45).
fare(bl11, bl30, 45).
fare(bl11, bl31, 45).
fare(bl11, bl32, 42).
fare(bl11, bl01, 40).
fare(bl11, bl33, 42).
fare(bl11, bl34, 45).
fare(bl11, bl35, 45).
fare(bl11, bl36, 45).
fare(bl11, bl37, 45).
fare(bl11, bl38, 45).
fare(bl11, bl09, 20).
fare(bl11, bl08, 22).
fare(bl11, bl07, 25).
fare(bl11, bl06, 27).
fare(bl11, bl05, 30).
fare(bl11, bl04, 32).
fare(bl11, bl03, 35).
fare(bl11, bl02, 37).

fare(bl12, bl13, 17).
fare(bl12, bl14, 20).
fare(bl12, bl15, 22).
fare(bl12, bl16, 25).
fare(bl12, bl17, 27).
fare(bl12, bl18, 30).
fare(bl12, bl19, 32).
fare(bl12, bl20, 35).
fare(bl12, bl21, 37).
fare(bl12, bl22, 40).
fare(bl12, bl23, 42).
fare(bl12, bl24, 45).
fare(bl12, bl25, 45).
fare(bl12, bl26, 45).
fare(bl12, bl27, 45).
fare(bl12, bl28, 45).
fare(bl12, bl29, 45).
fare(bl12, bl30, 45).
fare(bl12, bl31, 45).
fare(bl12, bl32, 45).
fare(bl12, bl01, 42).
fare(bl12, bl33, 45).
fare(bl12, bl34, 45).
fare(bl12, bl35, 45).
fare(bl12, bl36, 45).
fare(bl12, bl37, 45).
fare(bl12, bl38, 45).
fare(bl12, bl09, 22).
fare(bl12, bl08, 25).
fare(bl12, bl07, 27).
fare(bl12, bl06, 30).
fare(bl12, bl05, 32).
fare(bl12, bl04, 35).
fare(bl12, bl03, 37).
fare(bl12, bl02, 40).

fare(bl13, bl14, 17).
fare(bl13, bl15, 20).
fare(bl13, bl16, 22).
fare(bl13, bl17, 25).
fare(bl13, bl18, 27).
fare(bl13, bl19, 30).
fare(bl13, bl20, 32).
fare(bl13, bl21, 35).
fare(bl13, bl22, 37).
fare(bl13, bl23, 40).
fare(bl13, bl24, 42).
fare(bl13, bl25, 45).
fare(bl13, bl26, 45).
fare(bl13, bl27, 45).
fare(bl13, bl28, 45).
fare(bl13, bl29, 45).
fare(bl13, bl30, 45).
fare(bl13, bl31, 45).
fare(bl13, bl32, 45).
fare(bl13, bl01, 45).
fare(bl13, bl33, 45).
fare(bl13, bl34, 45).
fare(bl13, bl35, 45).
fare(bl13, bl36, 45).
fare(bl13, bl37, 45).
fare(bl13, bl38, 45).
fare(bl13, bl09, 25).
fare(bl13, bl08, 27).
fare(bl13, bl07, 30).
fare(bl13, bl06, 32).
fare(bl13, bl05, 35).
fare(bl13, bl04, 37).
fare(bl13, bl03, 40).
fare(bl13, bl02, 42).

fare(bl14, bl15, 17).
fare(bl14, bl16, 20).
fare(bl14, bl17, 22).
fare(bl14, bl18, 25).
fare(bl14, bl19, 27).
fare(bl14, bl20, 30).
fare(bl14, bl21, 32).
fare(bl14, bl22, 35).
fare(bl14, bl23, 37).
fare(bl14, bl24, 40).
fare(bl14, bl25, 42).
fare(bl14, bl26, 45).
fare(bl14, bl27, 45).
fare(bl14, bl28, 45).
fare(bl14, bl29, 45).
fare(bl14, bl30, 45).
fare(bl14, bl31, 45).
fare(bl14, bl32, 45).
fare(bl14, bl01, 45).
fare(bl14, bl33, 45).
fare(bl14, bl34, 45).
fare(bl14, bl35, 45).
fare(bl14, bl36, 45).
fare(bl14, bl37, 45).
fare(bl14, bl38, 45).
fare(bl14, bl09, 27).
fare(bl14, bl08, 30).
fare(bl14, bl07, 32).
fare(bl14, bl06, 35).
fare(bl14, bl05, 37).
fare(bl14, bl04, 40).
fare(bl14, bl03, 42).
fare(bl14, bl02, 45).

fare(bl15, bl16, 17).
fare(bl15, bl17, 20).
fare(bl15, bl18, 22).
fare(bl15, bl19, 25).
fare(bl15, bl20, 27).
fare(bl15, bl21, 30).
fare(bl15, bl22, 32).
fare(bl15, bl23, 35).
fare(bl15, bl24, 37).
fare(bl15, bl25, 40).
fare(bl15, bl26, 42).
fare(bl15, bl27, 45).
fare(bl15, bl28, 45).
fare(bl15, bl29, 45).
fare(bl15, bl30, 45).
fare(bl15, bl31, 45).
fare(bl15, bl32, 45).
fare(bl15, bl01, 45).
fare(bl15, bl33, 45).
fare(bl15, bl34, 45).
fare(bl15, bl35, 45).
fare(bl15, bl36, 45).
fare(bl15, bl37, 45).
fare(bl15, bl38, 45).
fare(bl15, bl09, 30).
fare(bl15, bl08, 32).
fare(bl15, bl07, 35).
fare(bl15, bl06, 37).
fare(bl15, bl05, 40).
fare(bl15, bl04, 42).
fare(bl15, bl03, 45).
fare(bl15, bl02, 45).

fare(bl16, bl17, 17).
fare(bl16, bl18, 20).
fare(bl16, bl19, 22).
fare(bl16, bl20, 25).
fare(bl16, bl21, 27).
fare(bl16, bl22, 30).
fare(bl16, bl23, 32).
fare(bl16, bl24, 35).
fare(bl16, bl25, 37).
fare(bl16, bl26, 40).
fare(bl16, bl27, 42).
fare(bl16, bl28, 45).
fare(bl16, bl29, 45).
fare(bl16, bl30, 45).
fare(bl16, bl31, 45).
fare(bl16, bl32, 45).
fare(bl16, bl01, 45).
fare(bl16, bl33, 45).
fare(bl16, bl34, 45).
fare(bl16, bl35, 45).
fare(bl16, bl36, 45).
fare(bl16, bl37, 45).
fare(bl16, bl38, 45).
fare(bl16, bl09, 32).
fare(bl16, bl08, 35).
fare(bl16, bl07, 37).
fare(bl16, bl06, 40).
fare(bl16, bl05, 42).
fare(bl16, bl04, 45).
fare(bl16, bl03, 45).
fare(bl16, bl02, 45).

fare(bl17, bl18, 17).
fare(bl17, bl19, 20).
fare(bl17, bl20, 22).
fare(bl17, bl21, 25).
fare(bl17, bl22, 27).
fare(bl17, bl23, 30).
fare(bl17, bl24, 32).
fare(bl17, bl25, 35).
fare(bl17, bl26, 37).
fare(bl17, bl27, 40).
fare(bl17, bl28, 42).
fare(bl17, bl29, 45).
fare(bl17, bl30, 45).
fare(bl17, bl31, 45).
fare(bl17, bl32, 45).
fare(bl17, bl01, 45).
fare(bl17, bl33, 45).
fare(bl17, bl34, 45).
fare(bl17, bl35, 45).
fare(bl17, bl36, 45).
fare(bl17, bl37, 45).
fare(bl17, bl38, 45).
fare(bl17, bl09, 35).
fare(bl17, bl08, 37).
fare(bl17, bl07, 40).
fare(bl17, bl06, 42).
fare(bl17, bl05, 45).
fare(bl17, bl04, 45).
fare(bl17, bl03, 45).
fare(bl17, bl02, 45).

fare(bl18, bl19, 17).
fare(bl18, bl20, 20).
fare(bl18, bl21, 22).
fare(bl18, bl22, 25).
fare(bl18, bl23, 27).
fare(bl18, bl24, 30).
fare(bl18, bl25, 32).
fare(bl18, bl26, 35).
fare(bl18, bl27, 37).
fare(bl18, bl28, 40).
fare(bl18, bl29, 42).
fare(bl18, bl30, 45).
fare(bl18, bl31, 45).
fare(bl18, bl32, 45).
fare(bl18, bl01, 45).
fare(bl18, bl33, 45).
fare(bl18, bl34, 45).
fare(bl18, bl35, 45).
fare(bl18, bl36, 45).
fare(bl18, bl37, 45).
fare(bl18, bl38, 45).
fare(bl18, bl09, 37).
fare(bl18, bl08, 40).
fare(bl18, bl07, 42).
fare(bl18, bl06, 45).
fare(bl18, bl05, 45).
fare(bl18, bl04, 45).
fare(bl18, bl03, 45).
fare(bl18, bl02, 45).

fare(bl19, bl20, 17).
fare(bl19, bl21, 20).
fare(bl19, bl22, 22).
fare(bl19, bl23, 25).
fare(bl19, bl24, 27).
fare(bl19, bl25, 30).
fare(bl19, bl26, 32).
fare(bl19, bl27, 35).
fare(bl19, bl28, 37).
fare(bl19, bl29, 40).
fare(bl19, bl30, 42).
fare(bl19, bl31, 45).
fare(bl19, bl32, 45).
fare(bl19, bl01, 45).
fare(bl19, bl33, 45).
fare(bl19, bl34, 45).
fare(bl19, bl35, 45).
fare(bl19, bl36, 45).
fare(bl19, bl37, 45).
fare(bl19, bl38, 45).
fare(bl19, bl09, 40).
fare(bl19, bl08, 42).
fare(bl19, bl07, 45).
fare(bl19, bl06, 45).
fare(bl19, bl05, 45).
fare(bl19, bl04, 45).
fare(bl19, bl03, 45).
fare(bl19, bl02, 45).

fare(bl20, bl21, 17).
fare(bl20, bl22, 20).
fare(bl20, bl23, 22).
fare(bl20, bl24, 25).
fare(bl20, bl25, 27).
fare(bl20, bl26, 30).
fare(bl20, bl27, 32).
fare(bl20, bl28, 35).
fare(bl20, bl29, 37).
fare(bl20, bl30, 40).
fare(bl20, bl31, 42).
fare(bl20, bl32, 45).
fare(bl20, bl01, 45).
fare(bl20, bl33, 45).
fare(bl20, bl34, 45).
fare(bl20, bl35, 45).
fare(bl20, bl36, 45).
fare(bl20, bl37, 45).
fare(bl20, bl38, 45).
fare(bl20, bl09, 42).
fare(bl20, bl08, 45).
fare(bl20, bl07, 45).
fare(bl20, bl06, 45).
fare(bl20, bl05, 45).
fare(bl20, bl04, 45).
fare(bl20, bl03, 45).
fare(bl20, bl02, 45).

fare(bl21, bl22, 17).
fare(bl21, bl23, 20).
fare(bl21, bl24, 22).
fare(bl21, bl25, 25).
fare(bl21, bl26, 27).
fare(bl21, bl27, 30).
fare(bl21, bl28, 32).
fare(bl21, bl29, 35).
fare(bl21, bl30, 37).
fare(bl21, bl31, 40).
fare(bl21, bl32, 42).
fare(bl21, bl01, 45).
fare(bl21, bl33, 45).
fare(bl21, bl34, 45).
fare(bl21, bl35, 45).
fare(bl21, bl36, 45).
fare(bl21, bl37, 45).
fare(bl21, bl38, 45).
fare(bl21, bl09, 45).
fare(bl21, bl08, 45).
fare(bl21, bl07, 45).
fare(bl21, bl06, 45).
fare(bl21, bl05, 45).
fare(bl21, bl04, 45).
fare(bl21, bl03, 45).
fare(bl21, bl02, 45).

fare(bl22, bl23, 17).
fare(bl22, bl24, 20).
fare(bl22, bl25, 22).
fare(bl22, bl26, 25).
fare(bl22, bl27, 27).
fare(bl22, bl28, 30).
fare(bl22, bl29, 32).
fare(bl22, bl30, 35).
fare(bl22, bl31, 37).
fare(bl22, bl32, 40).
fare(bl22, bl01, 42).
fare(bl22, bl33, 45).
fare(bl22, bl34, 45).
fare(bl22, bl35, 45).
fare(bl22, bl36, 45).
fare(bl22, bl37, 45).
fare(bl22, bl38, 45).
fare(bl22, bl09, 45).
fare(bl22, bl08, 45).
fare(bl22, bl07, 45).
fare(bl22, bl06, 45).
fare(bl22, bl05, 45).
fare(bl22, bl04, 45).
fare(bl22, bl03, 45).
fare(bl22, bl02, 45).

fare(bl23, bl24, 17).
fare(bl23, bl25, 20).
fare(bl23, bl26, 22).
fare(bl23, bl27, 25).
fare(bl23, bl28, 27).
fare(bl23, bl29, 30).
fare(bl23, bl30, 32).
fare(bl23, bl31, 35).
fare(bl23, bl32, 37).
fare(bl23, bl01, 40).
fare(bl23, bl33, 42).
fare(bl23, bl34, 45).
fare(bl23, bl35, 45).
fare(bl23, bl36, 45).
fare(bl23, bl37, 45).
fare(bl23, bl38, 45).
fare(bl23, bl09, 45).
fare(bl23, bl08, 45).
fare(bl23, bl07, 45).
fare(bl23, bl06, 45).
fare(bl23, bl05, 45).
fare(bl23, bl04, 45).
fare(bl23, bl03, 45).
fare(bl23, bl02, 42).

fare(bl24, bl25, 17).
fare(bl24, bl26, 20).
fare(bl24, bl27, 22).
fare(bl24, bl28, 25).
fare(bl24, bl29, 27).
fare(bl24, bl30, 30).
fare(bl24, bl31, 32).
fare(bl24, bl32, 35).
fare(bl24, bl01, 37).
fare(bl24, bl33, 40).
fare(bl24, bl34, 42).
fare(bl24, bl35, 45).
fare(bl24, bl36, 45).
fare(bl24, bl37, 45).
fare(bl24, bl38, 45).
fare(bl24, bl09, 45).
fare(bl24, bl08, 45).
fare(bl24, bl07, 45).
fare(bl24, bl06, 45).
fare(bl24, bl05, 45).
fare(bl24, bl04, 45).
fare(bl24, bl03, 42).
fare(bl24, bl02, 40).

fare(bl25, bl26, 17).
fare(bl25, bl27, 20).
fare(bl25, bl28, 22).
fare(bl25, bl29, 25).
fare(bl25, bl30, 27).
fare(bl25, bl31, 30).
fare(bl25, bl32, 32).
fare(bl25, bl01, 35).
fare(bl25, bl33, 37).
fare(bl25, bl34, 40).
fare(bl25, bl35, 42).
fare(bl25, bl36, 45).
fare(bl25, bl37, 45).
fare(bl25, bl38, 45).
fare(bl25, bl09, 45).
fare(bl25, bl08, 45).
fare(bl25, bl07, 45).
fare(bl25, bl06, 45).
fare(bl25, bl05, 45).
fare(bl25, bl04, 42).
fare(bl25, bl03, 40).
fare(bl25, bl02, 37).

fare(bl26, bl27, 17).
fare(bl26, bl28, 20).
fare(bl26, bl29, 22).
fare(bl26, bl30, 25).
fare(bl26, bl31, 27).
fare(bl26, bl32, 30).
fare(bl26, bl01, 32).
fare(bl26, bl33, 35).
fare(bl26, bl34, 37).
fare(bl26, bl35, 40).
fare(bl26, bl36, 42).
fare(bl26, bl37, 45).
fare(bl26, bl38, 45).
fare(bl26, bl09, 45).
fare(bl26, bl08, 45).
fare(bl26, bl07, 45).
fare(bl26, bl06, 45).
fare(bl26, bl05, 42).
fare(bl26, bl04, 40).
fare(bl26, bl03, 37).
fare(bl26, bl02, 35).

fare(bl27, bl28, 17).
fare(bl27, bl29, 20).
fare(bl27, bl30, 22).
fare(bl27, bl31, 25).
fare(bl27, bl32, 27).
fare(bl27, bl01, 30).
fare(bl27, bl33, 32).
fare(bl27, bl34, 35).
fare(bl27, bl35, 37).
fare(bl27, bl36, 40).
fare(bl27, bl37, 42).
fare(bl27, bl38, 45).
fare(bl27, bl09, 45).
fare(bl27, bl08, 45).
fare(bl27, bl07, 45).
fare(bl27, bl06, 42).
fare(bl27, bl05, 40).
fare(bl27, bl04, 37).
fare(bl27, bl03, 35).
fare(bl27, bl02, 32).

fare(bl28, bl29, 17).
fare(bl28, bl30, 20).
fare(bl28, bl31, 22).
fare(bl28, bl32, 25).
fare(bl28, bl01, 27).
fare(bl28, bl33, 30).
fare(bl28, bl34, 32).
fare(bl28, bl35, 35).
fare(bl28, bl36, 37).
fare(bl28, bl37, 40).
fare(bl28, bl38, 42).
fare(bl28, bl09, 45).
fare(bl28, bl08, 45).
fare(bl28, bl07, 42).
fare(bl28, bl06, 40).
fare(bl28, bl05, 37).
fare(bl28, bl04, 35).
fare(bl28, bl03, 32).
fare(bl28, bl02, 30).

fare(bl29, bl30, 17).
fare(bl29, bl31, 20).
fare(bl29, bl32, 22).
fare(bl29, bl01, 25).
fare(bl29, bl33, 27).
fare(bl29, bl34, 30).
fare(bl29, bl35, 32).
fare(bl29, bl36, 35).
fare(bl29, bl37, 37).
fare(bl29, bl38, 40).
fare(bl29, bl09, 45).
fare(bl29, bl08, 42).
fare(bl29, bl07, 40).
fare(bl29, bl06, 37).
fare(bl29, bl05, 35).
fare(bl29, bl04, 32).
fare(bl29, bl03, 30).
fare(bl29, bl02, 27).

fare(bl30, bl31, 17).
fare(bl30, bl32, 20).
fare(bl30, bl01, 22).
fare(bl30, bl33, 25).
fare(bl30, bl34, 27).
fare(bl30, bl35, 30).
fare(bl30, bl36, 32).
fare(bl30, bl37, 35).
fare(bl30, bl38, 37).
fare(bl30, bl09, 42).
fare(bl30, bl08, 40).
fare(bl30, bl07, 47).
fare(bl30, bl06, 35).
fare(bl30, bl05, 32).
fare(bl30, bl04, 30).
fare(bl30, bl03, 27).
fare(bl30, bl02, 25).

fare(bl31, bl32, 17).
fare(bl31, bl01, 20).
fare(bl31, bl33, 22).
fare(bl31, bl34, 25).
fare(bl31, bl35, 27).
fare(bl31, bl36, 30).
fare(bl31, bl37, 32).
fare(bl31, bl38, 35).
fare(bl31, bl09, 40).
fare(bl31, bl08, 37).
fare(bl31, bl07, 35).
fare(bl31, bl06, 32).
fare(bl31, bl05, 30).
fare(bl31, bl04, 27).
fare(bl31, bl03, 25).
fare(bl31, bl02, 22).

fare(bl32, bl01, 17).
fare(bl32, bl33, 20).
fare(bl32, bl34, 22).
fare(bl32, bl35, 25).
fare(bl32, bl36, 27).
fare(bl32, bl37, 30).
fare(bl32, bl38, 32).
fare(bl32, bl09, 37).
fare(bl32, bl08, 35).
fare(bl32, bl07, 32).
fare(bl32, bl06, 30).
fare(bl32, bl05, 27).
fare(bl32, bl04, 25).
fare(bl32, bl03, 22).
fare(bl32, bl02, 20).

fare(bl01, bl33, 17).
fare(bl01, bl34, 20).
fare(bl01, bl35, 22).
fare(bl01, bl36, 25).
fare(bl01, bl37, 27).
fare(bl01, bl38, 30).
fare(bl01, bl09, 35).
fare(bl01, bl08, 32).
fare(bl01, bl07, 30).
fare(bl01, bl06, 27).
fare(bl01, bl05, 25).
fare(bl01, bl04, 22).
fare(bl01, bl03, 20).
fare(bl01, bl02, 17).

fare(bl33, bl34, 17).
fare(bl33, bl35, 20).
fare(bl33, bl36, 22).
fare(bl33, bl37, 25).
fare(bl33, bl38, 27).
fare(bl33, bl09, 37).
fare(bl33, bl08, 35).
fare(bl33, bl07, 32).
fare(bl33, bl06, 30).
fare(bl33, bl05, 27).
fare(bl33, bl04, 25).
fare(bl33, bl03, 22).
fare(bl33, bl02, 20).

fare(bl34, bl35, 17).
fare(bl34, bl36, 20).
fare(bl34, bl37, 22).
fare(bl34, bl38, 25).
fare(bl34, bl09, 40).
fare(bl34, bl08, 37).
fare(bl34, bl07, 35).
fare(bl34, bl06, 32).
fare(bl34, bl05, 30).
fare(bl34, bl04, 27).
fare(bl34, bl03, 25).
fare(bl34, bl02, 22).

fare(bl35, bl36, 17).
fare(bl35, bl37, 20).
fare(bl35, bl38, 22).
fare(bl35, bl09, 42).
fare(bl35, bl08, 40).
fare(bl35, bl07, 37).
fare(bl35, bl06, 35).
fare(bl35, bl05, 32).
fare(bl35, bl04, 30).
fare(bl35, bl03, 27).
fare(bl35, bl02, 25).

fare(bl36, bl37, 17).
fare(bl36, bl38, 20).
fare(bl36, bl09, 45).
fare(bl36, bl08, 42).
fare(bl36, bl07, 40).
fare(bl36, bl06, 37).
fare(bl36, bl05, 35).
fare(bl36, bl04, 32).
fare(bl36, bl03, 30).
fare(bl36, bl02, 27).

fare(bl37, bl38, 17).
fare(bl37, bl09, 45).
fare(bl37, bl08, 45).
fare(bl37, bl07, 42).
fare(bl37, bl06, 40).
fare(bl37, bl05, 37).
fare(bl37, bl04, 35).
fare(bl37, bl03, 32).
fare(bl37, bl02, 30).

fare(bl38, bl09, 45).
fare(bl38, bl08, 45).
fare(bl38, bl07, 45).
fare(bl38, bl06, 42).
fare(bl38, bl05, 40).
fare(bl38, bl04, 37).
fare(bl38, bl03, 35).
fare(bl38, bl02, 32).

fare(bl09, bl08, 17).
fare(bl09, bl07, 20).
fare(bl09, bl06, 22).
fare(bl09, bl05, 25).
fare(bl09, bl04, 27).
fare(bl09, bl03, 30).
fare(bl09, bl02, 32).

fare(bl08, bl07, 17).
fare(bl08, bl06, 20).
fare(bl08, bl05, 22).
fare(bl08, bl04, 25).
fare(bl08, bl03, 27).
fare(bl08, bl02, 30).

fare(bl07, bl06, 17).
fare(bl07, bl05, 20).
fare(bl07, bl04, 22).
fare(bl07, bl03, 25).
fare(bl07, bl02, 27).

fare(bl06, bl05, 17).
fare(bl06, bl04, 20).
fare(bl06, bl03, 22).
fare(bl06, bl02, 25).

fare(bl05, bl04, 17).
fare(bl05, bl03, 20).
fare(bl05, bl02, 22).

fare(bl04, bl03, 17).
fare(bl04, bl02, 20).

fare(bl03, bl02, 17).

% purple: MRT
train(pp01, purple).
train(pp02, purple).
train(pp03, purple).
train(pp04, purple).
train(pp05, purple).
train(pp06, purple).
train(pp07, purple).
train(pp08, purple).
train(pp09, purple).
train(pp10, purple).
train(pp11, purple).
train(pp12, purple).
train(pp13, purple).
train(pp14, purple).
train(pp15, purple).
train(pp16, purple).

train_list(
	[pp01, pp02, pp03, pp04, pp05, pp06, pp07, pp08,
    	pp09, pp10, pp11, pp12, pp13, pp14, pp15, pp16], purple).


fare(X,Y,P) :- 
    train(X,purple), train(Y,purple), 
    count(X,Y,C),
    (   C =:= 1 ->  P = 17;
    C > 1 ->  P = 20;
    C =:= 0 ->  P = 14),!.

% yellow: MRT
train(yl01, yellow).
train(yl02, yellow).
train(yl03, yellow).
train(yl04, yellow).
train(yl05, yellow).
train(yl06, yellow).
train(yl07, yellow).
train(yl08, yellow).
train(yl09, yellow).
train(yl10, yellow).
train(yl11, yellow).
train(yl12, yellow).
train(yl13, yellow).
train(yl14, yellow).
train(yl15, yellow).
train(yl16, yellow).
train(yl17, yellow).
train(yl18, yellow).
train(yl19, yellow).
train(yl20, yellow).
train(yl21, yellow).
train(yl22, yellow).
train(yl23, yellow).

train_list([yl01, yl02, yl03, yl04, yl05, yl06, yl07, yl08, yl09, yl10,
    yl11, yl12, yl13, yl14, yl15, yl16, yl17, yl18, yl19, yl20,
    yl21, yl22, yl23], yellow).

fare(X,X,15) :- train(X,yellow).

fare(yl01, yl02, 19).
fare(yl01, yl03, 23).
fare(yl01, yl04, 27).
fare(yl01, yl05, 30).
fare(yl01, yl06, 33).
fare(yl01, yl07, 36).
fare(yl01, yl08, 39).
fare(yl01, yl09, 42).
fare(yl01, yl10, 45).
fare(yl01, yl11, 45).
fare(yl01, yl12, 45).
fare(yl01, yl13, 45).
fare(yl01, yl14, 45).
fare(yl01, yl15, 45).
fare(yl01, yl16, 45).
fare(yl01, yl17, 45).
fare(yl01, yl18, 45).
fare(yl01, yl19, 45).
fare(yl01, yl20, 45).
fare(yl01, yl21, 45).
fare(yl01, yl22, 45).
fare(yl01, yl23, 45).

fare(yl02, yl03, 19).
fare(yl02, yl04, 24).
fare(yl02, yl05, 26).
fare(yl02, yl06, 29).
fare(yl02, yl07, 31).
fare(yl02, yl08, 36).
fare(yl02, yl09, 39).
fare(yl02, yl10, 42).
fare(yl02, yl11, 45).
fare(yl02, yl12, 45).
fare(yl02, yl13, 45).
fare(yl02, yl14, 45).
fare(yl02, yl15, 45).
fare(yl02, yl16, 45).
fare(yl02, yl17, 45).
fare(yl02, yl18, 45).
fare(yl02, yl19, 45).
fare(yl02, yl20, 45).
fare(yl02, yl21, 45).
fare(yl02, yl22, 45).
fare(yl02, yl23, 45).

fare(yl03, yl04, 21).
fare(yl03, yl05, 23).
fare(yl03, yl06, 26).
fare(yl03, yl07, 28).
fare(yl03, yl08, 31).
fare(yl03, yl09, 35).
fare(yl03, yl10, 39).
fare(yl03, yl11, 43).
fare(yl03, yl12, 45).
fare(yl03, yl13, 45).
fare(yl03, yl14, 45).
fare(yl03, yl15, 45).
fare(yl03, yl16, 45).
fare(yl03, yl17, 45).
fare(yl03, yl18, 45).
fare(yl03, yl19, 45).
fare(yl03, yl20, 45).
fare(yl03, yl21, 45).
fare(yl03, yl22, 45).
fare(yl03, yl23, 45).

fare(yl04, yl05, 18).
fare(yl04, yl06, 22).
fare(yl04, yl07, 24).
fare(yl04, yl08, 27).
fare(yl04, yl09, 30).
fare(yl04, yl10, 33).
fare(yl04, yl11, 38).
fare(yl04, yl12, 42).
fare(yl04, yl13, 45).
fare(yl04, yl14, 45).
fare(yl04, yl15, 45).
fare(yl04, yl16, 45).
fare(yl04, yl17, 45).
fare(yl04, yl18, 45).
fare(yl04, yl19, 45).
fare(yl04, yl20, 45).
fare(yl04, yl21, 45).
fare(yl04, yl22, 45).
fare(yl04, yl23, 45).

fare(yl05, yl06, 19).
fare(yl05, yl07, 22).
fare(yl05, yl08, 25).
fare(yl05, yl09, 28).
fare(yl05, yl10, 31).
fare(yl05, yl11, 36).
fare(yl05, yl12, 40).
fare(yl05, yl13, 44).
fare(yl05, yl14, 45).
fare(yl05, yl15, 45).
fare(yl05, yl16, 45).
fare(yl05, yl17, 45).
fare(yl05, yl18, 45).
fare(yl05, yl19, 45).
fare(yl05, yl20, 45).
fare(yl05, yl21, 45).
fare(yl05, yl22, 45).
fare(yl05, yl23, 45).

fare(yl06, yl07, 18).
fare(yl06, yl08, 22).
fare(yl06, yl09, 25).
fare(yl06, yl10, 28).
fare(yl06, yl11, 32).
fare(yl06, yl12, 37).
fare(yl06, yl13, 41).
fare(yl06, yl14, 44).
fare(yl06, yl15, 45).
fare(yl06, yl16, 45).
fare(yl06, yl17, 45).
fare(yl06, yl18, 45).
fare(yl06, yl19, 45).
fare(yl06, yl20, 45).
fare(yl06, yl21, 45).
fare(yl06, yl22, 45).
fare(yl06, yl23, 45).

fare(yl07, yl08, 19).
fare(yl07, yl09, 23).
fare(yl07, yl10, 26).
fare(yl07, yl11, 30).
fare(yl07, yl12, 33).
fare(yl07, yl13, 39).
fare(yl07, yl14, 42).
fare(yl07, yl15, 45).
fare(yl07, yl16, 45).
fare(yl07, yl17, 45).
fare(yl07, yl18, 45).
fare(yl07, yl19, 45).
fare(yl07, yl20, 45).
fare(yl07, yl21, 45).
fare(yl07, yl22, 45).
fare(yl07, yl23, 45).

fare(yl08, yl09, 18).
fare(yl08, yl10, 23).
fare(yl08, yl11, 27).
fare(yl08, yl12, 30).
fare(yl08, yl13, 35).
fare(yl08, yl14, 38).
fare(yl08, yl15, 41).
fare(yl08, yl16, 45).
fare(yl08, yl17, 45).
fare(yl08, yl18, 45).
fare(yl08, yl19, 45).
fare(yl08, yl20, 45).
fare(yl08, yl21, 45).
fare(yl08, yl22, 45).
fare(yl08, yl23, 45).

fare(yl09, yl10, 19).
fare(yl09, yl11, 24).
fare(yl09, yl12, 27).
fare(yl09, yl13, 31).
fare(yl09, yl14, 35).
fare(yl09, yl15, 39).
fare(yl09, yl16, 42).
fare(yl09, yl17, 45).
fare(yl09, yl18, 45).
fare(yl09, yl19, 45).
fare(yl09, yl20, 45).
fare(yl09, yl21, 45).
fare(yl09, yl22, 45).
fare(yl09, yl23, 45).

fare(yl10, yl11, 21).
fare(yl10, yl12, 24).
fare(yl10, yl13, 28).
fare(yl10, yl14, 31).
fare(yl10, yl15, 35).
fare(yl10, yl16, 39).
fare(yl10, yl17, 42).
fare(yl10, yl18, 45).
fare(yl10, yl19, 45).
fare(yl10, yl20, 45).
fare(yl10, yl21, 45).
fare(yl10, yl22, 45).
fare(yl10, yl23, 45).

fare(yl11, yl12, 19).
fare(yl11, yl13, 24).
fare(yl11, yl14, 27).
fare(yl11, yl15, 30).
fare(yl11, yl16, 35).
fare(yl11, yl17, 38).
fare(yl11, yl18, 41).
fare(yl11, yl19, 45).
fare(yl11, yl20, 45).
fare(yl11, yl21, 45).
fare(yl11, yl22, 45).
fare(yl11, yl23, 45).

fare(yl12, yl13, 21).
fare(yl12, yl14, 24).
fare(yl12, yl15, 27).
fare(yl12, yl16, 31).
fare(yl12, yl17, 33).
fare(yl12, yl18, 38).
fare(yl12, yl19, 42).
fare(yl12, yl20, 45).
fare(yl12, yl21, 45).
fare(yl12, yl22, 45).
fare(yl12, yl23, 45).

fare(yl13, yl14, 18).
fare(yl13, yl15, 22).
fare(yl13, yl16, 27).
fare(yl13, yl17, 29).
fare(yl13, yl18, 33).
fare(yl13, yl19, 38).
fare(yl13, yl20, 41).
fare(yl13, yl21, 45).
fare(yl13, yl22, 45).
fare(yl13, yl23, 45).

fare(yl14, yl15, 18).
fare(yl14, yl16, 24).
fare(yl14, yl17, 26).
fare(yl14, yl18, 30).
fare(yl14, yl19, 35).
fare(yl14, yl20, 38).
fare(yl14, yl21, 41).
fare(yl14, yl22, 45).
fare(yl14, yl23, 45).

fare(yl15, yl16, 21).
fare(yl15, yl17, 23).
fare(yl15, yl18, 27).
fare(yl15, yl19, 31).
fare(yl15, yl20, 35).
fare(yl15, yl21, 38).
fare(yl15, yl22, 42).
fare(yl15, yl23, 45).

fare(yl16, yl17, 18).
fare(yl16, yl18, 23).
fare(yl16, yl19, 27).
fare(yl16, yl20, 30).
fare(yl16, yl21, 33).
fare(yl16, yl22, 48).
fare(yl16, yl23, 43).

fare(yl17, yl18, 19).
fare(yl17, yl19, 24).
fare(yl17, yl20, 28).
fare(yl17, yl21, 30).
fare(yl17, yl22, 36).
fare(yl17, yl23, 40).

fare(yl18, yl19, 19).
fare(yl18, yl20, 24).
fare(yl18, yl21, 27).
fare(yl18, yl22, 31).
fare(yl18, yl23, 36).

fare(yl19, yl20, 19).
fare(yl19, yl21, 23).
fare(yl19, yl22, 27).
fare(yl19, yl23, 32).

fare(yl20, yl21, 18).
fare(yl20, yl22, 24).
fare(yl20, yl23, 28).

fare(yl21, yl22, 21).
fare(yl21, yl23, 25).

fare(yl22, yl23, 21).

% pink main: MRT
train(pk01, pink).
train(pk02, pink).
train(pk03, pink).
train(pk04, pink).
train(pk05, pink).
train(pk06, pink).
train(pk07, pink).
train(pk08, pink).
train(pk09, pink).
train(pk10, pink).
train(pk11, pink).
train(pk12, pink).
train(pk13, pink).
train(pk14, pink).
train(pk15, pink).
train(pk16, pink).
train(pk17, pink).
train(pk18, pink).
train(pk19, pink).
train(pk20, pink).
train(pk21, pink).
train(pk22, pink).
train(pk23, pink).
train(pk24, pink).
train(pk25, pink).
train(pk26, pink).
train(pk27, pink).
train(pk28, pink).
train(pk29, pink).
train(pk30, pink).
% pink mt: MRT
%train(pk21_mt, pink).
train(mt01, pink).
train(mt02, pink).

train_list([pk01, pk02, pk03, pk04, pk05, pk06, pk07, pk08, pk09, pk10,
    pk11, pk12, pk13, pk14, pk15, pk16, pk17, pk18, pk19, pk20,
    pk21, pk22, pk23, pk24, pk25, pk26, pk27, pk28, pk29, pk30], pink).
train_list([pk10,mt01,mt02], pink).

fare(P,P,15) :- train(P,pink).

fare(pk02,pk01,18).

fare(pk03,pk01,23).
fare(pk03,pk02,19).

fare(pk04,pk01,28).
fare(pk04,pk02,25).
fare(pk04,pk03,21).

fare(pk05,pk01,30).
fare(pk05,pk02,28).
fare(pk05,pk03,24).
fare(pk05,pk04,18).

fare(pk06,pk01,34).
fare(pk06,pk02,30).
fare(pk06,pk03,26).
fare(pk06,pk04,22).
fare(pk06,pk05,18).

fare(pk07,pk01,37).
fare(pk07,pk02,34).
fare(pk07,pk03,29).
fare(pk07,pk04,25).
fare(pk07,pk05,22).
fare(pk07,pk06,18).

fare(pk08,pk01,41).
fare(pk08,pk02,38).
fare(pk08,pk03,34).
fare(pk08,pk04,29).
fare(pk08,pk05,26).
fare(pk08,pk06,23).
fare(pk08,pk07,19).

fare(pk09,pk01,44).
fare(pk09,pk02,41).
fare(pk09,pk03,38).
fare(pk09,pk04,32).
fare(pk09,pk05,29).
fare(pk09,pk06,27).
fare(pk09,pk07,24).
fare(pk09,pk08,19).

fare(pk10,pk01,45).
fare(pk10,pk02,44).
fare(pk10,pk03,40).
fare(pk10,pk04,36).
fare(pk10,pk05,32).
fare(pk10,pk06,29).
fare(pk10,pk07,26).
fare(pk10,pk08,23).
fare(pk10,pk09,18).

fare(mt01,pk01,45).
fare(mt01,pk02,45).
fare(mt01,pk03,45).
fare(mt01,pk04,40).
fare(mt01,pk05,38).
fare(mt01,pk06,35).
fare(mt01,pk07,31).
fare(mt01,pk08,27).
fare(mt01,pk09,24).
fare(mt01,pk10,21).

fare(mt02,pk01,45).
fare(mt02,pk02,45).
fare(mt02,pk03,45).
fare(mt02,pk04,43).
fare(mt02,pk05,40).
fare(mt02,pk06,37).
fare(mt02,pk07,34).
fare(mt02,pk08,29).
fare(mt02,pk09,26).
fare(mt02,pk10,23).
fare(mt02,mt01,18).

fare(pk11,pk01,45).
fare(pk11,pk02,45).
fare(pk11,pk03,44).
fare(pk11,pk04,39).
fare(pk11,pk05,36).
fare(pk11,pk06,34).
fare(pk11,pk07,30).
fare(pk11,pk08,26).
fare(pk11,pk09,23).
fare(pk11,pk10,19).
fare(pk11,mt01,25).
fare(pk11,mt02,27).

fare(pk12,pk01,45).
fare(pk12,pk02,45).
fare(pk12,pk03,45).
fare(pk12,pk04,41).
fare(pk12,pk05,39).
fare(pk12,pk06,36).
fare(pk12,pk07,32).
fare(pk12,pk08,28).
fare(pk12,pk09,25).
fare(pk12,pk10,22).
fare(pk12,mt01,27).
fare(pk12,mt02,29).
fare(pk12,pk11,18).

fare(pk13,pk01,45).
fare(pk13,pk02,45).
fare(pk13,pk03,45).
fare(pk13,pk04,44).
fare(pk13,pk05,41).
fare(pk13,pk06,39).
fare(pk13,pk07,36).
fare(pk13,pk08,31).
fare(pk13,pk09,28).
fare(pk13,pk10,25).
fare(pk13,mt01,29).
fare(pk13,mt02,32).
fare(pk13,pk11,21).
fare(pk13,pk12,18).

fare(pk14,pk01,45).
fare(pk14,pk02,45).
fare(pk14,pk03,45).
fare(pk14,pk04,45).
fare(pk14,pk05,43).
fare(pk14,pk06,41).
fare(pk14,pk07,38).
fare(pk14,pk08,34).
fare(pk14,pk09,30).
fare(pk14,pk10,27).
fare(pk14,mt01,32).
fare(pk14,mt02,35).
fare(pk14,pk11,23).
fare(pk14,pk12,21).
fare(pk14,pk13,18).

fare(pk15,pk01,45).
fare(pk15,pk02,45).
fare(pk15,pk03,45).
fare(pk15,pk04,45).
fare(pk15,pk05,45).
fare(pk15,pk06,43).
fare(pk15,pk07,40).
fare(pk15,pk08,36).
fare(pk15,pk09,32).
fare(pk15,pk10,29).
fare(pk15,mt01,35).
fare(pk15,mt02,37).
fare(pk15,pk11,26).
fare(pk15,pk12,23).
fare(pk15,pk13,21).
fare(pk15,pk14,18).

fare(pk16,pk01,45).
fare(pk16,pk02,45).
fare(pk16,pk03,45).
fare(pk16,pk04,45).
fare(pk16,pk05,45).
fare(pk16,pk06,45).
fare(pk16,pk07,43).
fare(pk16,pk08,39).
fare(pk16,pk09,36).
fare(pk16,pk10,32).
fare(pk16,mt01,38).
fare(pk16,mt02,40).
fare(pk16,pk11,28).
fare(pk16,pk12,26).
fare(pk16,pk13,24).
fare(pk16,pk14,21).
fare(pk16,pk15,18).

fare(pk17,pk01,45).
fare(pk17,pk02,45).
fare(pk17,pk03,45).
fare(pk17,pk04,45).
fare(pk17,pk05,45).
fare(pk17,pk06,45).
fare(pk17,pk07,45).
fare(pk17,pk08,41).
fare(pk17,pk09,38).
fare(pk17,pk10,35).
fare(pk17,mt01,39).
fare(pk17,mt02,42).
fare(pk17,pk11,30).
fare(pk17,pk12,28).
fare(pk17,pk13,26).
fare(pk17,pk14,23).
fare(pk17,pk15,21).
fare(pk17,pk16,17).

fare(pk18,pk01,45).
fare(pk18,pk02,45).
fare(pk18,pk03,45).
fare(pk18,pk04,45).
fare(pk18,pk05,45).
fare(pk18,pk06,45).
fare(pk18,pk07,45).
fare(pk18,pk08,45).
fare(pk18,pk09,43).
fare(pk18,pk10,40).
fare(pk18,mt01,44).
fare(pk18,mt02,45).
fare(pk18,pk11,36).
fare(pk18,pk12,34).
fare(pk18,pk13,30).
fare(pk18,pk14,28).
fare(pk18,pk15,26).
fare(pk18,pk16,23).
fare(pk18,pk17,21).

fare(pk19,pk01,45).
fare(pk19,pk02,45).
fare(pk19,pk03,45).
fare(pk19,pk04,45).
fare(pk19,pk05,45).
fare(pk19,pk06,45).
fare(pk19,pk07,45).
fare(pk19,pk08,45).
fare(pk19,pk09,45).
fare(pk19,pk10,42).
fare(pk19,mt01,45).
fare(pk19,mt02,45).
fare(pk19,pk11,39).
fare(pk19,pk12,37).
fare(pk19,pk13,34).
fare(pk19,pk14,31).
fare(pk19,pk15,29).
fare(pk19,pk16,26).
fare(pk19,pk17,24).
fare(pk19,pk18,18).

fare(pk20,pk01,45).
fare(pk20,pk02,45).
fare(pk20,pk03,45).
fare(pk20,pk04,45).
fare(pk20,pk05,45).
fare(pk20,pk06,45).
fare(pk20,pk07,45).
fare(pk20,pk08,45).
fare(pk20,pk09,45).
fare(pk20,pk10,44).
fare(pk20,mt01,45).
fare(pk20,mt02,45).
fare(pk20,pk11,41).
fare(pk20,pk12,39).
fare(pk20,pk13,36).
fare(pk20,pk14,34).
fare(pk20,pk15,31).
fare(pk20,pk16,28).
fare(pk20,pk17,26).
fare(pk20,pk18,21).
fare(pk20,pk19,17).

fare(pk21,pk01,45).
fare(pk21,pk02,45).
fare(pk21,pk03,45).
fare(pk21,pk04,45).
fare(pk21,pk05,45).
fare(pk21,pk06,45).
fare(pk21,pk07,45).
fare(pk21,pk08,45).
fare(pk21,pk09,45).
fare(pk21,pk10,45).
fare(pk21,mt01,45).
fare(pk21,mt02,45).
fare(pk21,pk11,44).
fare(pk21,pk12,42).
fare(pk21,pk13,40).
fare(pk21,pk14,37).
fare(pk21,pk15,35).
fare(pk21,pk16,31).
fare(pk21,pk17,29).
fare(pk21,pk18,25).
fare(pk21,pk19,22).
fare(pk21,pk20,19).

fare(pk22,pk01,45).
fare(pk22,pk02,45).
fare(pk22,pk03,45).
fare(pk22,pk04,45).
fare(pk22,pk05,45).
fare(pk22,pk06,45).
fare(pk22,pk07,45).
fare(pk22,pk08,45).
fare(pk22,pk09,45).
fare(pk22,pk10,45).
fare(pk22,mt01,45).
fare(pk22,mt02,45).
fare(pk22,pk11,45).
fare(pk22,pk12,44).
fare(pk22,pk13,42).
fare(pk22,pk14,40).
fare(pk22,pk15,37).
fare(pk22,pk16,35).
fare(pk22,pk17,32).
fare(pk22,pk18,27).
fare(pk22,pk19,24).
fare(pk22,pk20,22).
fare(pk22,pk21,18).

fare(pk23,pk01,45).
fare(pk23,pk02,45).
fare(pk23,pk03,45).
fare(pk23,pk04,45).
fare(pk23,pk05,45).
fare(pk23,pk06,45).
fare(pk23,pk07,45).
fare(pk23,pk08,45).
fare(pk23,pk09,45).
fare(pk23,pk10,45).
fare(pk23,mt01,45).
fare(pk23,mt02,45).
fare(pk23,pk11,45).
fare(pk23,pk12,45).
fare(pk23,pk13,45).
fare(pk23,pk14,42).
fare(pk23,pk15,40).
fare(pk23,pk16,37).
fare(pk23,pk17,36).
fare(pk23,pk18,30).
fare(pk23,pk19,27).
fare(pk23,pk20,25).
fare(pk23,pk21,22).
fare(pk23,pk22,18).

fare(pk24,pk01,45).
fare(pk24,pk02,45).
fare(pk24,pk03,45).
fare(pk24,pk04,45).
fare(pk24,pk05,45).
fare(pk24,pk06,45).
fare(pk24,pk07,45).
fare(pk24,pk08,45).
fare(pk24,pk09,45).
fare(pk24,pk10,45).
fare(pk24,mt01,45).
fare(pk24,mt02,45).
fare(pk24,pk11,45).
fare(pk24,pk12,45).
fare(pk24,pk13,45).
fare(pk24,pk14,45).
fare(pk24,pk15,43).
fare(pk24,pk16,41).
fare(pk24,pk17,39).
fare(pk24,pk18,34).
fare(pk24,pk19,30).
fare(pk24,pk20,28).
fare(pk24,pk21,25).
fare(pk24,pk22,22).
fare(pk24,pk23,19).

fare(pk25,pk01,45).
fare(pk25,pk02,45).
fare(pk25,pk03,45).
fare(pk25,pk04,45).
fare(pk25,pk05,45).
fare(pk25,pk06,45).
fare(pk25,pk07,45).
fare(pk25,pk08,45).
fare(pk25,pk09,45).
fare(pk25,pk10,45).
fare(pk25,mt01,45).
fare(pk25,mt02,45).
fare(pk25,pk11,45).
fare(pk25,pk12,45).
fare(pk25,pk13,45).
fare(pk25,pk14,45).
fare(pk25,pk15,45).
fare(pk25,pk16,44).
fare(pk25,pk17,43).
fare(pk25,pk18,38).
fare(pk25,pk19,35).
fare(pk25,pk20,32).
fare(pk25,pk21,29).
fare(pk25,pk22,26).
fare(pk25,pk23,23).
fare(pk25,pk24,19).

fare(pk26,pk01,45).
fare(pk26,pk02,45).
fare(pk26,pk03,45).
fare(pk26,pk04,45).
fare(pk26,pk05,45).
fare(pk26,pk06,45).
fare(pk26,pk07,45).
fare(pk26,pk08,45).
fare(pk26,pk09,45).
fare(pk26,pk10,45).
fare(pk26,mt01,45).
fare(pk26,mt02,45).
fare(pk26,pk11,45).
fare(pk26,pk12,45).
fare(pk26,pk13,45).
fare(pk26,pk14,45).
fare(pk26,pk15,45).
fare(pk26,pk16,45).
fare(pk26,pk17,45).
fare(pk26,pk18,42).
fare(pk26,pk19,39).
fare(pk26,pk20,37).
fare(pk26,pk21,34).
fare(pk26,pk22,30).
fare(pk26,pk23,28).
fare(pk26,pk24,34).
fare(pk26,pk25,21).

fare(pk27,pk01,45).
fare(pk27,pk02,45).
fare(pk27,pk03,45).
fare(pk27,pk04,45).
fare(pk27,pk05,45).
fare(pk27,pk06,45).
fare(pk27,pk07,45).
fare(pk27,pk08,45).
fare(pk27,pk09,45).
fare(pk27,pk10,45).
fare(pk27,mt01,45).
fare(pk27,mt02,45).
fare(pk27,pk11,45).
fare(pk27,pk12,45).
fare(pk27,pk13,45).
fare(pk27,pk14,45).
fare(pk27,pk15,45).
fare(pk27,pk16,45).
fare(pk27,pk17,45).
fare(pk27,pk18,45).
fare(pk27,pk19,44).
fare(pk27,pk20,42).
fare(pk27,pk21,38).
fare(pk27,pk22,36).
fare(pk27,pk23,32).
fare(pk27,pk24,29).
fare(pk27,pk25,25).
fare(pk27,pk26,21).

fare(pk28,pk01,45).
fare(pk28,pk02,45).
fare(pk28,pk03,45).
fare(pk28,pk04,45).
fare(pk28,pk05,45).
fare(pk28,pk06,45).
fare(pk28,pk07,45).
fare(pk28,pk08,45).
fare(pk28,pk09,45).
fare(pk28,pk10,45).
fare(pk28,mt01,45).
fare(pk28,mt02,45).
fare(pk28,pk11,45).
fare(pk28,pk12,45).
fare(pk28,pk13,45).
fare(pk28,pk14,45).
fare(pk28,pk15,45).
fare(pk28,pk16,45).
fare(pk28,pk17,45).
fare(pk28,pk18,45).
fare(pk28,pk19,45).
fare(pk28,pk20,44).
fare(pk28,pk21,41).
fare(pk28,pk22,38).
fare(pk28,pk23,36).
fare(pk28,pk24,32).
fare(pk28,pk25,28).
fare(pk28,pk26,24).
fare(pk28,pk27,18).

fare(pk29,pk01,45).
fare(pk29,pk02,45).
fare(pk29,pk03,45).
fare(pk29,pk04,45).
fare(pk29,pk05,45).
fare(pk29,pk06,45).
fare(pk29,pk07,45).
fare(pk29,pk08,45).
fare(pk29,pk09,45).
fare(pk29,pk10,45).
fare(pk29,mt01,45).
fare(pk29,mt02,45).
fare(pk29,pk11,45).
fare(pk29,pk12,45).
fare(pk29,pk13,45).
fare(pk29,pk14,45).
fare(pk29,pk15,45).
fare(pk29,pk16,45).
fare(pk29,pk17,45).
fare(pk29,pk18,45).
fare(pk29,pk19,45).
fare(pk29,pk20,45).
fare(pk29,pk21,45).
fare(pk29,pk22,42).
fare(pk29,pk23,39).
fare(pk29,pk24,36).
fare(pk29,pk25,32).
fare(pk29,pk26,27).
fare(pk29,pk27,23).
fare(pk29,pk28,19).

fare(pk30,pk01,45).
fare(pk30,pk02,45).
fare(pk30,pk03,45).
fare(pk30,pk04,45).
fare(pk30,pk05,45).
fare(pk30,pk06,45).
fare(pk30,pk07,45).
fare(pk30,pk08,45).
fare(pk30,pk09,45).
fare(pk30,pk10,45).
fare(pk30,mt01,45).
fare(pk30,mt02,45).
fare(pk30,pk11,45).
fare(pk30,pk12,45).
fare(pk30,pk13,45).
fare(pk30,pk14,45).
fare(pk30,pk15,45).
fare(pk30,pk16,45).
fare(pk30,pk17,45).
fare(pk30,pk18,45).
fare(pk30,pk19,45).
fare(pk30,pk20,45).
fare(pk30,pk21,45).
fare(pk30,pk22,45).
fare(pk30,pk23,42).
fare(pk30,pk24,39).
fare(pk30,pk25,35).
fare(pk30,pk26,30).
fare(pk30,pk27,25).
fare(pk30,pk28,23).
fare(pk30,pk29,18).

% airport rail link
train(a1, airport).
train(a2, airport).
train(a3, airport).
train(a4, airport).
train(a5, airport).
train(a6, airport).
train(a7, airport).
train(a8, airport).

train_list([a1,a2,a3,a4,a5,a6,a7,a8], airport).
fare(From, To, Price) :- train(From, airport), train(To, airport), count(From,To,D), condition_air(D, Price), !.
condition_air(0,15) :- !.
condition_air(1,15) :- !.
condition_air(2,20) :- !.
condition_air(3,25) :- !.
condition_air(4,30) :- !.
condition_air(5,35) :- !.
condition_air(6,40) :- !.
condition_air(_,45) :- !.

% dark red
train(rn01, red).
train(rn02, red).
train(rn03, red).
train(rn04, red).
train(rn05, red).
train(rn06, red).
train(rn07, red).
train(rn08, red).
train(rn09, red).
train(rn10, red).
% light red
%train(rw01,red).
train(rw02, red).
train(rw05, red).
train(rw06, red). 

train_list(
	[rw06,rw05, rw02,
	rn01,rn02,rn03,rn04,rn05,
	rn06,rn07,rn08,rn09,rn10], red).

fare(R,R,12):- train(R, red),!.

fare(rn10, rn09, 17).
fare(rn10, rn08, 26).
fare(rn10, rn07, 29).
fare(rn10, rn06, 32).
fare(rn10, rn05, 36).
fare(rn10, rn04, 38).
fare(rn10, rn03, 40).
fare(rn10, rn02, 42).
fare(rn10, rn01, 42).
fare(rn10, rw02, 42).
fare(rn10, rw05, 42).
fare(rn10, rw06, 42).

fare(rn09,rn08,21).
fare(rn09,rn07,24).
fare(rn09,rn06,27).
fare(rn09,rn05,32).
fare(rn09,rn04,34).
fare(rn09,rn03,35).
fare(rn09,rn02,38).
fare(rn09,rn01,42).
fare(rn09,rw02,42).
fare(rn09,rw05,42).
fare(rn09,rw06,42).

fare(rn08,rn07,15).
fare(rn08,rn06,18).
fare(rn08,rn05,23).
fare(rn08,rn04,25).
fare(rn08,rn03,26).
fare(rn08,rn02,29).
fare(rn08,rn01,33).
fare(rn08,rw02,39).
fare(rn08,rw05,42).
fare(rn08,rw06,42).

fare(rn07,rn06,15).
fare(rn07,rn05,20).
fare(rn07,rn04,22).
fare(rn07,rn03,23).
fare(rn07,rn02,26).
fare(rn07,rn01,30).
fare(rn07,rw02,36).
fare(rn07,rw05,42).
fare(rn07,rw06,42).

fare(rn06,rn05,17).
fare(rn06,rn04,19).
fare(rn06,rn03,20).
fare(rn06,rn02,23).
fare(rn06,rn01,27).
fare(rn06,rw02,33).
fare(rn06,rw05,42).
fare(rn06,rw06,42).

fare(rn05,rn04,14).
fare(rn05,rn03,16).
fare(rn05,rn02,19).
fare(rn05,rn01,23).
fare(rn05,rw02,29).
fare(rn05,rw05,39).
fare(rn05,rw06,42).

fare(rn04,rn03,14).
fare(rn04,rn02,17).
fare(rn04,rn01,20).
fare(rn04,rw02,26).
fare(rn04,rw05,37).
fare(rn04,rw06,42).

fare(rn03,rn02,15).
fare(rn03,rn01,19).
fare(rn03,rw02,25).
fare(rn03,rw05,35).
fare(rn03,rw06,41).

fare(rn02,rn01,16).
fare(rn02,rw02,22).
fare(rn02,rw05,32).
fare(rn02,rw06,38).

fare(rn01,rw02,18).
fare(rn01,rw05,29).
fare(rn01,rw06,35).

fare(rw02,rw05,23).
fare(rw02,rw06,29).

fare(rw05,rw06,18).

% linkage
linkage(n17, pk16).
linkage(n9, bl14).
linkage(n8, bl13).
linkage(n2, a8).
linkage(cen_lg, cen_dg).
linkage(e4, bl22).
linkage(e15, yl23).
linkage(s2, bl26).
linkage(s7, g1).
linkage(s12, bl34).

linkage(bl10, pp16).
linkage(bl11, rn01).
linkage(bl11, rw01).
linkage(bl15, yl01).
linkage(bl21, a6).

linkage(pp11, pk01).
linkage(pp15, rw02).

linkage(yl11, a4).

linkage(pk14, rn06).

linkage(pk16, n17).
linkage(bl14, n9).
linkage(bl13, n8).
linkage(a8, n2).
linkage(cen_dg, cen_lg).
linkage(bl22, e4).
linkage(yl23, e15).
linkage(bl26, s2).
linkage(g1, s7).
linkage(bl34, s12).

linkage(pp16, bl10).
linkage(rn01, bl11).
linkage(rw01, bl11).
linkage(yl01, bl15).
linkage(a6, bl21).

linkage(pk01, pp11).
linkage(rw02, pp15).

linkage(a4, yl11).

linkage(rn06, pk14).

% universally reverse fare rate

fare(From, To, Cost) :- fare(To, From, Cost),!.

% universally count the length in the same line
count(From, From, 0) :- !.
count(From, To, Count):- % loop
	train_list(List,blue),
	member(From,List),
	member(To,List),
	length(List, Length),
	Length == 32, !,
	count_from(From,To,List,C),
	(C > 16
	-> Count is 32-C
	; Count is C).
count(From, To, Count) :- 
	train(From, X),
	train(To, X),
	train_list(List, X),
	member(From,List),
	member(To,List),!,
	count_from(From, To, List, Count).
count(From, To, Count):-
	train(From, blue),
	train(To, blue),
	train_list(List, blue),
	member(From,List), \+member(To,List),!,
	count(From,bl01,C1), count(To,bl01,C2),
	Count is C1 + C2.
count(From, To, Count):-
	train(From, pink),
	train(To, pink),
	train_list(List, pink),
	member(From,List), \+member(To,List),!,
	count(From,pk10,C1), count(To,pk10,C2),
	Count is C1 + C2.
count(From, To, Count):-
	train(From, X), train(To, Y), X \= Y,
	linkage(A,B),train(A,X), train(B,Y), 
	count(From,A,C1), count(To,B,C2),
	Count is C1 + C2.

	
count_from(From, To, [X|Tail], Count) :- X \= From, count_from(From, To, Tail, Count).
count_from(From, To, [From|Tail], Count) :- count_until(From, To, Tail, 1, Count).
count_until(From, To, [To|_], Count, Count) :- !.
count_until(From, To, [_|Tail], Acc, Count) :-
	NewAcc is Acc + 1,
	count_until(From, To, Tail, NewAcc, Count).
count_until(From, To, [], _, Count) :- count(To, From, Count).

% path:  path(From,To, Visited, Path, Length, Fare, Interchange)
path(From,To, Path, Length, Fare):- path(From,To,[], Path, Length, Fare).

		% same line
path(From,To,_, [From,To], Length, Fare, 0):-
	train(From, X), train(To, X),!,
	fare(From,To,Fare), count(From,To,Length).
		% greens linkage
path(From,To,_, X3, Length, Fare,1):-
	train(From, lightgreen), train(To, darkgreen),!,
    X = [From],
    (From \= cen_lg ->  append(X,[cen_lg],X1); X1 = X),
    (To \= cen_dg ->  append(X1,[cen_dg],X2);X2 = X1),
    append(X2,[To],X3),
	fare(From,To,Fare), count(From,To,Length).
path(From,To, _,X3, Length, Fare, 1):-
	train(From, darkgreen), train(To, lightgreen),!,
    X = [From],
    (From \= cen_dg ->  append(X,[cen_dg],X1);X1 = X),
    (To \= cen_lg ->  append(X1,[cen_lg],X2);X2 = X1),
    append(X2,[To],X3),
	fare(From,To,Fare), count(From,To,Length).

		% with linkage
path(From, To,_, L3, Length, Fare, 1):-
	train(From, X), train(To, Y),
	(   (X == lightgreen -> Y \= darkgreen
	 ;   X == darkgreen -> Y \= lightgreen)
    ;   true),
	linkage(A,B), train(A,X), train(B,Y),
    	L = [From],
   	 (From \= A ->  append(L,[A],L1);L1 = L),
    	(To \= B ->  append(L1,[B],L2);L2 = L1),
    	append(L2,[To],L3),
  	fare(From,A,F1), fare(B,To,F2), Fare is F1 + F2,
	count(From,A,C1), count(B,To,C2), Length is C1+C2.
		% no linkage: number station
path(From,To,Visited,List,Length,Fare, Interchange):- 
	train(From, X), train(To, Y),
	(   (X == lightgreen -> Y \= darkgreen
	 ;   X == darkgreen -> Y \= lightgreen)
    ;   true),
	linkage(A,B), train(A,X), \+ train(B,Y), 
    train(B,Z), \+ (train(C,Z), member(C,Visited)),
    ((Z == lightgreen ->  \+ (train(C,darkgreen), member(C,Visited))
      ;  Z == darkgreen ->  \+ (train(C,lightgreen), member(C,Visited)))
    ;   true),
    L = [From],
    (From \= A ->  append(L,[A],L1);L1 = L),
    append(Visited,[From,A], Visited2),
    path(B,To,Visited2,P,C,F,I), 
    append(L1,P,List),
    fare(From,A,F1), Fare is F1 + F,
    count(From,A,C1), Length is C + C1,
    Interchange is I + 1.


% predsort/3: Sort a list based on a comparison predicate
predsort(_, [], []).  % Base case: an empty list is already sorted

predsort(Pred, [Head|Tail], Sorted) :-
    predsort(Pred, Tail, SortedTail),  % Recursively sort the tail
    insert(Pred, Head, SortedTail, Sorted).  % Insert the head in the sorted tail

% insert/4: Insert an element into a sorted list maintaining the order
insert(_, X, [], [X]).  % Insert at the end if the list is empty

% Insert X before Y based on the comparison result
insert(compare_by_fare, X, [Y|Ys], [X, Y|Ys]) :-
    compare_by_fare(<, X, Y).  % Direct comparison using compare_by_fare

% If X is not less than Y, insert X further down the list
insert(compare_by_fare, X, [Y|Ys], [Y|Zs]) :-
    \+ compare_by_fare(<, X, Y),  % If X is not less than Y, continue to insert X further
    insert(compare_by_fare, X, Ys, Zs).

% Insert based on compare_by_distance (if sorting by distance)
insert(compare_by_distance, X, [Y|Ys], [X, Y|Ys]) :-
    compare_by_distance(<, X, Y).  % Direct comparison using compare_by_distance

insert(compare_by_distance, X, [Y|Ys], [Y|Zs]) :-
    \+ compare_by_distance(<, X, Y),
    insert(compare_by_distance, X, Ys, Zs).

% Insert based on compare_by_time (if sorting by time)
insert(compare_by_time, X, [Y|Ys], [X, Y|Ys]) :-
    compare_by_time(<, X, Y).  % Direct comparison using compare_by_time

insert(compare_by_time, X, [Y|Ys], [Y|Zs]) :-
    \+ compare_by_time(<, X, Y),
    insert(compare_by_time, X, Ys, Zs).

% Insert based on compare_by_all (if sorting by all)
insert(compare_by_all, X, [Y|Ys], [X, Y|Ys]) :-
    compare_by_all(<, X, Y).  % Direct comparison using compare_by_all

insert(compare_by_all, X, [Y|Ys], [Y|Zs]) :-
    \+ compare_by_all(<, X, Y),
    insert(compare_by_all, X, Ys, Zs).

		% choose path
% Sort a list by fare
compare_by_fare(Order, [_, _, Fare1,_], [_, _, Fare2,_]) :-
    (   Fare1 < Fare2 -> Order = '<'
    ;   Fare1 > Fare2 -> Order = '>'
    ;   Order = '='
    ).
sort_by_fare(List, SortedList) :-
    predsort(compare_by_fare, List, SortedList).

cheapest_path(From, To, Path, Length, Fare,Interchange) :-
    setof([P, L, F, I], path(From, To,[], P, L, F, I), Paths),
    % Sort the paths by fare to find the one with the lowest fare
    sort_by_fare(Paths, SortedPaths),
    %writeln(SortedPaths),
    SortedPaths = [[Path, Length, Fare, Interchange]|_]. % Get the path with the lowest fare

% Sort a list by distance
compare_by_distance(Order, [_, Distance1, _,_], [_, Distance2, _,_]) :-
    (   Distance1 < Distance2 -> Order = '<'
    ;   Distance1 > Distance2 -> Order = '>'
    ;   Order = '='
    ).
sort_by_distance(List, SortedList) :-
    predsort(compare_by_distance, List, SortedList).

shortest_path(From, To, Path, Length, Fare,Interchange) :-
    setof([P, L, F, I], path(From, To,[], P, L, F, I), Paths),
    % Sort the paths by length to find the shortest one
    sort_by_distance(Paths, SortedPaths),
    SortedPaths = [[Path, Length, Fare, Interchange]|_]. % Get the shortest path

% Sort a list by distance + interchange => fastest time
compare_by_time(Order, [_, Distance1, _,Interchange1], [_, Distance2, _,Interchange2]) :-
    (   (Distance1 + Interchange1) < (Distance2 + Interchange2) -> Order = '<'
    ;   (Distance1 + Interchange1) > (Distance2 + Interchange2) -> Order = '>'
    ;   Order = '='
    ).
sort_by_time(List, SortedList) :-
    predsort(compare_by_time, List, SortedList).

fastest_path(From, To, Path, Length, Fare,Interchange) :-
    setof([P, L, F, I], path(From, To,[], P, L, F, I), Paths),
    % Sort the paths by length to find the shortest one
    sort_by_time(Paths, SortedPaths),
    SortedPaths = [[Path, Length, Fare, Interchange]|_]. % Get the shortest path

%Sort a list by the best path => 
%(check time first then if the one which is slower is cheaper than another for 20%
compare_by_all(Order, [_, Distance1, Fare1 ,Interchange1], [_, Distance2, Fare2,Interchange2]) :-
    (   (Distance1 + Interchange1) < (Distance2 + Interchange2) -> % no 2
    		(   Fare1 * 0.8 < Fare2 ->  Order = '<'
            ;   Order = '>')
    ;   (Distance1 + Interchange1) > (Distance2 + Interchange2) -> % no 1
			(   Fare1  >  Fare2 * 0.8 ->  Order = '>'
            ;   Order = '<')
    ;   Order = '='
    ).
sort_by_all(List, SortedList) :-
    predsort(compare_by_all, List, SortedList).

best_path(From, To, Path, Length, Fare,Interchange) :-
    setof([P, L, F, I], path(From, To,[], P, L, F, I), Paths),
    % Sort the paths by length to find the shortest one
    sort_by_all(Paths, SortedPaths),
    SortedPaths = [[Path, Length, Fare, Interchange]|_]. % Get the shortest path

