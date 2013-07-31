function dh=h_prime(h, V)
%This function takes two arguments the membrane potential and the current 
%value of the state variable n, and returns the value of the derivative of 
%n for these values.

%First calculate the values of the forward and backward rate constants, 
%k_1n and k_2n.
k_1=0.07*exp(V/20);
k_2=1/(exp((V+30)/10)+1);

%Next calculate the value of the derivative.
dh=k_1 - (k_1+k_2)*h;