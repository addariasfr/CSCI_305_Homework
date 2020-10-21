/* Establishes the structure of the hallway */
rooms([lives(_, 1), lives(_, 2), lives(_, 3), lives(_, 4), lives(_, 5)]).

/* Define adjacency as two numbers with an absolute value difference of one */
nadjacent(W, V) :- 1 =\= abs(W - V).
/* Define higher as one number greater than the other */
higher(Y, Z) :- Y > Z.

/* Rules to establish bedroom residents *
layout(X) :- rooms(X),
		member(lives(hunter, A), X), A\=5,
		member(lives(laura, B), X), B\=1,
		member(lives(addiley, C), X),
		member(lives(ramey, D), X),
		member(lives(arnie, E), X), E\=1, E\=5,
		nadjacent(E, B),
		nadjacent(E, C),
		higher(D, B).
