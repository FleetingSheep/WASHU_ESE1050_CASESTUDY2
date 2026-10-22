function make_star()
%MAKE RING  Build ring topology adjacency matrix, in which each robot
%   connects to k ring-neighbors on each side.
%
%   Cylic shift matrix: Se_j = e_(j + 1)
%
%   G = Summation starting from j = 1 to k, (S^j + (S^j)'