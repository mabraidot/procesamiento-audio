function yb=wawa(y, Fs)

% factor de rebote, numero menor disminuye el pasa bandas
dump = 0.08; %0.05;
% frecuencia minima y máxima de corte para el filtro de bandas
minf = 50;
maxf = 3000;
% velodicad de wa-wa
Fw = 2000;



delta = Fw/Fs;
%  Creamos una onda triangular 
Fc = minf:delta:maxf;
while(length(Fc) < length(y) )
    Fc = [ Fc (maxf:-delta:minf) ];
    Fc = [ Fc (minf:delta:maxf) ];
end

% recortamos la onda triangular al tamaño del audio
Fc = Fc(1:length(y));

% los coeficientes de la ecuación diferencial
% se tienen que recalcular cada vez que cambia Fc
F1 = 2*sin((pi*Fc(1))/Fs);

% tamaño del pasa bandas
Q1 = 2*dump;
% creamos vectores vacíos
yh=zeros(size(y));  % pasa altos
yb=zeros(size(y));  % pasa bandas
yl=zeros(size(y));  % pasa bajos

yh(1) = y(1);
yb(1) = F1*yh(1);
yl(1) = F1*yb(1);
% aplicamos la ecuación diferencial a las muestras
for n=2:length(y),
    yh(n) = y(n) - yl(n-1) - Q1*yb(n-1);
    yb(n) = F1*yh(n) + yb(n-1);
    yl(n) = F1*yb(n) + yl(n-1);
    F1 = 2*sin((pi*Fc(n))/Fs);
end
% normalizamos
maxyb = max(abs(yb));
yb = yb/maxyb;

end