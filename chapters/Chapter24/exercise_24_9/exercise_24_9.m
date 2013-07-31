phi = zeros(1000, 1000); 
dt = 0.001; % time from 0 to 1 sec 
dx = 0.05; % space from 0 to 50 
D=0.5; 
B=0.05;
phi(1,400) = 1; % initial condition 
for t = 1:999 
for x = 2:999 
  term1 = B*dt/dx*(phi(t,x+1)-phi(t,x));
  term2 = D*dt/dx^2*(phi(t,x+1)-2*phi(t,x)+phi(t,x-1));
  phi(t+1,x) = term1 + term2 + phi(t,x);
end 
end 

