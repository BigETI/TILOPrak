% Benoetigte Datenstrukturen

% rlist(Xs, Ys) : Kehrt Liste um
% Xs : Liste
% Ys : "Xs" umgekehrt
rlist([], []).
rlist([X|Xs], Ys):- rlist(Xs, R), append(R, [X], Ys).

% praefix(Xs, Ys) : Praefix Anordnung
% Xs : Liste
% Ys : Praefix aus "Xs"
praefix([X], [X|Ys]).
praefix([X|Xs], [X|Ys]) :- praefix(Xs, Ys).

% tree(Xb) : Erzeugt einen Binaerbaum
% Xb : Binaerbaum, "e" wenn leer, sonst "n(X, Lb, Rb)"
tree(e).
tree(n(X, Lb, Rb)) :- tree(Lb), tree(Rb).


% Aufgabe 1
% postfix(XS,YS) : Ys endet mit der Liste Xs.

% Aufgabe 1

% postfix1(Xs, Ys) : Listen umkehren und Anfangswerte mit Praefix
% vergleichen
% Xs : Liste 1
% Ys : Liste 2
postfix1(Xs, Ys) :- rlist(Xs, Xsr), rlist(Ys, Ysr), praefix(Xsr, Ysr).

% postfix2(Xs, Ys) : Mit dem hinzufuegen der Elemente vergleichen
% Xs : Liste 1
% Ys : Liste 2
postfix2(Xs, Ys) :- append(Rs, Xs, Ys).


% Aufgabe 2

% member(X, Xb) : Prueft ob Element ein Knoten aus dem Baum ist
% X : Element
% Xb : Binaerbaum
member(X, n(X, Lb, Rb)) :- tree(Lb), tree(Rb), !.
member(X, n(Y, Lb, Rb)) :- X\==Y, tree(Lb), tree(Rb), (member(X, Lb); member(X, Rb)).
% "!" : Terminiert Ablauf (Suchoptimierung)


% Aufgabe 3

% preorder(Xb, Ys) : Preorder Liste aus Binaerbaum
% Xb : Binaerbaum
% Ys : "Xb" in Praeorder
preorder(e, []).
preorder(n(X, Lb, Rb), [X|Xs]) :- tree(Lb), tree(Rb), preorder(Lb, Y1s), preorder(Rb, Y2s), append(Y1s, Y2s, Xs).

% postorder(Xb, Ys) : Postorder Liste aus Binaerbaum
% Xb : Binaerbaum
% Ys : "Xb" in Postorder
postorder(e, []).
postorder(n(X, Lb, Rb), Ys) :- tree(Lb), tree(Rb), postorder(Lb, Y1s), postorder(Rb, Y2s), append(Y2s, [X], Y3s), append(Y1s, Y3s, Ys).

% roots(Xbs, Ys) : Wurzelknotenwerte
% Xbs : Liste von Binaerbaeumen
% Ys : Wurzelknotenwerte
roots([], []).
roots([n(X, Lb, Rb)|Xs], [X|Ys]) :- tree(Lb), tree(Rb), roots(Xs, Ys).















































