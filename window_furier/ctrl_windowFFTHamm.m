function [fft_res f] = ctrl_windowFFTHamm(sampleSize,prozent,in_signal,window,Fs)
%return window furier transform with overlapping or not.
%window may be Hamming or some anything matlab window function
% prozent - overlap between windows
% in_signal -input signal
% window - window for furier transform
% Fs - Sample rate
%---------------------------for example------------------------------------
% load handel.mat
% filename = 'handel.wav';
% audiowrite(filename,y,Fs);
% clear y Fs
% [input_data,Fs] = audioread('handel.wav');
% timeInterval = 20;
% sampleSize = ctrl_getSampleInterval(timeInterval,Fs);
% prozent=50;
% window='hann';
% [fft_res f] = ctrl_windowFFTHamm(sampleSize,prozent,input_data,window,Fs)
%-------------------------------------------------------------------------
overlap=ctrl_getOverlap(sampleSize,prozent);
if overlap >= sampleSize
    error('enter, please, the overlap is smaller than the sample size');
else
    step=sampleSize-overlap;
end
        lenghtSig=length(in_signal);
        endIterator = lenghtSig/sampleSize;
        a=1;
        startSemple=1;
        endSemple=sampleSize;
        fft_res=[];
        while a<=endIterator

            if a > 1 && a < lenghtSig
                tmp=in_signal(startSemple:endSemple-1);
            elseif a>=lenghtSig
                tmp=in_signal(startSemple:end);
            elseif a == 1
                tmp=in_signal(startSemple:endSemple);
            end
             [res f]= ctrl_winFft(tmp,Fs,sampleSize,window);
             fft_res(a,:)=res;

             if startSemple==1
                 startSemple=0;
             end
                startSemple=startSemple+step;

                endSemple= endSemple+step;
            a=a+1;
        end
end