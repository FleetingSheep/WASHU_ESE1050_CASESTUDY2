addpath("part1\topology\"); %MATLAB doesn't read those functions as in the folder otherwise

n = 150;
D = make_deployment(100); %arbitrary seed value
P = D.P0;
k = 5; %CHANGE LATER!
r = 1.25; %CHANGE LATER!

G = make_complete(n);
stats_complete = graph_stats(G);

G = make_star(n);
stats_star = graph_stats(G);

G = make_ring(n, k);
stats_ring = graph_stats(G);

G = make_disk(P, r);
stats_disk = graph_stats(G);

stats = [stats_complete', stats_star', stats_ring', stats_disk'];

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