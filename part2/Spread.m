function [delta, K] = Spread(W, P)
    x0 = P(:, 1);
    y0 = P(:, 2);
    n = size(P, 1);
    one = ones(1, n);
    C = eye(n) - (1/n)*(one)*(one)';


    K = 0;
    Spread0 = sqrt(norm(C*x0)^2+norm(C*y0)^2);
    while true
        xk = simulate_linear(W, x0, K);
        yk = simulate_linear(W, y0, K);

        delta = sqrt((norm(C*xk)^2)+(norm(C*yk)^2));
        if delta <= 0.01 * Spread0
            break;
        end
        K = K + 1;
    end

    


    
end
