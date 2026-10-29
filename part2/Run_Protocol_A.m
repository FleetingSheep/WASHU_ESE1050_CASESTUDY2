% This protocol wants us to take the average value of all the drones to get the new position at time (t)

addpath("part1\topology\"); %MATLAB doesn't read those functions as in the folder otherwise

% Creates the matrix to get the average values at various values of k
n = 150;
k = 2; % Number of neighbors that each drone will have (when limited by count)
K = 150; % Number of iterations for the matrix to be applied
Protocol  = 1;
seed = 314;
D = make_deployment(seed);
W = make_ring(n, k, Protocol);
P = D.P0;
x0 = P(:, 1);
y0 = P(:, 2);
X = simulate_linear(W, x0, K);
Y = simulate_linear(W, y0, K);













