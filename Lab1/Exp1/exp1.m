% Basic program to study the effect of sampling in the domain of signal
% testing

clear;
close all;

% load the data from given .mat file
load('signal_lab1.mat');

% plot the original signal
figure
plot(signal1)
title('Signal1 in Time Domain')
xlabel('Time (ms)')
ylabel('amplitude of signal1')

% 1 sec signal, vector length 1000
% Therefore 1000 samples per sec
% Therefore sampling freq = 1000 Hz
Fs = 1000;      % Sampling frequency

L = length(signal1);    % length of signal


Y = fft(signal1);    % frequency domain signal complex domain

P2 = abs(Y/L);      % frequency domain signal converted to real domain

% The above one is a two sided spectrum of the signal
% we need to convert it into a one sided spectrum.
P1 = P2(1:L/2+1);

% adding the amplitude of the other side of the spectrum
P1(2:end-1) = 2*P1(2:end-1);

% frequency range, single side spectrum
f = Fs*(0:(L/2))/L;

% plot the signal in frequency domain
figure
plot(f,P1)    
title('Signal1 in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('amplitude of signal1')