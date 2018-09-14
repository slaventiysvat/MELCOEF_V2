clear
clc
% this function returns the mel-capstr coefficients for each sample in the signal
% signal has length, it contains vectors = length (sample size)
% of the sample size, we have to shield knowing the sampling rate and the period that we need
%==========================================================================
close all
%Open Signal
AnalizStruct.myPath='01-01-01-_AudioTrimmer_com_1_.wav';
AnalizStruct.Y = audioread(AnalizStruct.myPath);
data=audioinfo(AnalizStruct.myPath);
AnalizStruct.stepen=2;
AnalizStruct.new_vector = get_norm_vektor(AnalizStruct.Y,AnalizStruct.stepen);

%Open signal parameters that need to be analyzed
AnalizStruct.timeInterval=25;
AnalizStruct.Fs=data.SampleRate;
AnalizStruct.sampleSize= ctrl_getSampleInterval(AnalizStruct.timeInterval,AnalizStruct.Fs);
AnalizStruct.length_of_signal=length(AnalizStruct.new_vector);
AnalizStruct.WaveName='sym8';%see help wfilters
AnalizStruct.N = wmaxlev(AnalizStruct.length_of_signal,AnalizStruct.WaveName);

%parametres for weivlet analize
AnalizStruct.Select_Level=[100 100 100 100 100 100 100];
AnalizStruct.N=length(AnalizStruct.Select_Level);
AnalizStruct.NN=ctrl_Select_Level_And_Decom(AnalizStruct.N,AnalizStruct.Select_Level);
AnalizStruct.signalAfterWeivlet =  ToneDeNoise(AnalizStruct.new_vector,AnalizStruct.NN,AnalizStruct.WaveName);

%parametres for window furier transform
AnalizStruct.prozent=50;%
AnalizStruct.window = 'hann';
[AnalizStruct.fft_res AnalizStruct.f] = ctrl_windowFFTHamm(AnalizStruct.sampleSize,AnalizStruct.prozent,...
AnalizStruct.signalAfterWeivlet,AnalizStruct.window,AnalizStruct.Fs);% lenghtSig=length(new_wector);

%mel - capstr function
MelStruct.Fl=20;
MelStruct.Fh=AnalizStruct.Fs;
MelStruct.nMelFilt = 20;% quantity filters for MFCC analizing
MelStruct.Fs=AnalizStruct.Fs;
MelStruct = f_melCapstr(MelStruct,AnalizStruct);
%output grafics
gui_meshplot(AnalizStruct.new_vector,MelStruct.fbank,MelStruct.mels,MelStruct.C1,MelStruct.nMelFilt,AnalizStruct.f(1:length(MelStruct.fbank(1,:))),AnalizStruct.Fs);


