function [res f]= ctrl_winFft(inputSignal,Fs,sampleSize,windows)
%Autor Starokozhev S.V. 18.07.18
% here we estimate FFT transform with multiplication on  window
% 'periodic' is better for analiz of spectrum
% Fs - sample rate
% windows   - window for furier transform
switch windows
    
    case 'hamming'
        w = hamming(sampleSize,'periodic');
       
    case 'blackman'
        w = hann(sampleSize,'periodic');
    case 'hann'
        w = hamming(sampleSize,'periodic');
end
w = w';

arrayOfPlots=[];
lenghtSig=length(inputSignal);
        arrayOfPlots=inputSignal.*w;
% arrayOfPlots=inputSignal;
        [res, f]= ctrl_window_furier(arrayOfPlots,sampleSize,Fs,lenghtSig);
end