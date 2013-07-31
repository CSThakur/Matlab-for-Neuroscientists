%Chapter 15 - Matlab for Neuroscientists
%This code runs simulations computing bias for 
%an uninformative neuron
%9-5-08

%define constants
numBins=3; %change to 6, 12 for 15.3
numDir=8;
numTrials=[25 50 100 200 400 800];
numSim=30;

for i=1:length(numTrials)
    t=numTrials(i);
    mutInfoAll=[];
    for j=1:numSim
        %generate counts for uninformative neuron
        edges=[0:numBins*numDir]/numBins/numDir; %bin edges for each table entry
        data=rand(t,1); %generate 24 random values between 0 and 1
        count = histc(data,edges); %count how many fall in the bin edges
        count=count(1:numBins*numDir); %ignore the last value (counts values equal to 1).
        count=reshape(count,numBins,numDir); %reformat the table.
        
        %compute information
        joint=count/t;
        %margProd=1/numBins/numDir %each stimulus-response combo equally likely
        margS=sum(joint,1);
        margR=sum(joint,2);
        mutInfo=0;
        for m=1:numBins
            for n=1:numDir
                if joint(m,n)>0
                    mutInfo=mutInfo+joint(m,n)*log2(joint(m,n)/margS(n)/margR(m));
                end
            end
        end
        mutInfoAll=[mutInfoAll mutInfo];
    end
    mutInfoMean(i)=mean(mutInfoAll);
    mutInfoStd(i)=std(mutInfoAll);
end
figure
errorbar(numTrials,mutInfoMean,mutInfoStd)