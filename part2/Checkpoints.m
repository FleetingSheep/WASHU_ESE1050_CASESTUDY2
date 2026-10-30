
%% (a) For each protocol, write the ith entry of x[k + 1] = W x[k] as an equation for x_i[k + 1], and interpret it.

% x_i[k + 1] = W_i*x_i[k]; at index i for x[k + 1], it gives you the new coordinates of the drone after it had moves "one step" according to the matrix W

%% (b) Show that W_A1 = 1 and W_B 1 = 1. What happens if all robots are already at the same point?

% W_A1 = (I + D)^-1 * (I + G)1 = (I + D)^-1 * (1 + G1) = (I + D)^-1 * (1 + d) (according to the formulas given where G1 = d)
% then, (I + D)^-1 * (1 + d) = (I + D)^-1 * 1(I + D) as D is the diagonal matrix representation of d. 
% Then, the matrix (I + D) is cancelled out by it's inverse leaving us with I1 = 1

% W_B1 = 1(I-εL) = 1(I - ε(D-G)) = 1 - ε(1D - 1G) = 1 - e(d - d) = 1 - ε(0) = 1

% If all the robots are already at the same point, then they wouldn't move as then they are already at the average point of it's neighbors

%% (c) Let v = (I + D)1. Using only G = G⊤and properties of matrix products, show that
%% v^⊤W_A = v^⊤and 1^⊤W_B = 1^⊤. For each protocol, what quantity stays constant as x[k] evolves?

% v = (I + D)1
% v^T = (I + D)^T * 1^T = 1^T(I + D); (I + D)^T = (I + D) as both I and D are diagonal vectors 
% by transposing them, there is zero actual change in the values
% v^TW_a = 1^T(I + D)(I + D)^-1(I + G) = 1^T(I + G) as a matrix multiplied by it'a inverse returns I, and I multiplied by a matrix changes nothing
% 1^T(I + G) = 1^T + 1^T*G = 1^T + (1G)^T = 1^T + d^T as 1G = d according to the formulas given, then we can distribut the original value for v^T
% 1^T(I + D) to algo get 1^T + D1^T = 1^T + d^T as D1 = d

% 1^TW_B = 1^T(I - ε*L) where ε = 1/max_i(d_i) and L = D - G
% 1^T(I - εL) = 1^T - ε*1^TL; 1^TL = 1^TD - 1^TG = 0 as 1^TD = d^T and 1^TG = d^T
% This then leaves us with just 1^TW_B = 1^T

% In Protocol A, the average point with a lean towards robots with higher degrees stays constant as we have 1^T (average) + d^T (the degree). 
% In Protocol B, the mean point/average position of the cluster remains the same as we just have 1^T

%% (d) Show that with ε = 1/ max_i(d_i), every entry of WB is nonnegative. What could go wrong
%% with a larger ε?

% The ε has to be positive as d is derived from the adjacency matrix, which only consists of 1's and 0's
% Then, because the degrees is G1, it stays positive can counts how many other robots one robot is connected to, it has to stay positive simply 
% By the logic that you cannot connect to a negative amount as connections are a scalar, and all of d_i has to be at least 1 as all the topologies that
% were made forces each robot to be at least connected to one other














