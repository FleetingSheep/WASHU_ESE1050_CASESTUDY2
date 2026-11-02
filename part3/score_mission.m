function J = score_mission(D, S) %deployment, leader set

e_new_k; %mean squared distance from the working robots to g at step k, with our leaders
e_base_k; %same but for no leaders

n = size(D.G, 1);
T = 125; %number of time steps for scoring
m = 4;

if (numel(S) <= m)
    disp('Too many leaders!!!')
end

W = Establish_Matrices(D.G,1);  % Protocol A

x0 = D.P0(:,1);
y0 = D.P0(:,2);

working = true(n,1);
working(D.faulty) = false;

% Run the simulation with no leaders first
lambda_base = ones(n,1);
lambda_base(D.faulty) = 0;

% Faulty robots remain anchored at their initial positions.
X_base = simulate_anchored(W,lambda_base,x0,x0,T);
Y_base = simulate_anchored(W,lambda_base,y0,y0,T);

% Run the mission with selected leaders copying code from Run_Protocols
lambda = lambda_base;
lambda(S) = 0.5;

a = x0;
b = y0;
a(S) = D.g(1);
b(S) = D.g(2);

X_new = simulate_anchored(W,lambda,a,x0,T);
Y_new = simulate_anchored(W,lambda,b,y0,T);


% Compute mean squared distance to the goal at each time step.

eBase = mean((X_base - D.g(1)).^2 + (Y_base - D.g(2)).^2, 2);
eNew = mean((X_new - D.g(1)).^2 + (Y_new - D.g(2)).^2, 2);
e_base_k = eBase(2:end);
e_new_k = eNew(2:end);


J = (100 / T) * sum(1 - (e_new_k ./ e_base_k));

end