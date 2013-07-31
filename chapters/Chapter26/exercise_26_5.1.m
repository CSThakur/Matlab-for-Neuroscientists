lambda = 25;
% single spike train
duration = 0.0;
spike_times = [];
while (duration < 10)
  % the mean of an exponential distribution is
  % 1/lambda
  interval = exprnd(1/lambda);
  spike_time = duration + interval;
  spike_times = [spike_times; spike_time];
  duration = duration + interval;
end
figure
% simple trick to plot spike train from times
t = zeros(1,length(spike_times)*4);
t(1:4:length(t)) = spike_times;
t(2:4:length(t)) = spike_times;
t(3:4:length(t)) = spike_times;
t(4:4:length(t)) = spike_times;
x = zeros(1,length(spike_times)*4);
x(2:4:length(x)) = ones(1,length(spike_times));
x(3:4:length(x)) = -0.5*ones(1,length(spike_times));
plot(t,x)

% histogram of multiple trials
trial_count = 0;
trials = [];
while (trial_count < 100)
  spike_times = [];
  duration = 0.0;
  while (duration < 10)
    interval = exprnd(1/lambda);
    spike_times = [spike_times; interval];
    duration = duration + interval;
  end
  trials = [trials; length(spike_times)];
  trial_count = trial_count + 1;
end
trials
figure
hist(trials)
  
