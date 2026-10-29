% TESTING FOR TOPOLOGIES

clc;
clear;
addpath("part1\topology\");

P = [ 0 0;
      1 0;
      1 1;
      0 1];  %4 nodes arranged in a square
n = 4;

% Complete

G_complete = make_complete(n);
stats_complete = graph_stats(G_complete);

expected = [0 1 1 1;
            1 0 1 1;
            1 1 0 1;
            1 1 1 0];

fprintf("complete matrix test passed: %d\n", isequal(G_complete, expected));

expected_edges = 6; %1/2 number of connections (12)
expected_diameter = 1;%only 1 hop needed to go anywhere

fprintf("complete edge count test passed: %d\n", stats_complete(3) == expected_edges);
fprintf("complete diameter test passed: %d\n", stats_complete(4) == expected_diameter);
fprintf('\n');

% Star

G_star = make_star(n);
stats_star = graph_stats(G_star);

expected = [0 1 1 1;
            1 0 0 0;
            1 0 0 0;
            1 0 0 0];

fprintf("star matrix test passed: %d\n", isequal(G_star, expected));

expected_edges = 3;
expected_diameter = 2;

fprintf("star edge count test passed: %d\n", stats_star(3) == expected_edges);
fprintf("star diameter test passed: %d\n", stats_star(4) == expected_diameter);

fprintf('\n');

% Disk

G_disk = make_disk(P);
stats_disk = graph_stats(G_disk);

%radius needed should be 1
expected = [0 1 0 1;
            1 0 1 0;
            0 1 0 1;
            1 0 1 0];

fprintf("disk matrix test passed: %d\n", isequal(G_disk, expected));

expected_edges = 4;
expected_diameter = 2;

fprintf("disk edge count test passed: %d\n", stats_disk(3) == expected_edges);
fprintf("disk diameter test passed: %d\n", stats_disk(4) == expected_diameter);

fprintf('\n');

% Ring

G_ring = make_ring(n, P);
stats_ring = graph_stats(G_ring);

%Same expected values as disk
fprintf("ring matrix test passed: %d\n", isequal(G_ring, expected));
fprintf("ring edge count test passed: %d\n", stats_ring(3) == expected_edges);
fprintf("ring diameter test passed: %d\n", stats_ring(4) == expected_diameter);

fprintf('\n');

