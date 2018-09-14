clear
clc
close all

AnalizStruct.myPath='MyTest.wav';
AnalizStruct.Y = audioread(AnalizStruct.myPath);
data=audioinfo(AnalizStruct.myPath);
AnalizStruct.stepen=2;
AnalizStruct.new_vector = get_norm_vektor(AnalizStruct.Y,AnalizStruct.stepen);

AnalizStruct.timeInterval=25;%time of window
AnalizStruct.Fs=data.SampleRate;
AnalizStruct.sampleSize= ctrl_getSampleInterval(AnalizStruct.timeInterval,AnalizStruct.Fs);
AnalizStruct.length_of_signal=length(AnalizStruct.new_vector);
AnalizStruct.WaveName='sym8';
AnalizStruct.N = wmaxlev(AnalizStruct.length_of_signal,AnalizStruct.WaveName);

AnalizStruct.Select_Level=[100 100 100 100 100 100 100];%number of decomposition
AnalizStruct.N=length(AnalizStruct.Select_Level);
AnalizStruct.NN=ctrl_Select_Level_And_Decom(AnalizStruct.N,AnalizStruct.Select_Level);
AnalizStruct.signalAfterWeivlet =  ToneDeNoise(AnalizStruct.new_vector,AnalizStruct.NN,AnalizStruct.WaveName);

AnalizStruct.prozent=50;%overlap
AnalizStruct.window = 'hann';
[AnalizStruct.fft_res AnalizStruct.f] = ctrl_windowFFTHamm(AnalizStruct.sampleSize,AnalizStruct.prozent,...
    AnalizStruct.signalAfterWeivlet,AnalizStruct.window,AnalizStruct.Fs);


gui_out_graf(AnalizStruct)














