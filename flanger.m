function y2=flanger(y, Fs)

delay=0.07;
D=ceil(delay*Fs);
largo=size(y);
y2=zeros(largo);

for i=1:1:D+1
   y2(i)=y(i);
end

for i=D+1:1:largo
   delay(i)=abs(round(D*cos(2*pi*i/((largo(1)-D-1)))));
   y2(i)=y(i) + y(i-delay(i));
end