close all
clear all
clc

segundos = 3;
Fs = 44100;
grabadora = audiorecorder(Fs, 8, 1);

timer = 1;
grabadora.TimerPeriod = 0.9;
grabadora.TimerFcn = 'disp(timer);timer=timer+1;';
grabadora.StartFcn = 'disp(''Grabando ...'')';
grabadora.StopFcn = 'disp(''Fin de la grabación.'')';

sprintf('Grabando %d segundos', segundos)
recordblocking(grabadora, segundos);

y3 = getaudiodata(grabadora);
audiowrite('sample.wav', y3, Fs);
play(grabadora);
plot(y3);
