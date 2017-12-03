close all
clear all
clc

archivo = 'sample1.wav';

[y,Fs] = audioread(archivo);
t = size(y);
duracion = t(1)/Fs;
audioinfo(archivo)

%---------------------------------%
% Efecto echo
%y2 = eco(y, Fs);
%---------------------------------%
% Efecto flanger
%y2 = flanger(y, Fs);
%---------------------------------%
% Espejado
%y2 = espejo(y);
%---------------------------------%
% Modulación de anillo / tremolo
%y2 = robot(y, Fs, 440);
%---------------------------------%
% Wa-Wa
%y2 = wawa(y, Fs);
%---------------------------------%
% Dart Vader
%y2 = dartvader(y, Fs);


%{
%---------------------------------%
% PLOTEO
subplot(2,1,1);
plot(y);
title('Original');

subplot(2,1,2);
plot(y2, 'r');
title('Modificado');

%%{
disp('Escuchando audio original ...');
reproductor = audioplayer(y, Fs);
play(reproductor);

pause(duracion+1);
%%}

disp('Escuchando audio modificado ...');
reproductor = audioplayer(y2, Fs);
play(reproductor);
%}