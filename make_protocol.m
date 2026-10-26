function W = make_protocol(G, Protocol)

n = size(G, 1); %G should be square, so which dimension it takes does not matter
I = eye(n);

D = diag(d);
epsilon = 1 / max(d);
L = D - G; %laplacian

if (Protocol == 1) % neighbor averaging
    W = ((I + D)^-1) *(I + G);
elseif (Protocol == 2) % step toward neighbors
    W = I - (epsilon * L);
end

end