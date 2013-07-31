function Chap13_RasterPlot(neuronNum)
%Chapter 13 - Matlab for Neuroscientists
%Raster plot
%9-2-08
load Chapter13_CenterOutTrain

%choose a default neuron if none specified
if ~exist('neuronNum')
    neuronNum=129;
end

graph = [6 3 2 1 4 7 8 9]; %sets the order to plot graphs in
figure
hold on
for i=1:8
    indDir=find(direction==i); %find trials in a given direction
    numTrials=length(indDir);
    subplot(3,3,graph(i))
    for j =1:numTrials
        %pick one of the following:
        centerTime=go(indDir(j)); %to center on start of movement time
        %centerTime=instruction(indDir(j)); %to center on instruction time

        allTimes=unit(neuronNum).times-centerTime; %center spike times
        spikeTimes=allTimes(allTimes>-1&allTimes<1); %pick 2 seconds around center time

        %plot a line
        for k = 1:length(spikeTimes)
                line([spikeTimes(k) spikeTimes(k)],[j-1 j]);              
        end
    end
    ylim([0 numTrials])
end

 h=subplot(3,3,5);
set(h,'Visible','off')
chanNum=unit(neuronNum).chanNum;
unitNum=unit(neuronNum).unitNum;
text(0.25,0.5,['Chan ' num2str(chanNum) '-' num2str(unitNum)])
    