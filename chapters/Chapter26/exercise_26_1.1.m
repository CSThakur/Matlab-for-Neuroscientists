% generate pmf
lambda = 5;
x = 1:15;
pmf = lambda.^x ./ factorial(x) .* exp(-lambda);
figure
bar(pmf)

% approximate infinity with a large number
% note: too large a number will require an approximation
% to lambda^x/factorial(x)
infinity = 100;
exp_value = 0;
exp_value_2 = 0;
for x = 0:infinity
    poisson = lambda^x/factorial(x)*exp(-lambda);
    exp_value   = exp_value   + x   * poisson;
    exp_value_2 = exp_value_2 + x^2 * poisson;
end
exp_value
var = exp_value_2 - exp_value^2

% generate pmf
lambda = 7;
x = 1:15;
pmf = lambda.^x ./ factorial(x) .* exp(-lambda);
figure
bar(pmf)

% approximate infinity with a large number
infinity = 100;
exp_value = 0;
exp_value_2 = 0;
for x = 0:infinity
    poisson = lambda^x/factorial(x)*exp(-lambda);
    exp_value   = exp_value   + x   * poisson;
    exp_value_2 = exp_value_2 + x^2 * poisson;
end
exp_value
var = exp_value_2 - exp_value^2

