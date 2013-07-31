%Project 22.1

%An inhibitory neuron cannot be intrinsically bursting since its membrane
%potential is never set to -55. The parameter "c" is -65 without variation
%for all inhibitory neurons in the network.

%Examining the raster plot should reveal some correlated spiking at the
%beginning of the raster. These columns or correlated activity are
%separated by around 150 msec. This suggests that the network is producing
%oscillations around 7 Hz. This would be consistent with high theta rhythm
%activity. Sometimes the raster plots can show even higher frequency
%correlations later in the raster plot corresponding to gamma band
%oscillations. When we add more intrinsically bursting neurons to the
%network by changing the c inhibitory values to -55 and the d inhibitory
%values to 4, we find that the oscillations at the beginning of the raster
%plot tend to occur a little bit faster (ie 8 Hz) or alpha band rhythms.
%One can also see some high beta or gamma oscillations present in the
%raster plot around 600-700 msec. Not surprisingly, reducing the density of connections in
%the network tends to reduce the temporally correlated network activity,
%thereby abolishing the oscillations seen previously.