%Chapter 15 - Matlab for Neuroscientists
%This code merges the datasets from Chapter 13 and Chapter 16.
%9-5-08

load Chapter16_CenterOutTest
direction2=direction;
go2=go;
instruction2=instruction;
unit2=unit;

load Chapter13_CenterOutTrain
instruction=[instruction; instruction2];
go=[go; go2];
direction=[direction; direction2];
for i =1:143
    unit(i).times=[unit(i).times; unit2(i).times];
end
clear instruction2 direction2 go2 unit2
save Chapter15_Data