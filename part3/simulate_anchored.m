function anchored = simulate_anchored(W, lambda, a, x0, K)

n = size(W,1);

x_temp = x0;
anchored = zeros(n, K+1);
    anchored(:,1) = x0;
    for k = 1:K
        x_temp = lambda .* (W*x_temp) + (1 - lambda) .* a;
        anchored(:,k+1) = x_temp;
    end

end