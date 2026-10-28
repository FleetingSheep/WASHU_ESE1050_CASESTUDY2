function G = make_complete(n) %matrix size
    %MAKE COMPLETE Build complete (aka broadcast) topology adjacency matrix, in which every
    %robot is connected to every other robot. This should just be a ones
    %matrix where every connection where i = j is Gij = 0.
    %
    %G = 11' - I

    %init
    one = ones(n, 1);
    I = eye(n);

    G = one*one' - I; %outer product of 1s vectors creates 1s matrix of nxn
    %subtracting I eliminates diagonals

    %Done!
end
