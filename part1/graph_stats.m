function stats = graph_stats(G)

%the case study technically says graph_stats should only return degree
%vector, edge count, and diameter, but it is much easier to process all
%needed table info here

%init
n = size(G, 1);
I = eye(n);
one = ones(n, 1);

d = G*one; %degree vector, number of robots each robot can hear

edges = 0.5 * one' * G * one; %edge count, total number of links

diameter = Inf; %assume network is disconnected until proven otherwise

%diameter is most relay hops needed to connect any two robots
%we expect 1 for complete, 2 for star, and variable #s for ring/disk

R = 1;

for k = 1:n
    R = R * (I + G);
    R = double(R > 0); % normalize all entries to true/false, then 1/0

    if isequal(R, ones(n)) %if all nodes are connected
        diameter = k;
        break;
    end

end

%processing data

avgDegree = mean(d);
maxDegree = max(d);

stats = [avgDegree, maxDegree, edges, diameter];

end

% Done!