function W = make_complete(n) %matrix size
    %MAKE COMPLETE Build complete (aka broadcast) topology adjacency matrix, in which every
    %robot is connected to every other robot. This should just be a ones
    %matrix where every connection where i = j is Gij = 0.
    %
    %G = 11' - I

    %init
    one = ones(n, 1);
    I = eye(n);

    G = one*one' - I; %outer product of 1s vectors creates 1s matrix of nxn
    d = G*1; %Establishes the degree vector, or how many drones each one can hear
    D = diag(d);
    epsilon = 1 / max(d);
    L = D - G;
    %Done!
    if (Protocol == 1)
        W = (I + D)'*(I + G);
    elseif (Protocol == 2)
        W = I - (epsilon * L);
    end

end





