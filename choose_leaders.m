function S = choose_leaders(G, P0, faulty, g, m)
%CHOOSE_LEADERS  Choose which robots become leaders (ESE 105, Case Study II, Part III).
%
%   S = choose_leaders(G, P0, faulty, g, m)
%
%   Inputs
%     G       n-by-n adjacency matrix of the communication network
%     P0      n-by-2 landing positions; row i is robot i's (x, y)
%     faulty  vector of indices of robots with broken drives
%     g       1-by-2 rally point
%     m       maximum number of leaders
%
%   Output
%     S       vector of at most m distinct robot indices, none of them faulty
%
%   Rules (see Section D.4 of the handout)
%     - Use only the network's structure: anything you can compute from G,
%       P0, faulty and g with the tools from Part I (degrees, hop counts,
%       distances, products and powers of G, ...).
%     - Do NOT simulate the swarm, and do NOT call score_mission.
%     - Must run in under 2 seconds on one deployment.
%     - Do not change the function name or the order of the inputs.
%       Helper functions are allowed, but put them in this file, below
%       this function, so that this single file is all we need to run it.
%
%   Team: Group 27
%   Members: Jack Walker, Andrew Chen, Christopher Munson
%
%   Strategy: We select leaders one at a time by choosing the working robot
%   that is connected to the most robots not "covered for" by a leader.
%   After that assignment, the leader and all of its connected nodes are
%   "covered" and the process repeats. The leaders mimic centroids and
%   cluster the nodes which distributes leaders across the swarm, rather 
%   than concentrating them where their relative impact on group movement 
%   will be minimal.



n = size(G,1);
working = true(n, 1);
working(faulty) = false; %exclude faulty nodes from prospective leader pool
S = []; % no leaders: valid, but scores 0

coverage = (G + eye(n)) > 0; 
%adding the identity matrix lets leaders "cover" themselves
%setting this as an inequality against 0 shouldn't matter unless G is
%wrong, but better safe than sorry

eligible = working; %working robots who are not yet leaders
covered = false(n,1); %leaders, or robots covered by a leader

for step = 1:m
    %if there are no more working leader candidates, abort early!!
    if ~any(eligible)
        break;
    end

    uncovered = working & ~covered;
    
    scores = double(coverage)' * double(uncovered);
    %each candidate for leadership 

    scores(~eligible) = -Inf;
    %disqualify faulty robots and the previously selected leaders from leadership
    %even if they shouldn't be part of the pool it doesn't hurt to have a
    %fail safe
    
   
    candidates = find(scores == max(scores));
    leader = candidates(floor(rand * length(candidates)) + 1);
    %find the strongest candidate. if there's a tie, choose randomly
    %between them
    
    S(end+1) = leader;
    eligible(leader) = false; %remove selected leader from pool

    covered = covered | coverage(:, leader);

    %even if there are no uncovered robots, this loop will continue and
    %select one at random, since their effective degrees will all be 0.

    %in fact, we should always assign 4 leaders to maximize pull even if
    %they don't cover additional nodes.
end



%{

old code

n = size(G, 1);
working = true(n, 1);
working(faulty) = false;

% Most direct Connections, then down the line, excluding those connected.
S = [m, 1];   % no leaders: valid, but scores 0
% S Will track the indices of the robots who are selected to be leaders

Connections = G*ones(n, 1);
for n = 1:m
    if ~any(working)
        Tracker = Connections;
        Tracker(~working) = -Inf;   % Makes sure the faulty ones can't be selected
        [~, i] = max(Tracker);      % Finds the index of the most connected drone
        S(n) = i;                   % Saves the index in S
        Tracker(i) = false;         % Last to make sure that that drone and connected ones can't be chosen for leader.
        Tracker(G(i,:) > 0) = false;
    end
end


end
%}
