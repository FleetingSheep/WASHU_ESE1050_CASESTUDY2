function G = make_ring(n, P) %matrix size, positions for running disk

    %MAKE RING  Build ring topology adjacency matrix, in which each robot
    %   connects to k ring-neighbors on each side.
    %
    %   Cyclic shift matrix: Se_j = e_(j + 1)    with indices mod(n)
    %
    %   G = Summation starting from j = 1 to k, S^j + (S^j)'

    %   init
    G = zeros(n);
    unitVector = eye(n);
    k = 0;

    S = [unitVector(:, 2:end), unitVector(:, 1)];
    %   moves first column of identity matrix to the end. the result is a
    %   downshifted set of unit vectors. the last column gives backward adjacency,
    %   i.e. with n = 4 connecting nodes 1 and 4, since it "wraps around"


    %to achieve results most similar to make_disk, we find value k such
    %that their edge counts are most similar for ANY deployment

    %to do so we identify the 2 values of k that give edge counts just
    %above and just below the disk's, then find which is closer

    disk = make_disk(P);
    disk = graph_stats(disk);
    targetEdges = disk(3);
    
    maxK = floor(n / 2); %at k = n/2 the ring will mimic a complete topology,
    %but it should never reach this point to begin with.
    ring_edges = 0;

    previousG = G; 
    previousEdges = ring_edges;

    while k <= maxK && ring_edges < targetEdges
        previousG = G;
        previousEdges = ring_edges;
        %we need to log the last matrix and its edges so that
        %when our edge count exceeds that of the disk, we can compare them and
        %find who is closer.

        k = k + 1;
        G = zeros(n);
        for j = 1:k
            G = G + S^j + (S^j)';
             %starting from the diagonals add adjacency to tiles "above"
             %and "below" k times
        end
        
        G(G > 1) = 1; % stop connections from overlapping
        G(1:n+1:end) = 0; % set diagonals to 0

        ring_edges = graph_stats(G);
        ring_edges = ring_edges(3);
    end

    %if the lower bound for k was superior
    %ties favor the larger k, though it is unlikely to happen
    if abs(previousEdges - targetEdges) < abs(ring_edges - targetEdges)
        G = previousG;
    end

    G(G > 1) = 1; % stop connections from overlapping
    G(1:n+1:end) = 0; % set diagonals to 0

% Done!
end