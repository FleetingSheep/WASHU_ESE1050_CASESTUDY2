function W = make_disk(P, r) %positions matrix, radius
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
    one = ones(1, n);
    I = eye(n);

    delta = s*one' + one*s' - 2*(P*P');
    %create star topology while encoding distances

    delta(delta < r^2) = 1; %if within range
    delta(delta >= r^2) = 0; %if outside of range

    G = delta;

    G(1:n+1:end) = 0; %set diagonals to 0
    d = G*1; %Establishes the degree vector, or how many drones each one can hear
    D = diag(d);
    epsilon = 1 / max(d);
    L = D - G;

    if (Protocol == 1)
        W = (I + D)'*(I + G);
    elseif (Protocol == 2)
        W = I - (epsilon * L);
    end
end

% Done!
