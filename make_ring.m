function G = make_ring(n, k) %matrix size, ring-neighbors amount
%MAKE RING  Build ring topology adjacency matrix, in which each robot
%   connects to k ring-neighbors on each side.
%
%   Cylic shift matrix: Se_j = e_(j + 1)    with indices mod(n)
%
%   G = Summation starting from j = 1 to k, S^j + (S^j)'