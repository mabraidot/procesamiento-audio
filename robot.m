function y2=robot(y, Fs, Fc)

index = 1:length(y);
carrier= sin(2*pi*index*(Fc/Fs))';
% Modulación de anillo
y2 = y.*carrier;

end