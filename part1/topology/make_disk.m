function G = make_disk(P) %positions matrix
    %MAKE RING  Build disk (aka radio range) topology adjacency matrix, in
    %   which robots can only communicate if within distance r of each other.
    %
    %   With P the nx2 matrix of positions and s the vector with entries
    %   
    %   s_i = (x_i)^2 + (y_i)^2
    %
    %   squared distances matrix = s*1' + 1*s' - 2*P*P'
    %
    %   Then form G by comparing squared distances to r^2 and subtracting I the
    %   identity matrix.

    %init
    n = size(P, 1);
    s = sum(P.^2, 2); %square each element of P, then add each x and y
    one = ones(n, 1);
    r = 0.1;

    %determine r such that the deployment is connected
    %increment r by values of 0.1 until diameter != infinity (no node is
    %unreachable)

    while true
        
        delta = s*one' + one*s' - 2*(P*P'); %effectively creating a star topology while encoding distances
        G = delta <= r^2; %only values within range are 1 and rest 0
        G(1:n+1:end) = 0; %set diagonals to 0

        stats = graph_stats(G);
        diameter = stats(4);

        if ~isinf(diameter) %if no isolated nodes
            break;
        end
        r = r + 0.1; %try again with higher radius

    end

% Done!
end