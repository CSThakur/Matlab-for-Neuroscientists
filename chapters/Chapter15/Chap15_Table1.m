%Chapter 15 - Matlab for Neuroscientists
%This code recreates Table 15.1 for the sample neuron 
%
%Run code this after running "Chapter15_MergeDatasets.m"
%9-5-08

load Chapter15_Data

n=16; %index of sample neuron, though it is on channel 19
numTrials=length(instruction);

%bin firing rates in second following the instruction
trialEdges=sort([instruction; instruction+1]);
spikeTimes=unit(n).times;
temp=histc(spikeTimes,trialEdges);
spikeCount=temp(1:2:numTrials*2)';

%bin spike counts into three categories for each direction
table=zeros(3,8);
countEdges=[0 20 30 max(spikeCount)+1];
for i = 1:8
    indDir=find(direction==i);
    spikeDir=spikeCount(indDir);
    temp2=histc(spikeDir,countEdges);
    table(:,i)=temp2(1:3);
end