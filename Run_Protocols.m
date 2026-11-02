seed = 314;
D = make_deployment(seed);
G = D.G;
W = Establish_Matrices(G, 1);

n = size(G, 1);
m = 4; % Given in CS

x0 = D.P0 (:, 1);
y0 = D.P0 (:, 2);

S = choose_leaders(G, D.P0, D.faulty, D.g, m);

lambda = ones(n, 1);
lambda(S) = 0.5;

a = x0;
a(S) = D.g(1);
b = y0;
b(S) = D.g(2);

K = 125;
X = simulate_anchored(W,lambda,a,x0,K);
Y = simulate_anchored(W,lambda,b,y0,K);







