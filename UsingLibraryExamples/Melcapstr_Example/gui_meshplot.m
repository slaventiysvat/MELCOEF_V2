 function gui_meshplot(new_wector,fbank,gg,C1,nMelFilt,f,Fs)

figure
   subplot(221)
T = 1/Fs;             % Sampling period       
L = length(new_wector); % Length of signal
t = (0:L-1)*T;        % Time vector
plot(t,new_wector);
xlabel('Time,s');
ylabel('(A(t)');
title('Input sugnal');
   subplot(222)
   plot(f,  fbank(1,:));
   title(['triangular filter bank N=', num2str(nMelFilt)]);
   xlabel('frequency scale F');
   ylabel('(A(t)');
   hold on
   for i=2:1:nMelFilt
       plot(f,  fbank(i,:));
   
   end      
    grid on
% 
    subplot(223)
    mesh(gg);
    view([90 0]);
    title('Mel coefficients')
%     xlabel('Номер коеффициента, k');
%     ylabel('Номер семпла, N');
    zlabel('(A(t)');
    subplot(224)
    mesh(C1);
%     xlabel('Номер коеффициента, k');
%     ylabel('Номер семпла, N');
    zlabel('(A(t)');
    view([90 0]);
    title('Mel-Capstr coefficients')
 end
