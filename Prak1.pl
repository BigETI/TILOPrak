eltern(homer, bart).
eltern(homer, lisa).
eltern(homer, maggie).
eltern(marge, bart).
eltern(marge, lisa).
eltern(marge, maggie).
eltern(papamarge, marge).
eltern(mamamarge, marge).
eltern(papamarge, patty).
eltern(mamamarge, patty).
eltern(papamarge, selma).
eltern(mamamarge, selma).

maenlich(homer).
maenlich(bart).
maenlich(papamarge).
weiblich(marge).
weiblich(lisa).
weiblich(maggie).
weiblich(patty).
weiblich(selma).
weiblich(mamamarge).

% Vater des Kindes (Y -> X)
% X: Vater
% Y: Kind
% Y -> X
vater(X, Y) :- maenlich(X), eltern(X, Y).

% Mutter des Kindes (Y -> X)
% X: Mutter
% Y: Kind
mutter(X, Y) :- weiblich(X), eltern(X, Y).

% Sohn des Elternteils (Y -> X)
% X: Sohn
% Y: Elternteil
sohn(X, Y) :- maenlich(X), eltern(Y, X).

% Tochter des Elternteils (Y -> X)
% X: Tochter
% Y: Elternteil
tochter(X, Y) :- weiblich(X), eltern(Y, X).

% Geschwister (X <-> Y)
% X: Schwester/Bruder 1
% Y: Schwester/Bruder 2
geschwister(X, Y) :- eltern(Elternteil, X), eltern(Elternteil, Y), X\==Y.

% Schwester der Schwester oder des Bruders (Y -> X)
% X: Schwester
% Y: Schwester/Bruder
schwester(X, Y) :- geschwister(X, Y), weiblich(X).

% Bruder der Schwester oder des Bruders (Y -> X)
% X: Bruder
% Y: Schwester/Bruder
bruder(X, Y) :- geschwister(X, Y), maenlich(X).

% Tante des Neffen (Y -> X)
% X: Tante
% Y: Neffe
tante(X, Y) :- schwester(X, Elternteil), eltern(Elternteil, Y).

% Onkel des Neffen (Y -> X)
% X: Onkel
% Y: Neffe
onkel(X, Y) :- bruder(X, Elternteil), eltern(Elternteil, Y).

