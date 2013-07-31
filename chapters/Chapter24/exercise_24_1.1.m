% simulate time to choice for 500 choice experiments
trial_count = 500;
trials = zeros(1, 500);
% let us accumulate 1 bit of evidence per time unit
rate = 1;
threshold = 20;
for trial=1:trial_count
    evid = model1(rate, threshold);
    % the length of evid is the length of time
    trials(trial) = length(evid);
end

hist(trials)
