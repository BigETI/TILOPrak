sigma(0).
sigma(1).
%sigma_stern([]).
%sigma_stern([W|Ws]) :- sigma(W), sigma_stern(Ws).
zustand(z1).
zustand(z2).
zustand(z3).
start(z1).
ende(z3).
delta(z1, 0, z2).
delta(z1, 0, z1).
delta(z1, 1, z1).
delta(z2, 1, z3).








sigma_stern([]).
sigma_stern([W|Ws]) :- sigma(W), sigma_stern(Ws).

delta_stern(Xz, [], Xz).
delta_stern(Xz, [W|Ws], Yz) :- delta(Xz, W, Rz), delta_stern(Rz, Ws, Yz).
l_von_n(Ws) :- start(Xz), ende(Yz), delta_stern(Xz, Ws, Yz), sigma_stern(Ws).











