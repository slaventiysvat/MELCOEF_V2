function sampleInterval= ctrl_getSampleInterval(timeInterval,Fs)
%Fs friquency of discretization
%this function returns the sample size for each signal segment
%time of Interval,  which you want
%The time interval should be written keeping in mind that at milliseconds
%=============================for example==================================
% timeInterval=25;
% Fs=44100
% sampleInterval= ctrl_getSampleInterval(timeInterval,Fs)
%==========================================================================
sampleInterval=floor(Fs*timeInterval*10^-3);
if mod(sampleInterval,2)~=0
    sampleInterval=sampleInterval+1;
end
end