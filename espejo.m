function y2=espejo(y)

L = floor(length(y)/2);
yespejo = zeros(L,1);
yespejo(1:end) = y(1:L);
espejado = flip(yespejo(1:end),1);

y2=[y(1:L); espejado];

end