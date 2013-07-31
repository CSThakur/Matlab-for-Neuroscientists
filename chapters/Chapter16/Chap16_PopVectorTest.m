%Chapter 16 - Matlab for Neuroscientists
%9-2-08
%This code tests the population vector algorithm on novel data
%run this after running "Chap16_PopVectorTrain.m"

load popVectorData %gives prefDir, param
load Chapter16_CenterOutTest

numTrials=length(instruction);
numNeurons=length(unit);

%compute x and y components of the preferred directions
for n=1:numNeurons
    popX(n)=cos(prefDir(n)); %prefDir is in radians
    popY(n)=sin(prefDir(n));
end

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
            %w(n,:)=spikeCount(n,:); %weighting as described in chapter
            w(n,:)=spikeCount(n,:)-repmat(param(n,1),1,numTrials); %weighting for Exercise 16.2.2
end


%compute predicted direction X and Y components
for t=1:numTrials
    neuralX(t)=popX*w(:,t); %compute sum over combinations of w*popX
    neuralY(t)=popY*w(:,t); %compute sum over combinations of w*popY
end

%convert to a direction in degrees
neuralDir =mod(atan2(neuralY,neuralX)/pi*180,360);

%bin direction into one of eight targets
neuralBinned = zeros(numTrials,1)+nan;
%the degrees wrap around for direction 1
index = find(neuralDir >337.5 | neuralDir <=22.5); 
neuralBinned(index)=1;
angles=[0:45:315];
for i = 2:8
    index = find (neuralDir >angles(i)-22.5 & neuralDir <=angles(i)+22.5);
    neuralBinned(index) = i;
end

%determine accuracy
correct=sum(neuralBinned==direction)/length(direction)