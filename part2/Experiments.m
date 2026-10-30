
%% Predictions:

%% E1: How fast? Run Protocol A on T1–T4. Plot δ[k] on a log scale, all on one figure, and report 
%% kε for each. Repeat T4 with r = rmin + 0.4. Rank the networks and explain the ranking using
    %your Part I table. What does the gap between the two zones do?

% We would expect the topologies with the higher edge counts to rendezvous
% quicker as they have more connections and therefore more information. 
% For that reason we expect Complete to
% perform the greatest, Disk with added radius and Star to perform somewhat worse, 
% and Ring/Disk with rmin to perform the worst.

%% E2: Where do they meet? Using part (c) of the Checkpoint, predict the rendezvous point
%% for each protocol as a formula in x[0] and y[0]. Verify your formulas numerically on every
%% network. On the star, how far from the swarm's average position does each protocol meet,
%% and why? Which protocol reaches rendezvous faster on the star, and why?

% Rendevous point of protocol A is the summation of (1+d_i)x0/summation(1+d_i); this means that the rendevous point will be slightly off centered as 
% drones with larger degrees are weighted more, causing it to move less then the others to the actual rendevous point, same on the y-axis

% The rendevous point of protocol B is the average of all the drones, given by the fact that the end formula results in 1^Tx0/n, same on the y-axis

% For protocol A, the rendevous point will end up being approximately 1/3 of the way between the location of the central drone and the swarms average
% This is because the central drone is an extreme case where one drone has all of the weight, causing it to move very little relative to the rest of the 
% swarm towards the average position, slowly altering it as drones approach.
% 

% For protocol B, the robots will converge on the exact average point as given by the above equation for the rendevous point for protocol B

% Protocol A will reach the rendevous point faster as it will immediately jump to the average + bias, rather than B where they take small 
% steps towards the rendevous point. And because as the number of drones get larger, the smaller each step, as the number of drones increases, 
% the required steps also increase













