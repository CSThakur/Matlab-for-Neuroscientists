
% To load MT.mat into your workspace, use load:

load MT.mat

% This will insert a cell array STS into your workspace.
% The cell array contains twelve vectors of spike time information.
% To extract a single vector of spike times:

N = 2;
times = SDS{N};

% where N ranges from 1..12.

