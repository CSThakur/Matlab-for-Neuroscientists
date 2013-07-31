function evid = model2(prob, threshold)
    evid = [0];
    last = 1;
    while evid(last) < threshold
        evid = [evid; evid(last) + (rand() < prob)];
        last = last + 1;
    end
end
