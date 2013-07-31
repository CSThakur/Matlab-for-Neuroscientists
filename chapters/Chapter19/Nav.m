function I=Nav(t, V_hold)

g_Na=120;
m_o= 1;
h_o=0;
m=rk4(@m_prime, t, m_o, V_hold);
h=rk4(@h_prime, t, h_o, V_hold);
I=g_Na*m.*h*V_hold;

plot(t, I);