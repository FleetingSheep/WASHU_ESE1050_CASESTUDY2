function [G, W] = make_star(n, Protocol) % n = matrix size, 
    %MAKE STAR  Build star (aka base station) topology adjacency matrix, in 
    %   which robots connect to one central "hub" and there are no other
    %   connections.
    %
    %   G = e_1*1' + 1*e_1' - 2*e_1*e_1'
    %
    %   Result should have 0 in the top left corner G(11), then 1s projected
    %   all along i = 1 and j = 1.

    %init
    one = ones(n, 1);
    e1 = zeros(n, 1);
    e1(1) = 1; %column of 0s with 1 at the top becomes unit vector e1

    G = e1 * one' + one * e1' - 2 * (e1 * e1');
    W = Establish_Matrices (G, Protocol);
    % Done!
end