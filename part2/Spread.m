function [delta, K] = Spread(W, P)
    x0 = P(:, 1);
    y0 = P(:, 2);
    n = size(P, 1);
    one = ones(n, 1);
    C = eye(n) - (one*one')/n;


    K = 0;
    delta = []; %spread history
    Spread0 = sqrt(norm(C*x0)^2+norm(C*y0)^2);
    while true
        xk = simulate_linear(W, x0, K);
        yk = simulate_linear(W, y0, K);

        xk = xk(:, end); %simulate_linear returns the history by default, so we need to grab the last column instead
        yk = yk(:, end);

        delta(end + 1) = sqrt((norm(C*xk)^2)+(norm(C*yk)^2));
        if delta(end) <= 0.01 * Spread0
            break;
        end
        K = K + 1;
    end
    
end