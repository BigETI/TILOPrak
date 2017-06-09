linListe(nil).
linListe(list(X, Xs)) :- linListe(Xs).

%Dabei ergibt sich die Liste Zs durch Anh¨angen der Liste Ys an die Liste Xs
appendlist(nil,Xs,Xs).
appendlist(list(X,Xs),Ys,list(X,Zs)):-appendlist(Xs,Ys,Zs).

% member(X, list(X, Ys)).
% member(X, Xs) :- appendlist(Y, list(X, R), Xs).

member(X, list(X, Xs)) :- linListe(Xs).
member(Y, list(X, Xs)) :- member(Y, Xs).

% infix(nil, nil).
% infix(list(X, Xs), list(X, Xs)).

infix(Xs, Ys) :- appendlist(Xs, X, Rs), appendlist(Y, Rs, Ys).

tree(e).
tree(n(W, L, R)) :- tree(L), tree(R).

construct(Root, Lb, Rb, (Root, Lb, Rb)).

natSymb(o).
natSymb(s(X)) :- natSymb(X).

addSymb(o, X, X).
addSymb(s(X), Y, s(R)) :- addSymb(X, Y, R).

knotenanz(e, o).
knotenanz(n(W, L, R), s(X)) :- knotenanz(L, N1), knotenanz(R, N2), addSymb(N1, N2, X).

% Zusatzaufgabe

palindrom(nil).
palindrom(Xs) :- revlist(Xs, Xs).

revlist(nil, nil).
revlist(list(X, Xs), Rs) :- revlist(Xs, Ts), appendlist(Ts, list(X, nil), Rs).



















