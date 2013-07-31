% note that the text has t = 0:0.05:1;
t = 0:0.005:10;
x = [sin(5*t) sin(50*t) sin(100*t)];
windows = [16 64 256 512 1024];
for w=1:length(windows)
    figure
    spectrogram(x, windows(w), 'yaxis');
    t = sprintf('window length = %d', windows(w));
    title(t)
end
