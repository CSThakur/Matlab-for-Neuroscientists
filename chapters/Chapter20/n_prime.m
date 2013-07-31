function dn=n_prime(n, V)

k_1=(0.01*(V+10))./(exp((V+10)/10)-1);
k_2=0.125*exp(V/80);

dn=k_1-(k_1+k_2)*n;