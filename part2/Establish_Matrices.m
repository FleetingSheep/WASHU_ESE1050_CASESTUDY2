function W = Establish_Matrices(G, Protocol)

n = size(G, 1);
d = G * ones(n, 1);
I = eye(n);
D = diag(d);

epsilon = 1 / max(d);
L = D - G;

if (Protocol == 1) %neighbor averaging
    W = ((I + D) ^ (-1)) * (I + G);
elseif (Protocol == 2) %small step taken toward each neighbor
    W = I - (epsilon * L);
end

end
