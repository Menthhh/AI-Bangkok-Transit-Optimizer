% light green: BTS
train(n24,lightgreen). coordinate(n24,13.9324,100.6466).
train(n23,lightgreen). coordinate(n23,13.9249,100.6259).
train(n22,lightgreen). coordinate(n22,13.9180,100.6217).
train(n21,lightgreen). coordinate(n21,13.9108,100.6466).
train(n20,lightgreen). coordinate(n20,13.8966,100.6091).
train(n19,lightgreen). coordinate(n19,13.8885,100.6043).
train(n18,lightgreen). coordinate(n18,13.8825,100.6008).
train(n17,lightgreen). coordinate(n17,13.8752,100.5967).
train(n16,lightgreen). coordinate(n16,13.8677,100.592).
train(n15,lightgreen). coordinate(n15,13.8561,100.5852).
train(n14,lightgreen). coordinate(n14,13.8505,100.5817).
train(n13,lightgreen). coordinate(n13,13.842,100.5767).
train(n12,lightgreen). coordinate(n12,13.8368,100.5737).
train(n11,lightgreen). coordinate(n11,13.83,100.5697).
train(n10,lightgreen). coordinate(n10,13.823,100.5658).
train(n9,lightgreen). coordinate(n9,13.8168,100.562).
train(n8,lightgreen). coordinate(n8,13.8027,100.5539).
train(n7,lightgreen). coordinate(n7,13.7398,100.5498).
train(n6,lightgreen). coordinate(n6,13.7880,100.5424).
train(n5,lightgreen). coordinate(n5, 13.7798, 100.5446).
train(n4,lightgreen). coordinate(n4, 13.7726, 100.5421).
train(n3,lightgreen). coordinate(n3, 13.7628, 100.5371).
train(n2,lightgreen). coordinate(n2, 13.757, 100.5338).
train(n1,lightgreen). coordinate(n1, 13.752, 100.5316).
train(cen_lg,lightgreen). coordinate(cen_lg, 13.7456, 100.5342).
train(e1,lightgreen). coordinate(e1, 13.7441, 100.5431).
train(e2,lightgreen). coordinate(e2, 13.7431, 100.5489).
train(e3,lightgreen). coordinate(e3, 13.7406, 100.5555).
train(e4,lightgreen). coordinate(e4, 13.7371, 100.5604).
train(e5,lightgreen). coordinate(e5, 13.7305, 100.5697).
train(e6,lightgreen). coordinate(e6,13.7243, 100.5786).
train(e7,lightgreen). coordinate(e7,13.7196, 100.5852).
train(e8,lightgreen). coordinate(e8,13.7153, 100.5913).
train(e9,lightgreen). coordinate(e9,13.7056, 100.6011).
train(e10,lightgreen). coordinate(e10,13.6969, 100.6052).
train(e11,lightgreen). coordinate(e11,13.6889, 100.6092).
train(e12,lightgreen). coordinate(e12,13.6804, 100.6097).
train(e13,lightgreen). coordinate(e13,13.6683, 100.6047).
train(e14,lightgreen). coordinate(e14,13.6594, 100.6011).
train(e15,lightgreen). coordinate(e15,13.6474, 100.5961).
train(e16,lightgreen). coordinate(e16,13.6376, 100.592).
train(e17,lightgreen). coordinate(e17,13.6217, 100.59).
train(e18,lightgreen). coordinate(e18,13.6082, 100.5949).
train(e19,lightgreen). coordinate(e19,13.6024, 100.597).
train(e20,lightgreen). coordinate(e20,13.592, 100.609).
train(e21,lightgreen). coordinate(e21,13.5845, 100.6078).
train(e22,lightgreen). coordinate(e22,13.5777, 100.6052).
train(e23,lightgreen). coordinate(e23,13.5678, 100.6076).

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
fare(From, To, Cost, Type) :- 
    train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), member(From, X), member(To, X), !,
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15).
fare(From, To, P,Type) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), H == To, !, count(From,H,D),
	condition_green(D,P2), (Type == purple ->  old_devide(P2, P); P = P2).
fare(From, To, P,Type) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), !, count(From,H,D),
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15),
	condition_green(D,P1) , (Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From, To, P,Type) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), H == From, !, count(To,H,D),
	condition_green(D,P2), (Type == purple ->  old_devide(P2, P); P = P2).
fare(From, To, P,Type) :- 	
	train(From, lightgreen), 
	train(To, lightgreen), 
	special(X, lightgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), !, count(To,H,D),
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15),
	condition_green(D,P1) , (Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From, To, P,Type) :- 
    train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), \+member(From, X), member(To, X),!,
    (Type == purple ->  P = 9; P = 17).
fare(From, To, P,Type) :- 
    train(From, lightgreen), train(To, lightgreen), special(X, lightgreen), \+member(From, X), \+member(To, X), !, 
    count(From,To,D), condition_green(D,P2), (Type == purple ->  old_devide(P2, P); P = P2).

% dark green: BTS
train(w1, darkgreen). coordinate(w1,13.7466, 100.5292).
train(cen_dg, darkgreen). coordinate(cen_dg,13.7456, 100.5342).
train(s1, darkgreen). coordinate(s1,13.7393, 100.5395).
train(s2, darkgreen). coordinate(s2,13.7286, 100.5342).
train(s3, darkgreen). coordinate(s3,13.7238, 100.5294).
train(s4, darkgreen). coordinate(s4,13.721, 100.527).
train(s5, darkgreen). coordinate(s5,13.7193, 100.5215).
train(s6, darkgreen). coordinate(s6,13.7188, 100.5141).
train(s7, darkgreen). coordinate(s7,13.721, 100.5024).
train(s8, darkgreen). coordinate(s8,13.7211, 100.4952).
train(s9, darkgreen). coordinate(s9,13.7193, 100.4859).
train(s10, darkgreen). coordinate(s10,13.7131, 100.4756).
train(s11, darkgreen). coordinate(s11,13.7123,100.4710).
train(s12, darkgreen). coordinate(s12,13.7208, 100.458).

train_list([w1,cen_dg,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12],darkgreen).
special([s8, s9, s10, s11, s12], darkgreen).

fare(From, To, Cost, Type) :- 
    train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), member(From, X), member(To, X), !,
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15).

fare(From, To, P ,Type) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), H == To, !, count(From,H,D),
	condition_green(D,P1), (Type == purple ->  old_devide(P1, P); P = P1).
fare(From, To, P, Type) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(From, X), 
	X = [H|_],
	member(To, X), !, count(From,H,D),
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15),
	condition_green(D,P1) ,(Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From, To, P,Type) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(To, X), 
	X = [H|_],
	member(From, X), H == From, !, count(To,H,D),
	condition_green(D,P1), (Type == purple ->  old_devide(P1, P); P = P1).
fare(From, To, P,Type) :- 	
	train(From, darkgreen), 
	train(To, darkgreen), 
	special(X, darkgreen), 
	\+member(To, X), 
	X = [H|_],
    (Type == green ->  Cost = 10; Type == purple ->  Cost = 7; Cost = 15),
	member(From, X), !, count(To,H,D),
	condition_green(D,P1) , (Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From, To, P,Type) :- 
    train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), \+member(From, X), member(To, X),!,
    (Type == purple ->  P = 9; P = 17).
fare(From, To, P ,_) :- train(From, darkgreen), train(To, darkgreen), special(X, darkgreen), \+member(From, X), \+member(To, X), count(From,To,D), condition_green(D,P), !.
% cross greens
fare(From,To,P,Type) :-
	train(From, darkgreen), special(X, darkgreen), member(From,X),
	X = [H|_], H \= From,
	train(To, lightgreen),!,
	count(From, To,D),
    (Type == green ->  Cost = 10; Cost = 15),
	condition_green(D,P1) , (Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From,To,P,Type) :-
	train(From, darkgreen), 
	train(To, lightgreen), special(Y, lightgreen), member(To,Y),
	Y = [H|_], H \= To, !,
	count(From, To,D),
    (Type == green ->  Cost = 10; Cost = 15),
	condition_green(D,P1) , (Type == purple ->  old_devide(P1, P2); P2 = P1), P is P2+Cost.
fare(From,To,P,Type) :-
	train(From, darkgreen), %special(X, darkgreen), \+member(From,X),
	train(To, lightgreen), %special(Y, lightgreen), \+member(To,Y),
	count(From, To,D),
	condition_green(D,P1), (Type == purple ->  old_devide(P1, P); P = P1).

% gold: BTS
train(g1, gold). coordinate(g1, 13.721, 100.5024).
train(g2, gold). coordinate(g2,13.7266, 100.5089).
train(g3, gold). coordinate(g3,13.7305, 100.5076).

train_list([g1,g2,g3], gold).
fare(X,Y,16) :- train(X,gold), train(Y,gold).

% blue: MRT
train(bl01, blue). coordinate(bl01 ,13.7295, 100.4742).
train(bl02, blue). coordinate(bl02, 13.7401, 100.4707).
train(bl03, blue). coordinate(bl03, 13.7558, 100.4694).
train(bl04, blue). coordinate(bl04, 13.7633, 100.4731 ).
train(bl05, blue). coordinate(bl05, 13.7775, 100.4853).
train(bl06, blue). coordinate(bl06, 13.7842, 100.4937).
train(bl07, blue). coordinate(bl07, 13.7927, 100.5049).
train(bl08, blue). coordinate(bl08, 13.799, 100.5097).
train(bl09, blue). coordinate(bl09, 13.8065, 100.5209).
train(bl10, blue). coordinate(bl10, 13.8062, 100.5308).
train(bl11, blue). coordinate(bl11, 13.804, 100.5418).
train(bl12, blue). coordinate(bl12, 13.7978, 100.5483).
train(bl13, blue). coordinate(bl13, 13.8028, 100.554).
train(bl14, blue). coordinate(bl14,13.813, 100.5621 ).
train(bl15, blue). coordinate(bl15, 13.8065, 100.5731).
train(bl16, blue). coordinate(bl16, 13.7992, 100.5749).
train(bl17, blue). coordinate(bl17, 13.7902, 100.5741).
train(bl18, blue). coordinate(bl18, 13.7787, 100.5741 ).
train(bl19, blue). coordinate(bl19, 13.7661, 100.57).
train(bl20, blue). coordinate(bl20, 13.7573, 100.5653).
train(bl21, blue). coordinate(bl21, 13.7491, 100.5629).
train(bl22, blue). coordinate(bl22, 13.7386, 100.5614).
train(bl23, blue). coordinate(bl23, 13.7231, 100.56).
train(bl24, blue). coordinate(bl24, 13.7225, 100.554).
train(bl25, blue). coordinate(bl25, 13.7256, 100.5459).
train(bl26, blue). coordinate(bl26, 13.7293, 100.5375).
train(bl27, blue). coordinate(bl27, 13.7325, 100.5289).
train(bl28, blue). coordinate(bl28, 13.7373,100.5180).
train(bl29, blue). coordinate(bl29, 13.7421, 100.5101).
train(bl30, blue). coordinate(bl30, 13.7473, 100.5013 ).
train(bl31, blue). coordinate(bl31, 13.7441, 100.4939).
train(bl32, blue). coordinate(bl32, 13.7385, 100.4853).
train(bl33, blue). coordinate(bl33, 13.7246, 100.4647).
train(bl34, blue). coordinate(bl34, 13.7208, 100.458 ).
train(bl35, blue). coordinate(bl35, 13.7156, 100.4455).
train(bl36, blue). coordinate(bl36, 13.713, 100.4352).
train(bl37, blue). coordinate(bl37, 13.712, 100.4222).
train(bl38, blue). coordinate(bl38, 13.711, 100.4095).

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
train(pp01, purple). coordinate(pp01, 13.8925, 100.4083).
train(pp02, purple). coordinate(pp02, 13.8813, 100.4093 ).
train(pp03, purple). coordinate(pp03, 13.8748, 100.4194).
train(pp04, purple). coordinate(pp04, 13.8758, 100.4338).
train(pp05, purple). coordinate(pp05, 13.8768, 100.4471).
train(pp06, purple). coordinate(pp06, 13.8748, 100.456).
train(pp07, purple). coordinate(pp07, 13.8707, 100.4666).
train(pp08, purple). coordinate(pp08, 13.8703, 100.4802 ).
train(pp09, purple). coordinate(pp09, 13.866, 100.5217).
train(pp10, purple). coordinate(pp10, 13.8618, 100.5044).
train(pp11, purple). coordinate(pp11, 13.8602, 100.5131).
train(pp12, purple). coordinate(pp12, 13.8483, 100.5149).
train(pp13, purple). coordinate(pp13, 13.8397, 100.515).
train(pp14, purple). coordinate(pp14, 13.83, 100.5264).
train(pp15, purple). coordinate(pp15, 13.8203, 100.5325).
train(pp16, purple). coordinate(pp16, 13.8062, 100.5308).

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
train(yl01, yellow). coordinate(yl01, 13.8072, 100.5748).
train(yl02, yellow). coordinate(yl02, 13.8003, 100.5842).
train(yl03, yellow). coordinate(yl03, 13.7944,100.5942 ).
train(yl04, yellow). coordinate(yl04, 13.787, 100.6076).
train(yl05, yellow). coordinate(yl05, 13.7837, 100.6136).
train(yl06, yellow). coordinate(yl06, 13.7785, 100.623 ).
train(yl07, yellow). coordinate(yl07, 13.7745, 100.6297).
train(yl08, yellow). coordinate(yl08, 13.769, 100.6397).
train(yl09, yellow). coordinate(yl09,13.7618, 100.6455 ).
train(yl10, yellow). coordinate(yl10, 13.7503, 100.6448).
train(yl11, yellow). coordinate(yl11, 13.7361, 100.6412).
train(yl12, yellow). coordinate(yl12, 13.7255, 100.6417).
train(yl13, yellow). coordinate(yl13, 13.7111, 100.6441).
train(yl14, yellow). coordinate(yl14, 13.7011, 100.6464).
train(yl15, yellow). coordinate(yl15, 13.6909, 100.6469).
train(yl16, yellow). coordinate(yl16, 13.6764, 100.6462).
train(yl17, yellow). coordinate(yl17, 13.6678, 100.645).
train(yl18, yellow). coordinate(yl18, 13.6547, 100.6419).
train(yl19, yellow). coordinate(yl19, 13.6434, 100.6361).
train(yl20, yellow). coordinate(yl20, 13.6331, 100.63).
train(yl21, yellow). coordinate(yl21, 13.6299, 100.6225).
train(yl22, yellow). coordinate(yl22, 13.6367, 100.6098).
train(yl23, yellow). coordinate(yl23, 13.6451, 100.5966).

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
train(pk01, pink). coordinate(pk01, 13.8602, 100.5131).
train(pk02, pink). coordinate(pk02, 13.8627, 100.5205).
train(pk03, pink). coordinate(pk03, 13.8743, 100.5161).
train(pk04, pink). coordinate(pk04, 13.8893, 100.5106).
train(pk05, pink). coordinate(pk05, 13.8987, 100.507).
train(pk06, pink). coordinate(pk06, 13.9062, 100.5052).
train(pk07, pink). coordinate(pk07, 13.9065, 100.5155).
train(pk08, pink). coordinate(pk08, 13.9043, 100.5291).
train(pk09, pink). coordinate(pk09, 13.9007, 100.5398).
train(pk10, pink). coordinate(pk10, 13.8973, 100.5483).
train(pk11, pink). coordinate(pk11,13.8932, 100.56 ).
train(pk12, pink). coordinate(pk12, 13.8907, 100.5672).
train(pk13, pink). coordinate(pk13, 13.8877, 100.5756).
train(pk14, pink). coordinate(pk14, 13.8842, 100.5827).
train(pk15, pink). coordinate(pk15, 13.8798, 100.5892).
train(pk16, pink). coordinate(pk16, 13.8752,100.5967).
train(pk17, pink). coordinate(pk17, 13.871, 100.6026 ).
train(pk18, pink). coordinate(pk18, 13.8627, 100.6179).
train(pk19, pink). coordinate(pk19, 13.8585, 100.6261).
train(pk20, pink). coordinate(pk20, 13.8552, 100.6319).
train(pk21, pink). coordinate(pk21, 13.8493, 100.6427).
train(pk22, pink). coordinate(pk22, 13.8452, 100.6503).
train(pk23, pink). coordinate(pk23, 13.8452, 100.65).
train(pk24, pink). coordinate(pk24,13.8337, 100.6675 ).
train(pk25, pink). coordinate(pk25, 13.8245, 100.6769).
train(pk26, pink). coordinate(pk26, 13.8165, 100.6853).
train(pk27, pink). coordinate(pk27, 13.8127, 100.7028).
train(pk28, pink). coordinate(pk28, 13.8127, 100.7028).
train(pk29, pink). coordinate(pk29, 13.8127, 100.7255).
train(pk30, pink). coordinate(pk30, 13.8085, 100.7325).
% pink mt: MRT
%train(pk21_mt, pink).
train(mt01, pink). coordinate(mt01, 13.911, 100.5442).
train(mt02, pink). coordinate(mt02, 13.9185, 100.5456).


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
train(a1, airport). coordinate(a1, 13.6943, 100.7511 ).
train(a2, airport). coordinate(a2, 13.7278, 100.7483).
train(a3, airport). coordinate(a3, 13.733, 100.6912).
train(a4, airport). coordinate(a4, 13.7381, 100.6455).
train(a5, airport). coordinate(a5, 13.743, 100.6).
train(a6, airport). coordinate(a6, 13.7511, 100.561).
train(a7, airport). coordinate(a7, 13.7548, 100.543).
train(a8, airport). coordinate(a8, 13.7568, 100.5349).

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
train(rn01, red). coordinate(rn01, 13.804, 100.5418).
train(rn02, red). coordinate(rn02, 13.8267, 100.5495).
train(rn03, red). coordinate(rn03, 13.8417, 100.5576).
train(rn04, red). coordinate(rn04, 13.847, 100.5607).
train(rn05, red). coordinate(rn05, 13.8602, 100.5674).
train(rn06, red). coordinate(rn06, 13.8845, 100.5808).
train(rn07, red). coordinate(rn07, 13.8987, 100.5888).
train(rn08, red). coordinate(rn08, 13.9198, 100.601).
train(rn09, red). coordinate(rn09, 13.9656, 100.6053).
train(rn10, red). coordinate(rn10, 13.9906, 100.6022).
% light red
%train(rw01,red).
train(rw02, red). coordinate(rw02, 13.8222, 100.5343).
train(rw05, red). coordinate(rw05, 13.7918, 100.4776).
train(rw06, red). coordinate(rw06, 13.7893, 100.4393).

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
fare(From, To, Cost, Type) :- fare(To, From, Cost, Type),!.

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

old_devide(Number, Result) :-
    Half is Number / 2,
    round(Half,Result).
student_devide(Number, Result):-
    Half is Number * 0.9,
    round(Half,Result).

% Convert degrees to radians
deg_to_rad(Degrees, Radians) :-
    Radians is Degrees * pi / 180.

% Haversine formula for calculating distance between two points
d_from_xy(Station1, Station2,Distance) :-
  coordinate(Station1,Lat1,Lon1),
  coordinate(Station2,Lat2,Lon2),
    % Convert latitudes and longitudes to radians
    deg_to_rad(Lat1, Lat1Rad),
    deg_to_rad(Lon1, Lon1Rad),
    deg_to_rad(Lat2, Lat2Rad),
    deg_to_rad(Lon2, Lon2Rad),

    % Differences in latitudes and longitudes
    DLat is Lat2Rad - Lat1Rad,
    DLon is Lon2Rad - Lon1Rad,

    % Apply Haversine formula
    A is sin(DLat / 2) * sin(DLat / 2) + 
         cos(Lat1Rad) * cos(Lat2Rad) * sin(DLon / 2) * sin(DLon / 2),
    C is 2 * atan2(sqrt(A), sqrt(1 - A)),

    % Radius of the Earth in kilometers
    R is 6371,

    % Calculate the distance
    Distance is R * C.

% path:  path(From,To, Visited, Path, Length, Fare, Interchange, rabbit, MRT_card)
% rabbit -> green (same as orange but differ on special extension on greens), orange(normal), purple(old -> normal/2)
% 1. greens,,,,,,,,,, 2. gold, yellow, pink
% MRT_card -> normal, student(round(normal * 0.9)), childold(normal * 0.5)
% 3. blue, purple, 
% no special card : 4. red, airport

converted_fare(From,To,Fare,Rabbit,MRT_card):-
    train(From,X), train(To,Y),
    (	X == Y ->      ( 	
                          member(X, [lightgreen,darkgreen]) ->  fare(From,To,Fare,Rabbit)
                      ;   member(X, [gold, yellow, pink])	  ->  fare(From,To,Fare1), (Rabbit == purple ->  old_devide(Fare1,Fare); Fare = Fare1)
                      ;   member(X, [blue,purple]) 		  ->  ( 
                                                                      fare(From,To,Fare1),
                                                                      (	MRT_card == student ->  student_devide(Fare1, Fare)
                                                                      ;   MRT_card == childold ->  old_devide(Fare1, Fare)
                                                                      ;   Fare = Fare1)
                                                                )
                       ;   fare(From,To,Fare)
                    )
    ;   ( X \= Y, member(X, [lightgreen,darkgreen]), member(Y, [lightgreen,darkgreen])) ->  fare(From,To,Fare,Rabbit)
    ).

fare_from_list([],0,_,_) :- !.
fare_from_list([X], Fare, Rabbit,MRT_card) :- !,converted_fare(X,X,Fare,Rabbit,MRT_card).
fare_from_list([From, X, Y, To|Tail], Fare, Rabbit,MRT_card) :-
    member(X, [cen_lg, cen_dg]), member(Y, [cen_lg,cen_dg]),
    train(From,A), train(X,A), train(To,B),  train(Y,B), !,
    converted_fare(From,To,F1,Rabbit,MRT_card),
    fare_from_list(Tail,F2, Rabbit,MRT_card),
    Fare is F1 + F2.
fare_from_list([From,X,Y,To|Tail], Fare, Rabbit, MRT_card) :-
    train(From,A), train(X,A), train(To,B),  train(Y,B),
    ( 	(A == purple, B == blue) ->  Discount = 14
    ;   (A == blue, B == purple) ->  Discount = 14
    ;   (A == blue, B == yellow) ->  Discount = 15
    ;   (A == yellow, B == blue) ->  Discount = 14
    ;   (A == purple, B == pink) ->  Discount = 15
    ;   (A == pink, B == purple) ->  Discount = 14),!,
    converted_fare(From,X,F0,Rabbit,MRT_card),
    converted_fare(Y,To,F1,Rabbit,MRT_card),
    fare_from_list(Tail,F2, Rabbit,MRT_card),
    Fare is F0 + F1 + F2 - Discount.

fare_from_list([From, To| Tail], Fare, Rabbit,MRT_card) :-
    train(From,X), train(To,Y),
    (	X == Y ->  converted_fare(From,To,F1,Rabbit,MRT_card), Cont = Tail
    ;   ( X \= Y, member(X, [lightgreen,darkgreen]), member(Y, [lightgreen,darkgreen])) ->  converted_fare(From,To,F1,Rabbit,MRT_card), Cont = Tail
    ;   F1 = 0 , Cont = [To|Tail]),
    fare_from_list(Cont,F2, Rabbit,MRT_card),
    Fare is F1 + F2.

length_from_list([], 0) :- !.
length_from_list([X], 0) :- !.
length_from_list([From,To|Tail], Count) :-
    train(From,X), train(To,Y),
    (	X == Y ->  count(From,To,F1), Cont = Tail
    ;   F1 = 0, Cont = [To|Tail]
    ),
    length_from_list(Cont, F2),
    Count is F1 + F2.

% predsort/3: Sort a list based on a comparison predicate
predsort(_, [], []).  % Base case: an empty list is already sorted

predsort(Pred, [Head|Tail], Sorted) :-
    predsort(Pred, Tail, SortedTail),  % Recursively sort the tail
    insert(Pred, Head, SortedTail, Sorted).  % Insert the head in the sorted tail

% insert/4: Insert an element into a sorted list maintaining the order
insert(_, X, [], [X]).  % Insert at the end if the list is empty

% Insert X before Y based on the comparison result
insert(compare_by_F, X, [Y|Ys], [X, Y|Ys]) :-
    compare_by_F(<, X, Y).  % Direct comparison using compare_by_fare

% If X is not less than Y, insert X further down the list
insert(compare_by_F, X, [Y|Ys], [Y|Zs]) :-
    \+ compare_by_F(<, X, Y),  % If X is not less than Y, continue to insert X further
    insert(compare_by_F, X, Ys, Zs).

% Base case: An empty list has no duplicates.
remove_duplicates([], []).

% Recursive case: If the head of the list is not in the result tail, add it.
remove_duplicates([H|T], Result) :-
    member(H, T), % If H is a duplicate, skip it.
    remove_duplicates(T, Result).

remove_duplicates([H|T], [H|Result]) :-
    \+ member(H, T), % If H is unique, include it.
    remove_duplicates(T, Result).

sort_by_F(List, SortedList) :-
    predsort(compare_by_F, List, SortedList).

compare_by_F(Order, [_, F1, _, _], [_, F2, _, _]) :-
    (   (F1) < (F2) -> Order = '<'
    ;   (F1) > (F2) -> Order = '>'  
    ;   Order = '='
    ).
		% shortest case
case_by_station(From, Target, Path, OldPath, FormerG, F , B, GNow):-
    train(From,X), linkage(A,B), 
    train(A,X), train(B,Y), A \= B, 
    \+ member(B,OldPath), \+ (train(Z,Y), member(Z, OldPath)),
    P0 = [From],
    (   From \= A ->  append(P0,[A],P1) ; P1 = P0),
    append(OldPath, P1, Path),
    count(From,A,G), 
    (   train(Target,Y) ->  H is 0
    ;   d_from_xy(From,A,H)),
    F is G + H + 1 + FormerG,
    GNow is G + FormerG.

shortest_path(From,To,Path,Length,Fare,Rabbit,MRT_card):-
    shortest_path_i(From,To,Path,Length),
    fare_from_list(Path,Fare,Rabbit,MRT_card),!.

shortest_path_i(From,To, AnsPath,Length) :-shortest_path_i(From ,From,To, [], 0, [], AnsPath,Length).
shortest_path_i(Now, From,To, OldPath, FormerG, AllCase, AnsPath,Length) :-
  train(Now,X), train(To,Y), 
    (   Now == To ->   AnsPath = [Now], Length = 0
    ;   X == Y ->   AnsPath = [Now,To], count(Now,To,Length)
    ;   (   setof([NewPath, F, B, G], case_by_station(Now ,To, NewPath, OldPath, FormerG,F , B, G), SetF)) -> (   
                                append(AllCase, SetF, SetCase0),
                                remove_duplicates(SetCase0, SetCase),
                                sort_by_F(SetCase, SetCaseSorted),
                                SetCaseSorted = [[P1, F1, B1, G1]|Tail],
                                shortest_path_i(B1, From, To, P1, G1, Tail, Ans1, L1),
                                Ans1 = [H | _], 
                                ( 	H == From  ->     AnsPath = Ans1, Length = L1
                                ;   append(P1, Ans1, AnsPath), Length is L1 + G1))                                                                               
    ;   AllCase = [[P1,F1,B1,G1]|Tail],
        shortest_path_i(B1, From, To, P1, G1, Tail, Ans1, L1),
       Ans1 = [H | _],
       ( 	H == From  ->     AnsPath = Ans1, Length = L1
       ;   append(P1, Ans1, AnsPath), Length is L1 + G1)).
    
		% cheapest path
case_by_fare(From, Target, Path, OldPath, FormerG, F , B, G, Rabbit,MRT_card):-
    train(From,X), linkage(A,B), 
    train(A,X), train(B,Y), A \= B, 
    \+ member(B,OldPath), \+ (train(Z,Y), member(Z, OldPath)),
    P0 = [From],
    (   From \= A ->  append(P0,[A],P1) ; P1 = P0),
    append(OldPath, P1, Path),
    fare_from_list(Path , G0,Rabbit,MRT_card), 
    (   train(Target,Y) ->  H is 0
    ;   d_from_xy(From,A,H)),
    (   member(A, [cen_dg, cen_lg]) ->  G is G0/2
    ;   G = G0),
    F is G + H + FormerG.

cheapest_path(From,To,Path,Length,Fare,Rabbit,MRT_card):-
    cheapest_path_i(From,To,Path,Rabbit,MRT_card),
    fare_from_list(Path,Fare,Rabbit,MRT_card),
	length_from_list(Path, Length), !.

cheapest_path_i(From,To, AnsPath,Rabbit,MRT_card) :-cheapest_path_i(From ,From,To, [], 0, [], AnsPath,Rabbit,MRT_card).
cheapest_path_i(Now, From,To, OldPath, FormerG, AllCase, AnsPath,Rabbit,MRT_card) :-
  train(Now,X), train(To,Y), 
    (   Now == To ->   AnsPath = [Now]
    ;   X == Y ->   AnsPath = [Now,To]
    ;   (   setof([NewPath, F, B, G], case_by_fare(Now ,To, NewPath, OldPath, FormerG,F , B, G,Rabbit,MRT_card), SetF)) -> (   
                                append(AllCase, SetF, SetCase0),
                                remove_duplicates(SetCase0, SetCase),
                                sort_by_F(SetCase, SetCaseSorted),
                                SetCaseSorted = [[P1, F1, B1, G1]|Tail],
                                cheapest_path_i(B1, From, To, P1, G1, Tail, Ans1,Rabbit,MRT_card),
                                Ans1 = [H | _], 
                                ( 	H == From  ->     AnsPath = Ans1
                                ;   append(P1, Ans1, AnsPath)))                                                                               
    ;   AllCase = [[P1,F1,B1,G1]|Tail],
        cheapest_path_i(B1, From, To, P1, G1, Tail, Ans1,Rabbit,MRT_card),
       Ans1 = [H | _],
       ( 	H == From  ->     AnsPath = Ans1
       ;   append(P1, Ans1, AnsPath))).

%best_path(From, To, Path, Length, Fare) :- best_path(From, To, Path, Length, Fare,orange,normal).
%fastest_path(From, To, Path, Length, Fare) :- fastest_path(From, To, Path, Length, Fare,orange,normal).
shortest_path(From, To, Path, Length, Fare) :- shortest_path(From, To, Path, Length, Fare,orange,normal).
cheapest_path(From, To, Path, Length, Fare) :- cheapest_path(From, To, Path, Length, Fare,orange,normal).
   