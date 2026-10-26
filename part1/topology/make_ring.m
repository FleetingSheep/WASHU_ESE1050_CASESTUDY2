function W = make_ring(n, k) %matrix size, ring-neighbors amount
    %MAKE RING  Build ring topology adjacency matrix, in which each robot
    %   connects to k ring-neighbors on each side.
    %
    %   Cyclic shift matrix: Se_j = e_(j + 1)    with indices mod(n)
    %
    %   G = Summation starting from j = 1 to k, S^j + (S^j)'

    G = zeros(n, n);
    unitVector = eye(n);

    S = [unitVector(:, 2:end), unitVector(:, 1)]; 
    %move first column of unit vector to the end. the result is a
    %downshifted set of unit vectors. the last column gives backward adjacency,
    %i.e. with n = 4 connecting nodes 1 and 4

    for j = 1:k
        G = G + S^j + (S^j)';
        %starting from the diagonals add adjacency to tiles "above" and "below"
    end

    G(G > 1) = 1; %stop connections from overlapping
    G(1:n+1:end) = 0; %set diagonals to 0

% Done!
