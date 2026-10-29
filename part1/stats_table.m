addpath("part1\topology\"); %MATLAB doesn't read those functions as in the folder otherwise

rng(105);
P = [5*rand(50,2); 5*rand(50,2) + [6 0]];
n = 100;

%find radius for disk method so that everything is connected
%to be added...

G = make_complete(n);
stats_complete = graph_stats(G);

G = make_star(n);
stats_star = graph_stats(G);

G = make_ring(n, P);
stats_ring = graph_stats(G);

G = make_disk(P);
stats_disk = graph_stats(G);

stats = [stats_complete; stats_star; stats_ring; stats_disk];

%table:

%           Average Degree      Max Degree      Edge Count      Diameter

%Complete

%Star

%Ring

%Disk


T = uitable(uifigure, ...
    'Data', stats, ...
    'ColumnName', {'Average Degree', 'Max Degree', 'Edge Count', 'Diameter'}, ...
    'RowName', {'Complete', 'Star', 'Ring', 'Disk'}, ...
    'Position', [20 20 560 140]);