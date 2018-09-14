function NN=ctrl_Select_Level_And_Decom(N,prozent)
%This function prepares the input decomposition settings for the wavelet.
% NN - this matrix has two rows
% first  - is the percentage of the amplitude that the user choose
% second - what levels the user decided to change
%---------------------------for example------------------------------------
% N=7;%here we chose number of decomposition
% prozent = [100 100 100 100 100 100 100];% Numbers for each levels
% % the last level is the lowest frequency, the rightest level 
% %is the highest frequency
% NN=ctrl_Select_Level_And_Decom(N,prozent);
% %output
% 100 100 100 100 100 100 100
%   1  1   1   1   1   1   1
%--------------------------------------------------------------------------
lhg_p=length(prozent);
Correction=zeros(2,N);
%form the filter control array
if lhg_p > N 
    
   error('enter the correct prozent')
    
end
     
if lhg_p==N
    Correction(1,:)=prozent;
end
if lhg_p < N
Correction(1,:)=[prozent zeros(1,N - lhg_p)];
end

for i=1:1:N
    
    if Correction(1,i) > 0
        
        Correction(2,i)=1;
        
    else
        
        Correction(2,i)=0;
        
    end
end
NN(1,:)=Correction(1,:);
NN(2,:)=Correction(2,:);
end