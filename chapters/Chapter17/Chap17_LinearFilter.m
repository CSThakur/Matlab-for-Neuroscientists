%Chapter 17 - Matlab for Neuroscientists
%9-4-08
%train a linear filter and test it on novel data

load Chap17_ContinuousTrain 

%add a two second lag between kinematics and firing rate
yTrain=kin(3:3103,:);
xTrain=[rate(1:3101,:) ones(3101,1)]; %add vector of ones for baseline
f=inv(xTrain'*xTrain)*xTrain'*yTrain; %create linear filter

load Chap17_ContinuousTest
xTest=[rate(1:3101,:) ones(3101,1)];
yActual=kin(3:3103,:);
yFit= xTest*f; 

%calculate correlation coefficients
temp=corrcoef(yActual(:,1),yFit(:,1));
cc(1)=temp(1,2);
temp=corrcoef(yActual(:,2),yFit(:,2));
cc(2)=temp(1,2);

%calculate root mean squared errors (has units of cm).
rmse(1)=  (sqrt(mean((yActual(:,1)-yFit(:,1)).^2)));
rmse(2)=  (sqrt(mean((yActual(:,2)-yFit(:,2)).^2)));