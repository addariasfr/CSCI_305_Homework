rooms([lives(_, 1), lives(_, 2), lives(_, 3), lives(_, 4), lives(_, 5)]).

nadjacent(W, V) :- 1 =\= abs(W - V).
higher(Y, Z) :- Y > Z.

layout(X) :- rooms(X),
		member(lives(hunter, A), X), A\=5,
		member(lives(laura, B), X), B\=1,
		member(lives(addiley, C), X),
		member(lives(ramey, D), X),
		member(lives(arnie, E), X), E\=1, E\=5,
		nadjacent(E, B),
		nadjacent(E, C),
		higher(D, B).
