function c = forced_choice(probs, thresholds, t)

choice_count = length(probs);
% evidence tracks the accumulated evidence for
% each choice
evidence = zeros(size(probs));

while (t > 0 && all(evidence < thresholds))
    % draw choice_count random numbers at once
    r = rand(size(probs));
    evidence = evidence + (r < probs);
    t = t - 1;
end

% find the choice closest to or above its threshold
max_evidence = max(evidence - thresholds);
best_choice = find((evidence - thresholds) == max_evidence);

% It is possible that multiple thresholds are
% reached at the same time.  In this case,
% the choice is equally likely among those
% options with exceeded thresholds.
pick = ceil(rand() * length(best_choice));
c = best_choice(pick);
end
