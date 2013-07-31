% here, we will load RA_raw_3
load RA_raw_2.mat
raw = RA_raw_2;

% sampling rate is 20 kHz.
t = (1:length(raw)) / 20000;

figure
plot(t, raw)
title('Raw Signal')
ylabel('amplitude')
xlabel('time (s)')

times = get_spike_crossings(raw, 500);
% times refer to the index of the dataset at which a crossing
% occurs.  The sampling rate is 20 kHz, so one index is 1/20
% ms.
times = times / 20;
% Find instaneous rates
rates = 1./diff(times);
% display rates over time
figure
plot(times(1:(length(times)-1)), rates, '+')
ylabel('rate')
xlabel('time (ms)')

% determine sequence of states
upper_threshold = 0.02; % 20 spikes/sec
lower_threshold = 0.005; % 5 spikes/sec
default_state = 2;
intervals = floor(times(length(times)) - times(1)+1);
seq = ones(1, intervals)*default_state;
for t = 2:length(times)
    state = 2;
    if rates(t-1) > upper_threshold
        state = 3;
    else if rates(t-1) < lower_threshold
            state = 1;
        end
    end

    if (state ~= default_state)
        sub_interval = floor((times(t-1):times(t))-times(1)+1);
        max(sub_interval)
        seq(sub_interval) = ones(size(sub_interval)) * state;
    end
end

figure
plot(seq, 'r+')
ylabel('state')
xlabel('time (ms)')

floor(times-times(1)+1)
% determine sequence of outputs
intervals = floor(times(length(times)) - times(1));
outputs = zeros(1,intervals);
outputs(floor(times-times(1)+1)) = 1;
% output values are (0,1}, but hmmestimate expects an
% output index, not the output itself
outputs = outputs + 1;
length(outputs)
length(seq)

[trans, emis] = hmmestimate(outputs, seq);
trans
emis

