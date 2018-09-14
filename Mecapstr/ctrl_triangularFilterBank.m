function fbank = ctrl_triangularFilterBank(Fl,Fh,N,Fs,sampleLength)
%The function return Mel Filrets and Square Filters
%transform frequency to mel 
% fmelL - lower frequency
% fmelH - upper frequencies
% ctrlPointFilt - number of chalk filters
% n - reference points
% FMel - frequency step
nMelFilt=N;
fmelL=1127*log(1 + (Fl / 700) );
fmelH=1127*log(1 + (Fh / 700) );
ctrlPointFilt=nMelFilt + 2;
n=(fmelH-fmelL)/(nMelFilt+1);
FMel=fmelL:n:fmelH;
%
     for k=1:1:ctrlPointFilt

        h(k)=700*((exp(FMel(k)/1127))-1);%Convert frequency to Mel

    end

    %get step point for each filter    
    for i=1:1:ctrlPointFilt
         
        shag(i) = floor((((sampleLength/2) + 1) * h(i)) / Fs);
    
    end
    
k=1;
%--------------------create triangular filterbank--------------------------
fbank=zeros(nMelFilt,floor((sampleLength/2)));
for i=2:1:nMelFilt+1
    f_m_minus = shag(i - 1);
     f_m = shag(i);
      f_m_plus = shag(i + 1);
      
          for k=1+f_m_minus:f_m

          fbank(i - 1, k) = (k - shag(i - 1)) / (shag(i) - shag(i - 1));

          end

          for k=1+f_m:f_m_plus

           fbank(i - 1, k) = (shag(i + 1) - k) / (shag(i + 1) - shag(i));

          end
end
% %========================================================================
%----------uncomment for square windows and comment triangular windows-----
% fbank=zeros(nMelFilt,floor((sampleLength/2)));
% for i=2:1:nMelFilt+1
%     f_m_minus = shag(i - 1);
%      f_m = shag(i);
%       f_m_plus = shag(i + 1);
%       
%           for k=1+f_m_minus:f_m
% 
%           fbank(i - 1, k) = 1;
% 
%           end
% 
%           for k=1+f_m:f_m_plus
% 
%            fbank(i - 1, k) = 1;
% 
%           end
% end


end