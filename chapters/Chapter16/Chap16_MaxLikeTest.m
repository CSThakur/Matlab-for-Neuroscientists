%Chapter 16 - Matlab for Neuroscientists
%9-3-08
%This code tests the maximum likelihood algorithm on novel data
%run this after running "Chap16_MaxLikeTrain.m"

load maxLikeData %gives meanFR, stdFR
load Chapter16_CenterOutTest

numTrials=length(instruction);
numNeurons=length(unit);


%compute spike counts for all trials, all neurons
trialEdges=sort([instruction; instruction+1]);
for n=1:numNeurons
        spikeTimes=unit(n).times;
        if ~isempty(spikeTimes)
            %using "histc" to bin the spike times is faster than looping through trials
            temp=histc(spikeTimes,trialEdges);
            spikeCount(n,:)=temp(1:2:numTrials*2)'; %only include spikes within trials, not between them
        else
            spikeCount(n,:)=zeros(1,numTrials);
        end            
end

for t=1:numTrials;
    for d=1:8
        probSpikes(:,d) = normpdf(spikeCount(:,t),meanFR(:,d),stdFR(:,d));
        %probSpikes(:,d) = poisspdf(spikeCount(:,t),meanFR(:,d));
        index = find(~isnan(probSpikes(:,d)));
        temp = probSpikes(index,d);
        %I want to sum logs to avoid multiplying small numbers
        %But I need to avoid NaNs, and zeros
        temp =temp+10e-5;
        logProb(t,d) = sum(log(temp));
    end 
    %maximimze the log-likelihood
    [temp neuralDir(t)] = max(logProb(t,:));
end
correct=sum(neuralDir'==direction)/length(direction)