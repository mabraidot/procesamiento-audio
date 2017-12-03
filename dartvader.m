function y2=dartvader(y, Fs)

y2 = y;
y2 = upsample(y2,4);
y2 = downsample(y2,3);

y2 = eco(y2, Fs);
y2 = robot(y2, Fs, 40);

end