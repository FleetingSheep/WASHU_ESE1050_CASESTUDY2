rng(105);
m = 4;
N = 20;

% Going to create a table with columns for the methods, and rows for
% results

%In order:
%       Random      Highest Degree      Closest     Our Method

projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(projectRoot));
%i dont know much about pathing with matlab and this is the only solution
%I found online that works sorry



scores = (zeros(N, 4)); %record scores for all four methods during each loop of each seed

for trial = 1:N %tested across 20 seeds
    D = make_deployment(trial);
    n = size(D.G, 1);
    faulty = D.faulty;

    working = true(n, 1);
    working(faulty) = false; %exclude faulty nodes from prospective leader pool
    S = [];
    worst_score = Inf;

    eligible = working; %working robots who are not yet leaders

    %random
    for i = 1:m
        candidates = find(eligible);
        randomCandidate = candidates(randi(length(candidates))); %grab random candidate
        S(end+1) = randomCandidate;
        eligible(randomCandidate) = false; %remove selected leader from pool
    end

    scores(trial, 1) = score_mission(D, S);   
    S = [];
    eligible = working;
    
    %highest degree
    degrees = D.G*ones(n, 1);
    
    [~, rankedNodes] = sort(degrees, 'descend');
    for i = 1:m
        
        j = 1;
        while ~eligible(rankedNodes(j)) %to avoid leaders or faulties, skip past them
            j = j + 1;
        end
        candidate = rankedNodes(j);
        S(end+1) = candidate;
        eligible(candidate) = false;
        
    end
    scores(trial, 2) = score_mission(D, S);
    eligible = working;
    
    %find worst performance
    if scores(trial,4) < worst_score
        worst_score = scores(trial,4);
        worst_D = D;
        worst_leaders = S;
    end
    
    S = [];
    
    %closest
    for i = 1:m
        candidates = find(eligible);
        distances = sqrt(sum((D.P0(candidates,:) - D.g).^2,2));
        [~, idx] = min(distances);
        candidate = candidates(idx);
        S(end+1) = candidate;
        eligible(candidate) = false;

    end
    scores(trial, 3) = score_mission(D, S);
    S = [];
    eligible = working;

    %our method
    S = choose_leaders(D.G, D.P0, D.faulty, D.g, m);
    scores(trial, 4) = score_mission(D, S);
    
    %find possible worst trial to visualize later


end

figure;
x = 1:size(scores, 2);
jitter = 0.15 * (rand(size(scores)) - 0.5);

plot(x + jitter, scores, 'o', 'MarkerSize', 5);
hold on;
plot(x, mean(scores, 1), 'k_', 'MarkerSize', 12, 'LineWidth', 2, 'Color', 'white');
hold off;

xlim([0.5, size(scores, 2) + 0.5]);
xticks(x);
xticklabels({'Random', 'Highest Deg.', 'Closest', 'Our Method'});
xlabel('Selection Method', 'FontSize', 14);
ylabel('Mission Score j', 'FontSize', 14);
set(gca, 'FontSize', 14);
title('Leader Selection Method Score Comparison')
grid on;

%worst case seed analysis
export_for_viewer(worst_D, worst_leaders, 'swarm.json');

disp('Average scores:');
disp(mean(scores,1));
disp('Worst scores:');
disp(min(scores,[],1));



