function X = simulate_linear(W, x0, K)
n = size(W, 1);
X = zeros(n, K + 1);

X(:, 1) = x0;
for k = 1:K
    X(:, k + 1) = W * X(:, k);
end

%return X, a n x (K + 1) matrix whose column k + 1 is x[k],
%computed with a loop of matrix–vector products. Check that the final column equals W^K *
%x0. Call it once for each coordinate.
end