function evid = model1(rate, threshold)
    evid = [0];
    last = 1;
    while evid(last) < threshold
        evid = [evid; evid(last) + rate];
        last = last + 1;
    end
end