function [V, n, m, h]=hodgkin_huxley(t, I_inj)

l_t=length(t);
d_t=t(2)-t(1);
V=10*ones(1, l_t);
n=V;
m=V;
h=V;
V(1)=-10; 
n(1)=0.0003; 
m(1)=0.0011; 
h(1)=0.9998;

C=1;
g_k_max=36;
g_Na_max=120;
g_L=0.3;
E_K= -12; 
E_Na=115; 
E_L= 10.613; 

for i=1:(l_t-1)
    dn=n_prime(n(i), -V(i));
    dm=m_prime(m(i), -V(i));
    dh=h_prime(h(i), -V(i));
    n(i+1)=n(i)+dn*d_t;
    m(i+1)=m(i)+dm*d_t;
    h(i+1)=h(i)+dh*d_t;
    dV=1/C*(-1*g_k_max*(n(i))^4*(V(i)-E_K) -g_Na_max*(m(i))^3*h(i)*(V(i)-E_Na) -g_L*(V(i)-E_L)+I_inj);
    V(i+1)=V(i)+dV*d_t;
end;
plot(t,V);
xlim([0 max(t)]);
