function m = my_mexican_hat(t, params)
sigma = params(1);
m = 1 / (sqrt(2*pi) * sigma^3) * (1 - t.^2/sigma^2) .* exp(-t.^2/(2*sigma^2));
