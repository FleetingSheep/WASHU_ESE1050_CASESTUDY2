function X = simulate_anchored(W, lambda, a, x0, K)

%must be called separately for x and y, a and b respectively

%init
n = size(W, 1);
X = zeros(n, K + 1);
I = eye(n);

X(:, 1) = x0;
for k = 1:K
    X(:, k + 1) = lambda * W * X(:, k) + (I - lambda) * a;
end

end