% first estimate
lambda = 25*10;
% generate 100 trials
spikes = poissrnd(lambda, 100, 1);
figure
hist(spikes)

% second estimate
events = zeros(1,100);
intervals = 10 * 1000;
for trial = 1:100
    lambda_ms = 25 * 0.001;  
    events(trial) = sum(rand(intervals, 1) < lambda_ms);
end
figure
hist(events)