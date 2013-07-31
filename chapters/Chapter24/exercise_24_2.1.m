% at any given unit of time, there is a 5% probability
% of acquiring one unit of evidence
prob = 0.05;
threshold = 20;
% new figure
figure
hold on
evidence = model2(prob, threshold);
plot(1:length(evidence), evidence,'b')
evidence = model2(prob, threshold);
plot(1:length(evidence), evidence,'r')
evidence = model2(prob, threshold);
plot(1:length(evidence), evidence,'g')
evidence = model2(prob, threshold);
plot(1:length(evidence), evidence,'k')
evidence = model2(prob, threshold);
plot(1:length(evidence), evidence,'y')
