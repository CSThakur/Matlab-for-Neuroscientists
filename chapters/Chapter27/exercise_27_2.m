n = 10;
p = 0.5;

k = 0:n;

C = factorial(n) ./ (factorial(k) .* factorial(n-k));
% note: equation 27.1 should read as follows
pmf = C .* p.^k .* (1-p).^(n-k);
pmf
figure
bar(k, pmf)
ylabel('probability')
xlabel('successes')

