function gui_out_graf(AnalizStruct)


f1=(AnalizStruct.Fs/2)/length(AnalizStruct.fft_res(1,:));

f = f1:f1:AnalizStruct.Fs/2;
y = 1:1:length(AnalizStruct.fft_res(:,1));
t=1/AnalizStruct.Fs:1/AnalizStruct.Fs:length(AnalizStruct.new_vector)/AnalizStruct.Fs;
[X,Y] = meshgrid(f,y);
figure
subplot(221)
plot(t,AnalizStruct.new_vector);
xlabel('time,sec');
ylabel(' A(t)');
legend('signal before weivlet')
subplot(222)
plot(t,AnalizStruct.signalAfterWeivlet);
xlabel('time,sec');
ylabel('A(t)');
legend('signal after weivlet')
subplot(2,2,[3 4])
mesh(X,Y,AnalizStruct.fft_res)
xlabel('F(t)');
ylabel('N');
zlabel('A(t)');
end
