function y2=eco(y, Fs)

largo = size(y);
delay = 0.4;
D = delay*Fs; % paso a Hz
y2 = zeros(largo);
for i = D + 1 : 1 : largo;
	y2(i) = y(i) + y(i-D);
end;
