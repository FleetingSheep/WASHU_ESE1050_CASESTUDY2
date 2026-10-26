function delta = Spread(D, k)

P = D.P0;
x = P(:, 1);
y = P(:, 2);
n = size(x);
one = ones(1, n);
C = eye(n) - (1/n)*(one)*(one)';

delta = sqrt((norm(C.*x)^2)+(norm(C*y)^2));

end

