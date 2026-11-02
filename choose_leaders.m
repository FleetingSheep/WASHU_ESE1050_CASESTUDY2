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
%   Strategy (2-3 sentences describing your rule, in words):
%   <describe it here>



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
