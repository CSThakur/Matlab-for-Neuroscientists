function I=Kv(t, V_hold)

n_o=0;
fhandle=@n_prime;
g_k=36;
n=rk4(fhandle, t, n_o, V_hold);
I=g_k*n*V_hold;

plot(t, I);