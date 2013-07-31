function m=morlet(t, params)
sigma = params(1);
sigma_2 = sigma^2;
c_sigma = 1+exp(-sigma_2)-2*exp(-0.75*sigma_2)^-0.5;
m = pi^-0.25*exp(-i*sigma.*t-0.5*t.^2);
