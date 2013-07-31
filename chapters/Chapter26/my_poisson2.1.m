function successes = my_poisson2(lambda)
T = exp(-lambda);
k = 0;
p = 1;
while (p >= T)
    k = k + 1;
    u = rand();
    p = p * u;
end
successes = k - 1; 