function   [res_val,f]= ctrl_window_furier(input_signal,N,Fs,lenghtAllSignal)
%One-sided Fourier transform and array of frequency
% N,  - lenght one sample
% Fs, - Sample rate
% lenghtAllSignal  - length of all signal
L = N;            
Y = fft(input_signal,N);
P2 = abs(Y/lenghtAllSignal);
P1 = P2(1:L/2);
P1(2:end-1) = 2*P1(2:end-1);
res_val=P1;
f = Fs*(0:(L/2-1))/L;

end