function J = score_mission(D, S) %deployment, leader set

e_new_k; %mean squared distance from the working robots to g at step k, with our leaders

e_base_k; %same but for no leaders

T; %number of time steps for scoring

% MISSING: Definitions of enewk and ebasek using D

% MISSING: Check that leader set S contains at most m working robots

J = (100 / T);

sum = 0;

for k = 1:T

    sum = sum + (1 - (e_new_k / e_base_k));

end

J = J * sum;

end