rng(105);
m = 4;
seeds = 1:20; %test across multiple deployments
N = 20;

% Going to create a table with columns for the methods, and rows for
% results

%In order:
%       Random      Highest Degree      Closest     Our Method






scores = (zeros(N, 4)); %record scores for all four methods during each loop of each seed

for trial = 1:N
    D = make_deployment(seed(trial));
    n = size(D.G, 1);

    n = size(G,1);
    working = true(n, 1);
    working(faulty) = false; %exclude faulty nodes from prospective leader pool
    S = [];

    eligible = working; %working robots who are not yet leaders
    covered = false(n,1); %leaders, or robots covered by a leader

    %random
    for i = 1:m
        %S(end + 1) = 
    end

    scores(trial, 1) = score_mission(D, S);

    %highest degree
    scores(trial, 2) = score_mission(D, S);

    %closest
    scores(trial, 3) = score_mission(D, S);

    %our method
    S = choose_leaders(D.G, D.P0, D.faulty, D.g, m);
    scores(trial, 4) = score_mission(D, S);



end

%figure;
%scatter(scores);
%xticklabels({'Random', 'Highest Deg.', 'Closest', 'Our Method'});
%ylabel('Mission Score j');

