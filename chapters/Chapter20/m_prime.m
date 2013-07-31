function dm=m_prime(m, V)
%This function takes two arguments the membrane potential and the current 
%value of the state variable n, and returns the value of the derivative of 
%n for these values.

%First calculate the values of the forward and backward rate constants, 
%k_1n and k_2n.
k_1=0.1*(V+25)/(exp((V+25)/10)-1);
k_2=4*exp(V/18);

%Next calculate the value of the derivative.
dm=k_1 - (k_1+k_2)*m;
