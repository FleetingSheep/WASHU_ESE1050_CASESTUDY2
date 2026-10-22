function make_disk()
%MAKE RING  Build disk (aka radio range) topology adjacency matrix, in
%   which robots can only communicate if within distance r of each other.
%
%   With P the nx2 matrix of positions and s the vector with entries
%   
%   s_i = (x_i)^2 + (y_i)^2
%
%   squared distances matrix = s*1' + 1*s' - 2*P*P'
%
%   Then form G by comparing squared distances to r^2 and subtracting I the
%   identity matrix.