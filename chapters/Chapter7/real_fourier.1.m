function [a,b] = real_fourier(t, x, n)
% Calculates the first n sine and cosine coefficents for
% the real Fourier series.
interval = t(length(t)) - t(1);
dt = t(2) - t(1);
L = interval / 2;
a = zeros(n,1);
for m = 0:n
    c = cos(pi/L * m * t) * dt;
    a(m+1) = sum(x.* c) / L;
    s = sin(pi/L * m * t) * dt;
    b(m+1) = sum(x.* s) / L;
end
