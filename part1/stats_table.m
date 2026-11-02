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
    'ColumnName', {'Average Deg.', 'Max Deg.', 'Edge Count', 'Diameter'}, ...
    'RowName', {'Complete', 'Star', 'Ring', 'Disk'}, ...
    'ColumnWidth', {100, 80, 80, 70}, ...
    'Position', [20 20 360 140]);
%graph ends up exceedingly wide if columnwidth and position are not
%set manually

%even though we ended up just using a table in google docs...

A_disk = make_disk(P);
stats_disk = graph_stats(A_disk);

G_disk = graph(A_disk);

figure;
h = plot(G_disk, 'XData', P(:,1), 'YData', P(:,2));
h.NodeLabel = {}; %hides the obnoxious numbered label for each node
axis equal
title('T4 Network Over Robot Positions')



