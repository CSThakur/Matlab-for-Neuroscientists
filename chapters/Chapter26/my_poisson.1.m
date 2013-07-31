function outcome = my_poisson(lambda)
% here, the current outcome is x
x = 0;
outcome = -1;
p = rand()
while (outcome < 0)
    p_x = lambda^x / factorial(x) * exp(-lambda);
    if (p < p_x)
        outcome = x;
    else
        p = p - p_x;
        x = x + 1;
    end
end
