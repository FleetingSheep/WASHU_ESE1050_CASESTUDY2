
seed = 314;
n = 150;
m = 4; % Given in CS
D = make_deployment(seed);
Protocol = 1; %Protocol A = 1, Protocol B = 2

% G = make_complete(n);
% G = make_disk(D.P0);
% G = make_star(n);
G = make_ring(n, D.P0);
W = Establish_Matrices(G, Protocol);

x0 = D.P0 (:, 1);
y0 = D.P0 (:, 2);

lambda = ones(n, 1);
S = choose_leaders(G, D.P0, D.faulty, D.g, m);
lambda(S) = 0.5;
a = x0;
a(leaders) = D.g(1);
b = y0;
b(leaders) = D.g(2);







