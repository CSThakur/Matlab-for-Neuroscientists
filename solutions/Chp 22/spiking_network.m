% Created by Eugene M. Izhikevich, February 25, 2003
% Excitatory neurons   Inhibitory neurons

%The number of excitatory neurons in the network.  The mammalian cortex has
%about 4 times as many excitatory nerons as inhibitory ones.
Ne=800;                Ni=200;
re=rand(Ne,1);         ri=rand(Ni,1); 
%This will set the value of a for all excitatory neurons to 0.02 and the
%value of a for inhibitory neurons to a random number between 0.02 and 0.1
a=[0.02*ones(Ne,1);    0.02+0.08*ri];
%This will allow b to range from 0.2-0.25
b=[0.2*ones(Ne,1);     0.25-0.05*ri];
%This will allow the spike reset membrane potential to range between -65
%and -50
c=[-65+15*re.^2;      -65*ones(Ni,1)];
%This will allow the recovery reset value to range between 2 and 8
d=[8-6*re.^2;          2*ones(Ni,1)];
S=[0.5*rand(Ne+Ni,Ne),-rand(Ne+Ni,Ni)]; 

%The following code can be used for the project when asked to create a
%sparser weight matrix.
%Choose a percent of connections to turn off.
%percent_off=0.7; This is an extreme example with 70% of the connections
%abolished.
%connections=randperm((Ne+Ni)^2);
%connections=connections(1:(floor(percent_off*length(connections))));
%for i=1:length(connections)
%    S(connections(i))=0;
%end;

%The initial values for v and u
v=-65*ones(Ne+Ni,1);  % Initial values of v
u=b.*v;               % Initial values of u
%Firings will be a two-column matrix.  
%The first column will indicate the time (1-1000) 
%that a neuron’s membrane potential crossed 30, and 
%the second column %will be a number between 1 and Ne+Ni 
%that identifies which neuron fired at that %time.
%firings=[];
firings=[];           % spike timings

for t=1:1000          % simulation of 1000 ms 
   %Create some random input external to the network
   I=[5*randn(Ne,1);2*randn(Ni,1)]; % thalamic input 
   %Determine which neurons crossed threshold at the 
   %current time step t. 
   fired=find(v>=30); % indices of spikes
   if ~isempty(fired)  
      %Add the times of firing and the neuron number to firings. 
      firings=[firings; t+0*fired, fired];
      %Reset the neurons that fired to the spike reset membrane potential and   
      %recovery variable.
      v(fired)=c(fired);  
      u(fired)=u(fired)+d(fired);
      %strengths of all other neurons that fired in the last time step connected to that 
      %neuron.
      I=I+sum(S(:,fired),2);
   end;
   %Move the simulation forward using Euler’s method.
   v=v+0.5*(0.04*v.^2+5*v+140-u+I);
   v=v+0.5*(0.04*v.^2+5*v+140-u+I);
   u=u+a.*(b.*v-u);   
end;
%Plot the raster plot of the network activity.
plot(firings(:,1),firings(:,2),'.');