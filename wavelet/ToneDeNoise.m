function   SignalAfterWeivlet =  ToneDeNoise(input_data,Correction,WaveName)
%Function for wavelet decomposition with specified parameters
% Correction - this matrix has two rows
% first  - is the percentage of the amplitude that the user choose
% second - what levels the user decided to change
% NumbComponent - number of components for decomposition
% input_data - input signal that should to decomposition
% [C,L] = wavedec(input_data,G,WaveName);
% OutputArray = array after decomposition;
% WaveName  - name of window for weivlet transform;
% [Lo_R,Hi_R] = wfilters(type,'r'); - filter for reconstruction of signal
%---------------------------for example------------------------------------
% load handel.mat
% filename = 'handel.wav';
% audiowrite(filename,y,Fs);
% clear y Fs
% [input_data,Fs] = audioread('handel.wav');
% sound(input_data,Fs);
% WaveName='sym8';% help wfilters
% length_of_signal=length(input_data);
% N = wmaxlev(length_of_signal,WaveName);
% Correction=[100 100 100 100 0 0 0];
% SignalAfterWeivlet =  ToneDeNoise(input_data,Correction,WaveName);
% sound(SignalAfterWeivlet,Fs);
%--------------------------------------------------------------------------
NumbComponent=length(Correction);
[OutputArray,L] = wavedec(input_data,NumbComponent,WaveName);
[Lo_R,Hi_R] = wfilters(WaveName,'r');
           
         ArrayConvercion = ctrl_component_weiv(OutputArray,L,NumbComponent,Correction(1,:),Correction(2,:));
               
         SignalAfterWeivlet = waverec(ArrayConvercion,L,Lo_R,Hi_R);
         
        

end








