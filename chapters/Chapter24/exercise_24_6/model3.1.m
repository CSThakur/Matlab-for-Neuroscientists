function c = model3(prob, upper_threshold, lower_threshold, t)

% evidence tracks the accumulated evidence for
% each choice
total_evidence = 0;

while (t > 0 && total_evidence > lower_threshold && total_evidence < upper_threshold)
    % +1 for rand() below prob and -1 for rand() above
    evidence = ((rand() < prob) * 2 - 1);
    total_evidence = total_evidence + evidence;
    t = t - 1;
end

upper_distance = abs(upper_threshold-total_evidence);
lower_distance = abs(lower_threshold-total_evidence);
if (upper_distance < lower_distance)
    c = 1;
else if (upper_distance > lower_distance)
        c = 2;
    else
        c = ceil(rand()*2);
    end
end