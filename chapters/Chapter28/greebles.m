function [layer1, layer2,output]=greebles(GoodGreebles, BadGreebles, data)
%[layer1, layer2, output]=greebles(GoodGreebles, BadGreebles, data');


plot3(GoodGreebles(:,1), GoodGreebles(:,2), GoodGreebles(:,3), '.');
hold on;
plot3(BadGreebles(:,1), BadGreebles(:,2), BadGreebles(:,3), '.r');
plot3(data(1,:), data(2,:), data(3,:), '.g');

train_set=cat(2, GoodGreebles', BadGreebles');
target=(cat(2, ones(1, 200), zeros(1, 200)));
%1=Good 0=Bad for layer 1
%For layer 2 when 2 wins it's a Good greeble. When 1 wins it's a Bad
%Greeble
layer1=newlin([0 10; 0 10; 0 10], 1);
layer1.trainParam.goal=0.08;
layer1.trainFcn='trainr';
%plot(GoodGreebles(:,1), BadGreebles(:,1));
%plot(GoodGreebles(:,2), BadGreebles(:,2));
%plot(GoodGreebles(:,3), BadGreebles(:,3));
%From these graphs the biases are roughly 5

%layer1.IW{1,1}; Gives [0 0 0]
layer1.b={-5};
[layer1, training]=train(layer1, train_set, target);
%output=sim(layer1, data);
%layer1.IW{1,1}; For one run gave [0.0497 -0.1043, 0.0569];
layer2=newc([-1 1], 2);
%layer2.IW{1,1}=[0; 0];
layer2.trainParam.epochs=100;
train_set2=sim(layer1, train_set);
layer2=train(layer2, train_set2);
%layer2.IW{1,1}=[-0.1994; 0.6034];

input=sim(layer1, data);
output=sim(layer2, input);
output=vec2ind(output);
%output contains the list of whtat I think are good and bad greebles.
%See the plot for a 3D plot of output