function W = Establish_Matrices(G, Protocol)

n = size(G, 1);
d = G * ones(n, 1);
I = eye(n);
D = diag(d);

epsilon = 1 / max(d);
L = D - G;

%propagate the 1 along the 1st row, then along the column, then set the
%value at G_11 to 0.
if (Protocol == 1)
    W = (I + D)^-1*(I + G);
elseif (Protocol == 2)
    W = I - (epsilon * L);
end

end
