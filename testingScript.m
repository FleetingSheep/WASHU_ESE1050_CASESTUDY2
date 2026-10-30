% This file contains the means to call each function and test their functionality.

% Testing Swarm:

completeTest = make_complete(6);
statsComplete = graph_stats(completeTest)

starTest = make_star(6);
statsStar = graph_stats(starTest)

ringTest = make_ring(6,1);
statsRing = graph_stats(ringTest)

diskTestMatrix = zeros(6,2);
diskTestMatrix(1,1) = 1;
diskTestMatrix(2,1) = 1;
diskTestMatrix(3,1) = 4;
diskTestMatrix(4,1) = 5;
diskTestMatrix(5,1) = -3;
diskTestMatrix(6,1) = 3;
diskTestMatrix(1,2) = -5;
diskTestMatrix(2,2) = -7;
diskTestMatrix(3,2) = 4;
diskTestMatrix(4,2) = -8;
diskTestMatrix(5,2) = 2;
diskTestMatrix(6,2) = -3;
diskTest = make_disk(diskTestMatrix);
statsDisk = graph_stats(diskTest)

% P = diskTestMatrix;
% r = 1;
% n = size(P, 1);
% s = sum(P.^2, 2); %square each element of P, then add each x and y
% one = ones(1, n);
% I = eye(n);

% delta = s*one + one'*s' - 2*(P*P');