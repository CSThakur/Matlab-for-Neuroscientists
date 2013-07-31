%This program is designed to tell the difference between a male and female
%(or at least Pascal and Kira's respective) voice. It will first train a
%feed-forward 5-layer non-linear neural network to tell the difference
%between training sounds and then use that trained set to tell the
%difference between two test sets.

%We'll start by importing all the data we'll be analyzing (make sure all
%data files listed below are in the working directory

KT1 = wavread('Kira_Training1.wav');
KT2 = wavread('Kira_Training2.wav');
KT3 = wavread('Kira_Training3.wav');
PT1 = wavread('Pascal_Training1.wav');
PT2 = wavread('Pascal_Training2.wav');
PT3 = wavread('Pascal_Training3.wav');

T1 = wavread('Test1.wav');
T2 = wavread('Test2.wav');

%Now we'll load the spectrograms of each of the wav files into matrices

KT1spec = real(specgram(KT1));
KT2spec = real(specgram(KT2));
KT3spec = real(specgram(KT3));
PT1spec = real(specgram(PT1));
PT2spec = real(specgram(PT2));
PT3spec = real(specgram(PT3));

T1spec = real(specgram(T1)); %Load in the Test set as well
T2spec = real(specgram(T2));

ki = length(KT1spec)+length(KT2spec)+length(KT3spec);
pa = length(PT1spec)+length(PT2spec)+length(PT3spec);

%Concatenate data
testgram = [KT1spec KT2spec KT3spec PT1spec PT2spec PT3spec];
testgram = testgram';
testdat = [T1spec T2spec];
testdat = testdat';

%Create target for the network the first ki data points correspond to Kira
%the remaining data correspond to Pascal
target = cat(2, zeros(1,(ki)),ones(1,pa)); %Define target for Kira's (first 1437) and Pascal's (last 1275) data in the concatonated set 'input'

%We finally decided that principle component analysis was necessary to
%accurately find an input data set that the network could learn to
%differentiate.
[COEFF, SCORE, LATENT] = princomp(testgram);
[COEFF2, SCORE2, LATENT2] = princomp(testdat);


%Here we didn't plot the principle component because when we looked at it
%the variability was high for both Kira and Pascal and it didn't seem to
%help cluster the data
plot3(SCORE(1:ki,4),SCORE(1:ki,2),SCORE(1:ki,3),'r.'); %Plot the results of the PCA analysis...the first component is merely amplitude and shows no differences by inspection, so we'll use components 2 and 3 
hold on
plot3(SCORE(ki+1:pa+ki,4),SCORE(ki+1:pa+ki,2),SCORE(ki+1:pa+ki,3),'b.');
xlabel('4');
ylabel('2');
zlabel('3');
legend('kira','pascal')

%We use the data transformed along the 2 through 4th primary components of
%the test data to train the network. This idea was first implemented by
%Adam, so he deserves all the credit.
input = SCORE(:,2:4); 
input = input';
testin = SCORE2(:,2:4);
testin = testin';

%from here on out use Matlab version 7.4 (otherwise newff doesn't work)

%Create a five layer feed forward network with 3 layers using nonlinear
%tan(sigmoid) function and two layers using a linear weghting scheme
net = newff([-77 78 ; -77 78; -77 78],[10,6,4,2,1],{'tansig','tansig','tansig','purelin','purelin'},'traingdm'); %Creat a new three layer neural network with 10, 5 and 2 neurons in the respective layers 1-3
net = init(net); %randomly initialize input weights
net.trainParam.epochs = 1000; %Train for a max of 1000 epochs
net.trainParam.goal=0.08; %set least acceptable least squares error
[net,perf] = train(net,input,target); %train the network
%Obtain the results for the trained data
output1 = sim(net,input); 
%plot(output1)
%We noticed that the output of the network took on lower values for Kira
%than for Pascal, so we decided to define a threshold of how many times the
%output of the network dropped below a particular value and assign output
%that crossed the threshold more than a certain muber of times to Kira and
%otherwise assign the data to Pascal
counterk = 0;
counterp = 0;


%How many times does Kira's data cross 0.2
for i = 1:ki
    if output1(i) < 0.2;
        counterk = counterk + 1;
    end
end
%Same but for Pascal.

for i = ki+1:ki+pa
    if output1(i) < 0.2;
        counterp = counterp + 1;
    end
end
%Normalize the two number of crossings be the size of the data set.
normck = counterk/ki;
normcp = counterp/pa;

%Create a threshold equal to the average of the two normalized crossings.
%If a data set crosses the threshold more than the average than assign the
%data set to Kira otherwise assign it to Pascal.

thresh = .5*(normck+normcp);
%Run the 2-4 principle components of the test data through the network
output = sim(net,testin);
%Repeat calculation for normalized number of crossings for the two test
%data sets
countert1 = 0;
countert2 = 0;

for i = 1:length(T1spec);
    if output(i) < 0.2;
        countert1 = countert1 + 1;
    end
end

for i = (length(T1spec)+1):(length(T1spec)+length(T2spec))
    if output(i) < 0.2;
        countert2 = countert2 + 1;
    end
end
%Normalized crossings
normtc1 = countert1/length(T1spec);
normtc2 = countert2/length(T2spec);

if normtc1 > thresh
    display('T1 is Kira');
else
    display('T1 is Pascal');
end

if normtc2 > thresh
    display('T2 is Kira');
else
    display('T2 is Pascal');
end

%The final results were 
%T1 is Kira
%T2 is Pascal
%which was correct. Most importantly, the threshold was 0.03 and the
%normalized crossings for Pascal was 0.005 while for Kira it was 0.11, so
%there was 2 orders of magnitude difference in the metric for Kira and
%Pascal with the threshold lying one order of magnitude away from each.