% This protocol wants us to take the average value of all the drones to get the new position at time (t)

addpath("part1\topology\"); %MATLAB doesn't read those functions as in the folder otherwise

% Creates the matrix to get the average values at various values of k

rng(105);
P = [5*rand(50,2); 5*rand(50,2) + [6 0]];
n = 100;
K = 125; % Number of iterations for the matrix to be applied
seed = 314;
G = make_ring(n, P);
W = Establish_Matrices(G, 1);
x0 = P(:, 1);
y0 = P(:, 2);
X = simulate_linear(W, x0, K);
Y = simulate_linear(W, y0, K);













